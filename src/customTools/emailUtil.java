package customTools;

import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.Sporder;

public class emailUtil {
	public static void sendEmail(String to, String from, String subject, String body){
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtps.host", "smtp");
		props.put("mail.smtps.port", 8081);
		props.put("mail.smtps.auth", "false");
		props.put("mail.smtps.quitwait", "false");
		//NOTE: Session object is part of javax.mail.Session
		javax.mail.Session session = javax.mail.Session.getDefaultInstance(props);
		session.setDebug(true);

		try{
			Message message = new MimeMessage(session);
			message.setSubject(subject);
				message.setText(body);

			Address fromAddress = new InternetAddress(from);
			Address toAddress = new InternetAddress(to);
			message.setFrom(fromAddress);
			message.setRecipient(Message.RecipientType.TO, toAddress);

			Transport transport = session.getTransport();
			transport.connect();
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		}
		catch (Exception e){
			System.out.println(e);
		}
	}
	
	public static String getRandomPassword() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 7) {
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
    }
	
	public static void emailCart(String to, List<Sporder> cart){
		String from = "donotreply@samazon.com";
		String subject = "Samazon items awaiting checkout";
		StringBuilder body = new StringBuilder("The following items are waiting in your cart:");
		for(Sporder o:cart){
			body.append("\n - "+o.getSpproduct().getProductname());
		}
		body.append("\nVisit http://localhost:8080/Samazon/login.jsp to complete your purchase");
		emailUtil.sendEmail(to, from, subject, body.toString());
	}
}
