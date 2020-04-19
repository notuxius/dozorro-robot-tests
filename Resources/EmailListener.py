import logging
import smtplib
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart

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

        elif extracted_email_provider == "ya.ru" or "yandex.ru":
            smtp_addr_port = "smtp.yandex.com:587"

        return smtp_addr_port

    def start_suite(self, name, attrs):
        self.build_in = BuiltIn()
        self.to_addrs = self.build_in.get_variable_value("${SEND_TO_EMAIL}")
        self.from_addr = self.build_in.get_variable_value("${USER_LOGIN}")
        self.password = self.build_in.get_variable_value("${USER_PASS}")
        self.log_file_name = self.build_in.get_variable_value("${LOG FILE}")
        self.report_file_name = self.build_in.get_variable_value("${REPORT FILE}")
        self.smtp_addr_port = self.extract_email_provider(self.from_addr)

    def read_and_attach_file(self, ra_file_name):
        with open(ra_file_name, "rb") as ra_file_var:
            att = MIMEApplication(ra_file_var.read(), _subtype="html")
            att.add_header(
                "Content-Disposition",
                "attachment",
                filename=str(ra_file_name.split("\\")[-1:][0]),
            )

        return att

    def send_mail(
        self,
        log_file_name,
        report_file_name,
        from_addr,
        password,
        to_addrs,
        smtp_addr_port,
    ):
        logging.basicConfig(format="%(levelname)s:%(message)s")
        logging.info("Preparing to send email message")
        server = smtplib.SMTP(smtp_addr_port)

        logging.info("Creating email message")
        msg = MIMEMultipart()
        msg["Subject"] = "Dozorro Automation Status"
        msg["From"] = from_addr
        msg["To"] = to_addrs

        logging.info("Attaching log and report files to email message")
        msg.attach(self.read_and_attach_file(log_file_name))
        msg.attach(self.read_and_attach_file(report_file_name))

        logging.info("Creating secure connection")
        server.starttls()

        logging.info("Logging into email server")
        server.login(from_addr, password)

        logging.info("Sending email message")
        # TODO send two files linked
        server.sendmail(from_addr, to_addrs, msg.as_string())

    def close(self):
        self.send_mail(
            self.log_file_name,
            self.report_file_name,
            self.from_addr,
            self.password,
            self.to_addrs,
            self.smtp_addr_port,
        )
