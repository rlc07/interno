/**
 * 
 */
package interno.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Ronaldo
 *18 de mar de 2017
 */
public interface Command{
	
	public String execute(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException;

}
