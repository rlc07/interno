/**
 * 
 */
package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import interno.bo.ComputadorBO;
import interno.modelo.Computador;

/**
 * @author Ronaldo
 *2 de abr de 2017
 */
public class VizualizaMicroCMD implements Command, Serializable {

	
	private static final long serialVersionUID = -1103810960587609604L;

	private ComputadorBO bo;
	private String proximo = "";
	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		bo = new ComputadorBO();
		proximo="/privado/usuario/chamado-computador.jsp";
		
		 Gson gson = new Gson();
		  String id = request.getParameter("idMicro");
		  
		  List<Computador> lista = null;
		  
		  try{
			 lista = bo.listaMicroPorID(Integer.parseInt(id));
			 
			 String aux = gson.toJson(lista);
			 
			 PrintWriter out = response.getWriter();
				out.print(aux);
				out.flush();
				out.close();

		  }catch (Exception e) {
			System.out.println("Erro ao recuperar micro por ID: "+e.getMessage());
		}
		  
		  
		 
		return proximo;
	}

}
