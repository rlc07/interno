/**
 * 
 */
package interno.command;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.ChamadoMicroBO;
import interno.bo.ManutencaoMicroBO;
import interno.modelo.ChamadoComputador;
import interno.modelo.Computador;
import interno.modelo.ManutencaoMicro;
import interno.util.EnviaEmail;

/**
 * @author Ronaldo
 *1 de abr de 2017
 */
public class VizualizaChamadoComputadorCMD implements Command, Serializable{

	
	private static final long serialVersionUID = 1L;

	private ChamadoMicroBO bo;
	private String proximo = "";
	private ManutencaoMicroBO manutencaoBO;
	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
       bo = new ChamadoMicroBO();
       manutencaoBO = new ManutencaoMicroBO();
       proximo = "/privado/usuario/chamado-computador.jsp";
       
       String interno = request.getParameter("numero-chamado-interno");
       int id = 0;
       ChamadoComputador chamadoPc = null;
       
       List<ChamadoComputador> lista = bo.listaPorInterno(interno);
       
       try{
    	   if(!lista.isEmpty()){
    		   for(ChamadoComputador pc : lista){
    			   id = 0;
    			   id = pc.getId();
    		   }
    	   }
    	   
    	   chamadoPc = bo.recuperaPorID(id);
    	   
    	   /*recupera e seta os dados do chamado*/
    	   
    	   request.setAttribute("instituicao",chamadoPc.getInstituicao().getNome());
    	   request.setAttribute("dt_cadastro",chamadoPc.getDt_cadastro());
    	   request.setAttribute("hora",chamadoPc.getHora_cadastro());
    	   
    	   request.setAttribute("solicitante",chamadoPc.getSolicitante());
    	   request.setAttribute("nome_solicitante",chamadoPc.getNome_solicitante());
    	   request.setAttribute("num_ima",chamadoPc.getNum_chamado_ima());
    	   request.setAttribute("num_interno",interno);
    	   
    	   request.setAttribute("user_nome",chamadoPc.getUsuario().getNome());
    	   request.setAttribute("statusChamado", chamadoPc.getStatus());



    	   try{
    		   List<Computador> listaMicro = chamadoPc.getComputador();
    		   request.setAttribute("listaMicro", listaMicro);
    		   
    		   List<String> listaStatus = new ArrayList<>();
    		   List<String> listaStatusNewMicro = new ArrayList<>();

    		   
    		   int micro = 0;
    		   int newMicro = 0;
    		   for(Computador pc : listaMicro){
    			   
    			   if(!pc.getStatus().equals("finalizado") && !pc.getStatus().equals("a devolver")){
    				   listaStatus.add(pc.getStatus());
    			   }
    		   }
    		   
    		   for(Computador pc : listaMicro){

    			   if(pc.getStatus().equals("fechado")){
    				   listaStatusNewMicro.add(pc.getStatus());
    			   }
    		   }
    		   
    		   if(listaStatus.isEmpty()){
    			   micro = 1;
    			   request.setAttribute("microFin", micro);
    		   }
    		   
    		   if(!listaStatusNewMicro.isEmpty()){
    			   newMicro = 1;
    			   request.setAttribute("newMicro", newMicro);
    		   }
    	
    		
    			   
    		   
    		
    	   }catch (Exception e) {
			System.out.println("Erro ao listar micro's: "+e.getMessage());
		}
    	   
    	   proximo = "/privado/usuario/chamado-computador.jsp";
    	   
       }catch (Exception e) {
			System.out.println("Erro ao recuperar chamado de computador por numero interno: "+e.getMessage());
	}
		
		return proximo;
	}

}
