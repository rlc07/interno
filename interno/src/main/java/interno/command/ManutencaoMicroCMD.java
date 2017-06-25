/**
 * 
 */
package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.ChamadoMicroBO;
import interno.bo.ComputadorBO;
import interno.bo.ManutencaoMicroBO;
import interno.modelo.ChamadoComputador;
import interno.modelo.Computador;
import interno.modelo.ManutencaoMicro;

/**
 * @author Ronaldo
 *3 de abr de 2017
 */
public class ManutencaoMicroCMD implements Command, Serializable{

	
	private static final long serialVersionUID = 1L;

	private String proximo = "";
	private ManutencaoMicroBO bo;
	private ComputadorBO computadorBO;
	private ChamadoMicroBO microChamadoBO;
	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
           
           proximo = "/privado/usuario/chamado-computador.jsp";
           bo = new ManutencaoMicroBO();
           computadorBO = new ComputadorBO();
           microChamadoBO = new ChamadoMicroBO();
           
           String idMicro = request.getParameter("idMicroManutencao");
           Computador micro = null;
           
           List<ManutencaoMicro> listaMicro = null;
           List<ChamadoComputador> listaChamadoComp = new ArrayList<>();
           
           try{
        	   
        	   listaMicro = bo.verificaIdMicro(Integer.parseInt(idMicro));
        	   
        	   if(listaMicro.isEmpty()){
        		   micro = computadorBO.recuperaPorID(Integer.parseInt(idMicro));
            	   
            	   ManutencaoMicro manutencao = new ManutencaoMicro();
            	   
            	  listaChamadoComp =  microChamadoBO.listarMicroPorChamado(Integer.parseInt(idMicro));
            	   String chamado_interno = "";
            	   String instituicao = "";
            	   
            	   for(ChamadoComputador chamadoCompuador : listaChamadoComp){
            		   chamado_interno = chamadoCompuador.getNum_chamado_interno();
            		   instituicao = chamadoCompuador.getInstituicao().getNome();
            	   }
            	   
            	   micro.setStatus("manutencao");
            	   micro.setChamadoInterno(chamado_interno);
            	   micro.setInstituicao(instituicao);
            	   
            	   DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            	   Date date = new Date();
            	   String dt_retirada  = df.format(date);
            	   micro.setDt_retirada(dt_retirada);
            	   
            	   manutencao.setMicro(micro);
            	   
            	   
            	   if(bo.salvar(manutencao)){
            		   PrintWriter pw = response.getWriter();
            		   pw.print("true");
            		   pw.flush();
            		   pw.close();
            	   }
        	   }
        	   
           }catch (Exception e) {
			System.out.println("Erro ao enviar micro para manutenção: "+e.getMessage());
		}
		
		return proximo;
	}

}
