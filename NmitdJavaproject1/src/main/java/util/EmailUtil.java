package util;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class EmailUtil {

    public static void sendOfficerCredentials(
            String toEmail,
            String username,
            String password) {

        final String fromEmail = "designncode07@gmail.com";
        final String appPassword = "udhh jhfw zion dsrf";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
            new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, appPassword);
                }
            });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, "OCMS Admin"));
            message.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(toEmail)
            );

            message.setSubject("Your OCMS Officer Login Credentials");

            String emailContent = """
                Hello Officer,

                You have been registered as an Officer in
                Online Complaint Management System (OCMS).

                🔐 Login Credentials:
                Username: %s
                Password: %s

                🔗 Login URL:
                http://localhost:8080/YourProject/AdminLogin.jsp

                ⚠️ Please change your password after first login.

                Regards,
                OCMS Admin Team
                """.formatted(username, password);

            message.setText(emailContent);

            Transport.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
