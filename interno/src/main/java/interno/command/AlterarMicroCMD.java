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
 *2 de abr de 2017
 */
public class AlterarMicroCMD implements Command, Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private ComputadorBO bo;
	private String proximo = "";
	
	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		proximo = "privado/usuario/chamado-computador.jsp";
		bo = new ComputadorBO();
		
		String patrimonio = request.getParameter("patrimonio");
		String nf = request.getParameter("nf");
		String tipo_micro = request.getParameter("tipo_micro");
		String localizacao = request.getParameter("localizacao");
		String desc_problema = request.getParameter("desc_problema");
		String idMicro = request.getParameter("idMicro");
		String backcup = request.getParameter("backcup");
		String tipo_patri = request.getParameter("tipo_patri");
		
		Computador pc = null;
		try{
			
			pc = bo.recuperaPorID(Integer.parseInt(idMicro));
			
			pc.setTipo_micro(tipo_micro);
			pc.setLocalizacao(localizacao);
			pc.setDesc_problema(desc_problema);
			
		
			if(tipo_patri.equals("1")){
				pc.setNota_fiscal(nf);
				pc.setPatrimonio("");
			}else if(tipo_patri.equals("2")){
				pc.setPatrimonio(patrimonio);
				pc.setNota_fiscal("");
			}
			
			if(backcup.equals("false")){
				pc.setBackup(false);
			}else if(backcup.equals("true") || backcup.equals("")){
				pc.setBackup(true);
			}
			
			if(bo.atualizarMicro(pc)){
				PrintWriter pw = response.getWriter();
				pw.print("true");
				pw.flush();
				pw.close();
			}
			
		}catch (Exception e) {
          System.out.println("Erro ao alterar micro: "+e.getMessage());
		}
		
		return proximo;
	}

}
