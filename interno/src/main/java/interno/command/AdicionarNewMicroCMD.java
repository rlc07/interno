/**
 * 
 */
package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.ChamadoMicroBO;
import interno.modelo.ChamadoComputador;
import interno.modelo.Computador;

/**
 * @author Ronaldo
 *3 de abr de 2017
 */
public class AdicionarNewMicroCMD implements Command, Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private ChamadoMicroBO cmBO;
	private String proximo = "";

	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		proximo = "privado/usuario/chamado-computador.jsp";
		cmBO = new ChamadoMicroBO();
		
		String idChamado = request.getParameter("idChamado");
		String patrimonio = request.getParameter("patrimonio_new");
		String nf = request.getParameter("nf_new");
		String tipo_micro = request.getParameter("tipo_micro_new");
		String desc_problema = request.getParameter("desc_problema_new");
		String backup = request.getParameter("backup_new");
		
		List<ChamadoComputador> lista = null;
		int id = 0;
		
		try{
			lista = cmBO.listaPorInterno(idChamado);
			
			for(ChamadoComputador chamadoPC : lista){
				id = 0;
				id = chamadoPC.getId();
			}
			
			ChamadoComputador chamadoComputador = cmBO.recuperaPorID(id);
			System.out.println(chamadoComputador.getStatus());
			
		    if(!chamadoComputador.getStatus().equals("fechado")){
		    	
		    	List<Computador> listaComputador = chamadoComputador.getComputador();
				
				Computador computador =  new Computador();
				computador.setPatrimonio(patrimonio);
				computador.setNota_fiscal(nf);
				computador.setTipo_micro(tipo_micro);
				computador.setDesc_problema(desc_problema);
				computador.setBackup(Boolean.parseBoolean(backup));
				computador.setStatus("aguardando");
				
				listaComputador.add(computador);
				
				chamadoComputador.setComputador(listaComputador);
				
				if(cmBO.atualiza(chamadoComputador)){
					PrintWriter pr = response.getWriter();
					pr.print("true");
					pr.flush();
					pr.close();
				}
		    }
			
		}catch (Exception e) {
         System.out.println("Erro ao cadastrar novo micro: "+e.getMessage());
		}
		
		
		
		return proximo;
	}

}
