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
import interno.bo.ComputadorBO;
import interno.bo.InstituicaoBO;
import interno.bo.ManutencaoMicroBO;
import interno.bo.UsuarioBO;
import interno.modelo.ChamadoComputador;
import interno.modelo.Computador;
import interno.modelo.Instituicao;
import interno.modelo.ManutencaoMicro;
import interno.modelo.Usuario;

/**
 * @author Ronaldo
 *3 de abr de 2017
 */
public class ListarMaquinaManutencaoCMD implements Command, Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private String proximo="";
	private ManutencaoMicroBO bo;
	private ComputadorBO computadorBO;
	private UsuarioBO userBO;
	private ChamadoMicroBO chamadoMicroBO;
	private InstituicaoBO escolaBO;

	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		proximo = "/privado/usuario/manutencao-micro.jsp";
		bo = new ManutencaoMicroBO();
		computadorBO = new ComputadorBO();
		userBO = new UsuarioBO();
		chamadoMicroBO = new ChamadoMicroBO();
		escolaBO = new InstituicaoBO();
		
		String status = request.getParameter("status");
		String num_chamado = request.getParameter("chamado");
		String dt_inicio = request.getParameter("dt_ini");
		String dt_fim = request.getParameter("dt_fim");
		String escola = request.getParameter("instituicao");

		String condicao = "";
		
		List<ManutencaoMicro> lista = null;
		List<Instituicao> listaEscola = null;
		Instituicao instituicao = null;
		
		int id = 0;
		
		try{
			listaEscola = escolaBO.listarTdsInstituicao();
			lista = bo.listarTdsMaquina();
           
			if(status != null && !"".equals(status) ||  num_chamado != null && !"".equals(num_chamado) || dt_inicio != null && !"".equals(dt_inicio)
					|| escola != null && !"".equals(escola)){
				
				
				/*INICIO FILTRO POR STATUS*/
				if(!"".equals(status) && "".equals(num_chamado) && "".equals(dt_inicio) && "".equals(escola)){
					condicao = "WHERE mc.status = '"+status+"'";
					List<ManutencaoMicro> listaFiltro = bo.listaFiltro(condicao);
					
					request.setAttribute("listaManutencao", listaFiltro);
					request.setAttribute("listaEscola", listaEscola);
					proximo = "/privado/usuario/manutencao-micro.jsp";
				}
				/*FIM FILTRO POR STATUS*/
				
				/*INICIO FILTRO POR NUMERO DE CHAMADO INTERNO*/
				if(!"".equals(num_chamado) && "".equals(status) && "".equals(dt_inicio) && "".equals(escola)){
					condicao = "WHERE mc.chamadoInterno = '"+num_chamado+"'";
					List<ManutencaoMicro> listaFiltro = bo.listaFiltro(condicao);
					
					request.setAttribute("listaManutencao", listaFiltro);
					request.setAttribute("listaEscola", listaEscola);
					proximo = "/privado/usuario/manutencao-micro.jsp";
				}
				/*FIM FILTRO POR NUMERO DE CHAMADO INTERNO*/
				
				/*INICIO FILTRO POR ESCOLA*/
				if("".equals(num_chamado) && "".equals(status) && "".equals(dt_inicio) && !"".equals(escola)){
		            instituicao = escolaBO.recuperaEscolaPorId(Integer.parseInt(escola));

					condicao = "WHERE mc.instituicao= '"+instituicao.getNome()+"'";
					List<ManutencaoMicro> listaFiltro = bo.listaFiltro(condicao);
					
					request.setAttribute("listaManutencao", listaFiltro);
					request.setAttribute("listaEscola", listaEscola);
					 request.setAttribute("escolaSelected", instituicao.getNome());

					proximo = "/privado/usuario/manutencao-micro.jsp";

				}
				/*FIM FILTRO POR ESCOLA*/
				
				/*INICIO FILTRO POR NUMERO DE CHAMADO E STATUS*/
				if(!"".equals(num_chamado) && !"".equals(status) && "".equals(dt_inicio) && "".equals(escola)){
					
					condicao = "WHERE mc.chamadoInterno = '"+num_chamado+"' AND mc.status = '"+status+"'";
					List<ManutencaoMicro> listaFiltro = bo.listaFiltro(condicao);
					
					request.setAttribute("listaManutencao", listaFiltro);
					request.setAttribute("listaEscola", listaEscola);
					
					proximo = "/privado/usuario/manutencao-micro.jsp";
					
				}
				/*FIM FILTRO POR NUMERO DE CHAMADO E STATUS*/
				
				/*INICIO FILTRO POR NUMERO DE CHAMADO E ESCOLA*/
				if(!"".equals(num_chamado) && "".equals(status) && "".equals(dt_inicio) && !"".equals(escola)){
					
		            instituicao = escolaBO.recuperaEscolaPorId(Integer.parseInt(escola));

					condicao = "WHERE mc.chamadoInterno = '"+num_chamado+"' AND mc.instituicao = '"+instituicao.getNome()+"'";
					List<ManutencaoMicro> listaFiltro = bo.listaFiltro(condicao);
					
					request.setAttribute("listaManutencao", listaFiltro);
					request.setAttribute("listaEscola", listaEscola);
					 request.setAttribute("escolaSelected", instituicao.getNome());

					proximo = "/privado/usuario/manutencao-micro.jsp";

					
				}
				/*FIM FILTRO POR NUMERO DE CHAMADO E ESCOLA*/
				
				/*INICIO FILTRO POR ESCOLA E STATUS*/
				if("".equals(num_chamado) && !"".equals(status) && "".equals(dt_inicio) && !"".equals(escola)){
					
		            instituicao = escolaBO.recuperaEscolaPorId(Integer.parseInt(escola));

					condicao = "WHERE mc.instituicao = '"+instituicao.getNome()+"' AND mc.status = '"+status+"'";
					List<ManutencaoMicro> listaFiltro = bo.listaFiltro(condicao);
					
					request.setAttribute("listaManutencao", listaFiltro);
					request.setAttribute("listaEscola", listaEscola);
					 request.setAttribute("escolaSelected", instituicao.getNome());

					proximo = "/privado/usuario/manutencao-micro.jsp";

					
				}
				/*FIM FILTRO POR NUMERO DE CHAMADO E STATUS*/


				
			
				
			}
			
			else{
			request.setAttribute("listaManutencao", lista);
			request.setAttribute("listaEscola", listaEscola);
			proximo = "/privado/usuario/manutencao-micro.jsp";


			
			}

		
			
		}catch (Exception e) {
			System.out.println("Erro ao listar maquinas em manutenção: "+e.getMessage());
		}
		 request.setAttribute("chamado", num_chamado);
		 request.setAttribute("status", status);
		 
	
		return proximo;
	}
	

}
