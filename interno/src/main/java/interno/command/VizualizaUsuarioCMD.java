package interno.command;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.ChamadoBO;
import interno.bo.ChamadoTabletBO;
import interno.bo.ManutencaoMicroBO;
import interno.bo.UsuarioBO;
import interno.modelo.Chamado;
import interno.modelo.ChamadoTablet;
import interno.modelo.ManutencaoMicro;
import interno.modelo.Usuario;

public class VizualizaUsuarioCMD implements Command, Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private UsuarioBO bo;
	private String proximo = "";
	private ChamadoBO chamadoBO;
	private ChamadoTabletBO chamadoTabletBO;
	private ManutencaoMicroBO manutencaoMicroBO;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
                  
		proximo = "/privado/usuario/historico-usuario.jsp";
		bo = new UsuarioBO();
		chamadoBO = new ChamadoBO();
		chamadoTabletBO = new ChamadoTabletBO();
		manutencaoMicroBO = new ManutencaoMicroBO();
		
		String idUsuario = request.getParameter("idUsuario");
		
		try{
			Usuario user = bo.localizarPorId(Integer.parseInt(idUsuario));
			
			request.setAttribute("nome", user.getNome());
			request.setAttribute("matricula", user.getMatricula());
			request.setAttribute("email", user.getEmail());
			request.setAttribute("status", user.isStatus());
			request.setAttribute("permissao", user.isPermissao());
			request.setAttribute("celular", user.getFone_cel());
			request.setAttribute("fixo", user.getFone_fixo());

           List<Chamado> listaChamadoUser = chamadoBO.lsChamadoPorUser(user.getId());
           
			request.setAttribute("qtd", listaChamadoUser.size());

		   List<ChamadoTablet> listaManutencaoTablet = chamadoTabletBO.verificaTecnico(user.getNome());
           List<ManutencaoMicro> listaManutencaoMicro = manutencaoMicroBO.verificaTecnico(user.getId());
           request.setAttribute("qtdChamadoTabletAtual", listaManutencaoTablet.size());
			request.setAttribute("qtdChamadoMicroAtual", listaManutencaoMicro.size());
           
           /*Quantidade de chamados atendido*/
           List<ChamadoTablet> tabletQtd = chamadoTabletBO.verificaTecnicoQuantidade(user.getNome());
           List<ManutencaoMicro> microQtd = manutencaoMicroBO.verificaTecnicoQuantidade(user.getId());
           
           /*Calcula Quantidade de chamados atendido*/
             int t = tabletQtd.size();
             int m = microQtd.size();
             int qtd = t+m;
             
			request.setAttribute("qtdChamadoTablet", tabletQtd.size());
			request.setAttribute("qtdChamadoMicro", microQtd.size());
			request.setAttribute("qtdChamadoAtendido", qtd);
			
			
			
			List<String> numChamadoAtendimentoTablet = new ArrayList<>();
			List<String> numChamadoAtendimentoMicro = new ArrayList<>();
			
			if(!listaManutencaoTablet.isEmpty() || !listaManutencaoMicro.isEmpty()){
				
				if(!listaManutencaoTablet.isEmpty()){
					for(ChamadoTablet tabletChamado : listaManutencaoTablet){
						String nChamadoT = tabletChamado.getNum_chamado_interno();
						
						numChamadoAtendimentoTablet.add(nChamadoT);
						request.setAttribute("lsChamadoAtendimentoTablet", numChamadoAtendimentoTablet);
					}
				}
				if(!listaManutencaoMicro.isEmpty()){
					for(ManutencaoMicro manutencaoMicro : listaManutencaoMicro){
						String nChamadoM = manutencaoMicro.getMicro().getChamadoInterno();
						numChamadoAtendimentoMicro.add(nChamadoM);
						request.setAttribute("lsChamadoAtendimentoMicro", numChamadoAtendimentoMicro);


					}
				}
				
			}



		}catch (Exception e) {
			System.out.println("Erro ao recuperar usuario (COMMAND) "+e.getMessage());
		}

		return proximo;
	}

}
