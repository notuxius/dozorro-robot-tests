import time
import smtplib

from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication

from robot.libraries.BuiltIn import BuiltIn


class EmailListener:

    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self):
        self.smtp_addr_port = ""

    def extract_email_provider(self, from_addr):
        smtp_addr_port = ""
        extracted_email_provider = from_addr.split("@")[1]

        if extracted_email_provider == "gmail.com":
            smtp_addr_port = "smtp.gmail.com:587"

        elif extracted_email_provider == "ya.ru":
            smtp_addr_port = "smtp.yandex.ru:587"

        return smtp_addr_port

    def start_suite(self, name, attrs):
        self.build_in = BuiltIn()
        self.to_addrs = self.build_in.get_variable_value("${SEND_TO_EMAIL}")
        self.from_addr = self.build_in.get_variable_value("${USER_LOGIN_AND_FB_EMAIL}")
        self.password = self.build_in.get_variable_value("${USER_LOGIN_EMAIL_PASS}")
        self.logfilename = self.build_in.get_variable_value("${LOG FILE}")
        self.reportfilename = self.build_in.get_variable_value("${REPORT FILE}")
        self.smtp_addr_port = self.extract_email_provider(self.from_addr)

    def sendmail(
        self, logfilename, reportfilename, from_addr, password, to_addrs, smtp_addr_port
    ):
        # TODO move variables to self
        # Send email with attached report file
        # TODO replace print with logger ro message
        print("Preparing to send email message")
        server = smtplib.SMTP(smtp_addr_port)

        print("Creating email message")
        msg = MIMEMultipart()
        msg["Subject"] = "Dozorro Automation Status"
        msg["From"] = from_addr
        msg["To"] = to_addrs

        print("Attaching log and report files to email message")
        # TODO also attach img files
        with open(logfilename, "rb") as lfp:
            latt = MIMEApplication(lfp.read(), _subtype="html")

        latt.add_header("Content-Disposition", "attachment", filename=logfilename)
        msg.attach(latt)

        with open(reportfilename, "rb") as rfp:
            ratt = MIMEApplication(rfp.read(), _subtype="html")

        ratt.add_header("Content-Disposition", "attachment", filename=reportfilename)
        msg.attach(ratt)

        print("Creating secure connection")
        server.starttls()

        print("Logging into email server")
        server.login(from_addr, password)

        print("Sending email message")
        # TODO send two files linked
        server.sendmail(from_addr, to_addrs, msg.as_string())

    def close(self):
        self.sendmail(
            self.logfilename,
            self.reportfilename,
            self.from_addr,
            self.password,
            self.to_addrs,
            self.smtp_addr_port,
        )
