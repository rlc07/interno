/**
 * 
 */
package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interno.bo.ChamadoTabletBO;
import interno.bo.ChamadoVisitaBO;
import interno.bo.UsuarioBO;
import interno.modelo.ChamadoTablet;
import interno.modelo.ChamadoVisita;
import interno.modelo.Usuario;

/**
 * @author Ronaldo
 *28 de mar de 2017
 */
public class VizualizaVisitaTecnicaCMD implements Command{

	private String proximo = "";
	private ChamadoVisitaBO bo;
	private UsuarioBO userBO;
	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		proximo = "privado/usuario/chamado-visita.jsp";
		bo = new ChamadoVisitaBO();
		userBO = new UsuarioBO();
		
		String numChamado = request.getParameter("numero-chamado-interno");
		String idUsuario = request.getParameter("idUsuario");
		String user = request.getParameter("userVisita");
		ChamadoVisita recuperaDados = null;
		
		List<ChamadoVisita> lista = null;
		List<Usuario> listaUserAtivo = null;
		int id = 0;
		try{
         
			lista = bo.listarNumChamado(numChamado);

			if(!lista.isEmpty()){
				id = 0;
				for(ChamadoVisita vt : lista){
					id = vt.getId();
				}
			}
			
			if(idUsuario == null || idUsuario == ""){
				
				recuperaDados = bo.recuperaId(id);
				
				
				/*Recupera dados da instituição*/
				request.setAttribute("escola", recuperaDados.getInstituicao().getNome());
	
				/*Recuera dados do solicitante*/
				request.setAttribute("nome", recuperaDados.getNome_solicitante());

				/*Recuera dados do tablet*/
				request.setAttribute("usuario", recuperaDados.getUsuario());
				request.setAttribute("problema", recuperaDados.getDesc_problema());
				
				request.setAttribute("dt_cadastro", recuperaDados.getDt_cadastro());
				request.setAttribute("hora_cadastro", recuperaDados.getHora_cadastro());
				
				request.setAttribute("dt_visita", recuperaDados.getDt_visita());
                
			    request.setAttribute("chamado", numChamado);		
			    
			    
			    if(recuperaDados.getTecnicoAtt() == null){
			    	 request.setAttribute("userVisita",null);
			    }else{
			    	 request.setAttribute("userVisita", recuperaDados.getUsuarioVisita());
			    }
			   
			    
			    System.out.println(recuperaDados.getUsuarioVisita());
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				
				listaUserAtivo = userBO.listaUserSistemaAtivo();
			    request.setAttribute("usuarioAtivo", listaUserAtivo);		

			

			  
			}else{
				recuperaDados = bo.recuperaId(id);
				
				HttpSession session = request.getSession();
				Usuario userSession = (Usuario) session.getAttribute("usuarioLogado");
				
				recuperaDados.setTecnicoAtt(userSession);
				
				/*data de inicio - Sistema*/
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				Date date = new Date();
				String dt_visita = df.format(date);			
				recuperaDados.setDt_visita(dt_visita);
				
				recuperaDados.setStatus("em atendimento");
				
				if(bo.atualizar(recuperaDados)){
					PrintWriter pw = response.getWriter();
					pw.print("true");
					pw.flush();
					pw.close();
				}
				
			}
		
		}catch (Exception e) {
			System.out.println("Erro ao listar chamado de visita por numero de chamado interno: " +e.getMessage());

		}
		
		return proximo;
	}
}
