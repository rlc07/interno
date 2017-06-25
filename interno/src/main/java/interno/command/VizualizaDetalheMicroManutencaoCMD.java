/**
 * 
 */
package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.ChamadoMicroBO;
import interno.bo.ManutencaoMicroBO;
import interno.bo.UsuarioBO;
import interno.modelo.ChamadoComputador;
import interno.modelo.ManutencaoMicro;
import interno.modelo.Usuario;

/**
 * @author Ronaldo
 *7 de abr de 2017
 */
public class VizualizaDetalheMicroManutencaoCMD implements Command, Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String proximo = "";
	private ManutencaoMicroBO bo;
	private ChamadoMicroBO microBO;
	private UsuarioBO usuarioBO;

	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
         
		 proximo = "/privado/usuario/detalhe-micro-manutencao.jsp";
		 bo = new ManutencaoMicroBO();
		 microBO = new ChamadoMicroBO();
		 usuarioBO = new UsuarioBO();
		 
		 String idManutencao = request.getParameter("idManutencao");
		 String idUsuario = request.getParameter("idUsuario");

		 List<ChamadoComputador> listaEscola = null;
		 
		 if(idUsuario == null || "".equals(idUsuario)){
			 
			 try{
				  ManutencaoMicro manutencaoMicro =  bo.recuperaPorID(Integer.parseInt(idManutencao));
				  
				  /*verifica se o micro e NF ou patrimonio*/
				  String patrimonio = manutencaoMicro.getMicro().getPatrimonio();
				  String nf = manutencaoMicro.getMicro().getNota_fiscal();
				  String nota = "NF: "+nf;
				  
				  if(!"".equals(patrimonio)){
				  request.setAttribute("patrimonio", patrimonio);
				  }else if(!"".equals(nf)){
					  request.setAttribute("patrimonio", nota);

				  }
				  
				  request.setAttribute("num_chamado", manutencaoMicro.getMicro().getChamadoInterno());
				  request.setAttribute("dt_retirada", manutencaoMicro.getMicro().getDt_retirada());
				  request.setAttribute("tipo_micro", manutencaoMicro.getMicro().getTipo_micro());
				  request.setAttribute("backup", manutencaoMicro.getMicro().isBackup());
				  request.setAttribute("desc_problema", manutencaoMicro.getMicro().getDesc_problema());
				  request.setAttribute("tecnico", manutencaoMicro.getTecnico());
				  
				  request.setAttribute("id", idManutencao);

				  request.setAttribute("dt_inicio", manutencaoMicro.getDt_inicio());
				  request.setAttribute("hd", manutencaoMicro.getHd());
				  request.setAttribute("ram", manutencaoMicro.getMemoria());
				  request.setAttribute("processador", manutencaoMicro.getProcessador());
				  request.setAttribute("so", manutencaoMicro.getSistema_operacional());
				  request.setAttribute("marca", manutencaoMicro.getMarca());
				  request.setAttribute("modelo", manutencaoMicro.getModelo());
				  request.setAttribute("solucao", manutencaoMicro.getSolucao_problema());
				  request.setAttribute("dt_termino", manutencaoMicro.getDt_termino());
				  
                  int stFechado = 0;
                  if(manutencaoMicro.getMicro().getStatus().equals("fechado")){
                	  stFechado = 1;

                  }
                  request.setAttribute("status_fechado",stFechado);

                  




				  
				  /*Recupera instituicao*/
				  listaEscola = microBO.listaPorInterno( manutencaoMicro.getMicro().getChamadoInterno());
				  
				  for(ChamadoComputador chamadoMicro : listaEscola){
					  request.setAttribute("escola", chamadoMicro.getInstituicao().getNome());
				  }


				 }catch (Exception e) {
					System.out.println("Erro ao detalhar micro manutençao: "+e.getMessage());
				}
		 }else if(idUsuario != null || !"".equals(idUsuario)){
			 
			try{
				
				ManutencaoMicro manutencaoTecnico =  bo.recuperaPorID(Integer.parseInt(idManutencao));
				Usuario user = usuarioBO.localizarPorId(Integer.parseInt(idUsuario));
				
				if(manutencaoTecnico.getTecnico() == null){
				manutencaoTecnico.setTecnico(user);
				
				/*Dt_inicio da manutenção*/
				DateFormat df = new SimpleDateFormat("dd/MM/YYYY");
				Date dt = new Date();
				String dt_inicio = df.format(dt);
				
				manutencaoTecnico.setDt_inicio(dt_inicio);
				
				manutencaoTecnico.getMicro().setStatus("em atendimento");
				
				if(bo.atualiza(manutencaoTecnico)){
					
					PrintWriter pw = response.getWriter();
					pw.print("true");
					pw.flush();
					pw.close();
				}
				
				}
			}catch (Exception e) {
				System.out.println("Erro ao add tecnico ao micro manutençao: "+e.getMessage());
			}

		 }
		 
		
		
		return proximo;
	}

}
