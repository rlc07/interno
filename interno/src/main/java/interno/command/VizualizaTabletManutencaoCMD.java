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

import interno.bo.ChamadoTabletBO;
import interno.bo.UsuarioBO;
import interno.modelo.ChamadoTablet;
import interno.modelo.Usuario;

/**
 * @author Ronaldo
 *28 de mar de 2017
 */
public class VizualizaTabletManutencaoCMD implements Command{

	private String proximo = "";
	private ChamadoTabletBO ctBO;
	private UsuarioBO userBO;
	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		proximo = "privado/usuario/chamado-tablet-manutencao.jsp";
		ctBO = new ChamadoTabletBO();
		userBO = new UsuarioBO();
		
		String numChamado = request.getParameter("numero-chamado-interno");
		String idUsuario = request.getParameter("idUsuario");
		ChamadoTablet recuperaDados = null;
		ChamadoTablet atendimento = null;
		
		List<ChamadoTablet> lista = null;
		int id = 0;
		try{
         
			lista = ctBO.listarNumChamado(numChamado);

			if(!lista.isEmpty()){
				id = 0;
				for(ChamadoTablet tb : lista){
					id = tb.getId();
				}
			}
			
			if(idUsuario == null || idUsuario == ""){
				ctBO = new ChamadoTabletBO();
				recuperaDados = new ChamadoTablet();
				recuperaDados =  ctBO.recuperaPorID(id);
				
				System.out.println(recuperaDados.getTecnico_responsavel());
				
				/*Recupera dados da instituição*/
				request.setAttribute("escola", recuperaDados.getInstituicao().getNome());
	
				/*Recuera dados do solicitante*/
				request.setAttribute("nome", recuperaDados.getNome_solicitante());
				request.setAttribute("matricula", recuperaDados.getMatricula());
				request.setAttribute("telefoneSolicitante", recuperaDados.getTel());
				request.setAttribute("cargo", recuperaDados.getCargo());

				/*Recuera dados do tablet*/
				request.setAttribute("usuario", recuperaDados.getUsuario());
				request.setAttribute("patrimonio", recuperaDados.getPatrimonio());
				request.setAttribute("marca", recuperaDados.getMarca());
				request.setAttribute("modelo", recuperaDados.getModelo());
				request.setAttribute("caixa", recuperaDados.isCaixa());
				request.setAttribute("capa", recuperaDados.isCapa());
				request.setAttribute("carregador", recuperaDados.isCarregador());
				request.setAttribute("fone", recuperaDados.isFone());
				request.setAttribute("modem", recuperaDados.isModem());
				request.setAttribute("problema", recuperaDados.getDesc_problema());
				
				request.setAttribute("dt_cadastro", recuperaDados.getDt_cadastro());
				request.setAttribute("hora_cadastro", recuperaDados.getHora_cadastro());
				request.setAttribute("bk", recuperaDados.isBackup());
                
				request.setAttribute("statusTablet", recuperaDados.getStatusTablet());
			    request.setAttribute("chamado", numChamado);		
			    
				request.setAttribute("resolvido", recuperaDados.getResolvido());
				request.setAttribute("solucao", recuperaDados.getSolucao_tablet());
				
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				
				if(recuperaDados.getDt_solicitacao_ima() != null){
					request.setAttribute("dt_solicitacao", df.format(recuperaDados.getDt_solicitacao_ima()));

				}
				if(recuperaDados.getDt_envio_ima() != null){
					request.setAttribute("dt_envio_ima", df.format(recuperaDados.getDt_envio_ima()));

				}else{
					request.setAttribute("dt_envio_ima", "Á enviar");
				}
				if(recuperaDados.getDt_cheg_ima() != null){
					request.setAttribute("dt_chega_ima", df.format(recuperaDados.getDt_cheg_ima()));

				}else{
					request.setAttribute("dt_chega_ima", "Aguardando...");

				}if(recuperaDados.getDt_fim() != null){
					request.setAttribute("dt_fim", df.format(recuperaDados.getDt_fim()));

				}else{
					request.setAttribute("dt_fim", recuperaDados.getDt_fim());

				}if(recuperaDados.getDt_inicio() != null){
					request.setAttribute("dt_inicio", df.format(recuperaDados.getDt_inicio()));
				}else{
					request.setAttribute("dt_inicio", recuperaDados.getDt_inicio());

				}
				
				request.setAttribute("tecnico_ima", recuperaDados.getTecnicoIma()); 
				request.setAttribute("usuario_recebe_ima", recuperaDados.getUsuarioRecebeIma()); 



                List<ChamadoTablet> verificaTecnico = ctBO.verificaTecnicoResponsavel(recuperaDados.getNum_chamado_interno());
                
                if(!verificaTecnico.isEmpty()){
                	request.setAttribute("usuarioTecnico", "disponivel");
                }else{
                	
    			    request.setAttribute("usuarioTecnico", recuperaDados.getTecnico_responsavel());
                }
			  
			}
			else{
				
				atendimento = new ChamadoTablet();
				atendimento = ctBO.recuperaPorID(id);
				 List<ChamadoTablet> verificaTecnico = ctBO.verificaTecnicoResponsavel(atendimento.getNum_chamado_interno());
				 
				if(!verificaTecnico.isEmpty()){
					Usuario usuario = userBO.localizarPorId(Integer.parseInt(idUsuario));
					atendimento.setTecnico_responsavel(usuario.getNome());
					atendimento.setStatusTablet("em atendimento");
					
					/*data de inicio - Sistema*/
					DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
					Date date = new Date();
					atendimento.setDt_inicio(date);
					
					if(ctBO.atualiza(atendimento)){
						PrintWriter pw = response.getWriter();
						pw.print("true");
						pw.flush();
						pw.close();
						atendimento = null;
					}
				}
				
			}
		}catch (Exception e) {
			System.out.println("Erro ao listar chamado de tablet por numero de chamado interno: " +e.getMessage());

		}
		
		return proximo;
	}
}
