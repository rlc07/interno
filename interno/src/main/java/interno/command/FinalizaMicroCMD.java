/**
 * 
 */
package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.ComputadorBO;
import interno.modelo.Computador;

/**
 * @author Ronaldo
 *3 de abr de 2017
 */
public class FinalizaMicroCMD implements Command, Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private ComputadorBO bo;
	private String proximo="";

	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		proximo = "privado/usuario/chamado-computador.jsp";
		bo = new ComputadorBO();
		
		String idMicro = request.getParameter("idMicro_finaliza");
		String motivo = request.getParameter("motivo");
		
		try{
			Computador pc = bo.recuperaPorID(Integer.parseInt(idMicro));
			pc.setStatus("finalizado");
			pc.setMotivo(motivo);
			
			if(bo.atualizarMicro(pc)){
				PrintWriter pw = response.getWriter();
				pw.print("true");
				pw.flush();
				pw.close();
			}
			
		}catch (Exception e) {
			System.out.println("Erro ao recuperar id do micro - finaliza micro: "+e.getMessage());
		}
		
		return proximo;
	}

}
