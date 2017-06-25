/**
 * 
 */
package interno.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

/**
 * @author Ronaldo
 *8 de abr de 2017
 */
public class EnviaEmail {
	
	
	public void enviaEmail(String mensagem, String emailDestino, String assunto){
		
		
		
		HtmlEmail email = new HtmlEmail();
		email.setSSLOnConnect(true);
		email.setHostName( "pop.gmail.com" );
		email.setSmtpPort(995);
		email.setAuthentication("atic.campinas@gmail.com", "atic0695");
		try {
		    email.setFrom( "sme.chamados@campinas.sp.gov.br");
		     
		    email.setDebug(true); 
		     
		    email.setSubject(assunto);
		    email.setHtmlMsg(mensagem);
		    email.addTo( emailDestino );
		     
		    email.send();
		     
		} catch (EmailException e) {
		    e.printStackTrace();
		}
     }
	}


