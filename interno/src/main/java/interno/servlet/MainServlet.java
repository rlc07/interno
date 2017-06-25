/**
 * 
 */
package interno.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.command.AdicionarNewMicroCMD;
import interno.command.AdmUsuarioSistemaCMD;
import interno.command.AlterarMicroCMD;
import interno.command.CadastraVisitaTecnicaCMD;
import interno.command.CadastrarChamadoMicroCMD;
import interno.command.CadastrarChamadoTabletCMD;
import interno.command.CadastrarInstituicaoCMD;
import interno.command.CadastrarUsuarioCMD;
import interno.command.CarregaIndexCMD;
import interno.command.CarregarSelectEscolaCMD;
import interno.command.Command;
import interno.command.FecharChamadoMicroCMD;
import interno.command.FinalizaChamadoMicroCMD;
import interno.command.FinalizaChamadoTabletCMD;
import interno.command.FinalizaMicroCMD;
import interno.command.ListaTabletManutencaoCMD;
import interno.command.ListarInstituicaoCMD;
import interno.command.VizualizaTabletManutencaoCMD;
import interno.command.VizualizaUsuarioCMD;
import interno.command.VizualizaVisitaTecnicaCMD;
import interno.command.ListarMaquinaManutencaoCMD;
import interno.command.ManutencaoMicroCMD;
import interno.command.TermoEntregaMicroCMD;
import interno.command.VizualizaChamadoComputadorCMD;
import interno.command.VizualizaDetalheMicroManutencaoCMD;
import interno.command.VizualizaMicroCMD;

/**
 * @author Ronaldo
 *18 de mar de 2017
 */

@WebServlet("/main")
public class MainServlet extends HttpServlet{

	
	private static final long serialVersionUID = 1L;
	
	private String proximo = "";
	Map<String, Command> comandos = new HashMap<String, Command>();
	
	@Override
	public void init() throws ServletException {
		
		comandos.put("cadastrar-usuario", new CadastrarUsuarioCMD());
		comandos.put("cadastrar-tablet", new CadastrarChamadoTabletCMD());
		comandos.put("cadastrar-micro", new CadastrarChamadoMicroCMD());
		comandos.put("cadastrar-visita", new CadastraVisitaTecnicaCMD());
		comandos.put("cadastrar-chamado", new CarregarSelectEscolaCMD());


		comandos.put("detalhe-chamado-tablet", new VizualizaTabletManutencaoCMD());
		comandos.put("detalhe-chamado-visita", new VizualizaVisitaTecnicaCMD());


		comandos.put("detalhe-chamado", new VizualizaChamadoComputadorCMD());
		
		comandos.put("detalhe-micro", new VizualizaMicroCMD());
		comandos.put("atualiza-micro", new AlterarMicroCMD());
		
		comandos.put("finaliza-micro", new FinalizaMicroCMD());
		comandos.put("new-micro", new AdicionarNewMicroCMD());
		comandos.put("add-micro-manutencao", new ManutencaoMicroCMD());
		comandos.put("manutencao-computador", new ListarMaquinaManutencaoCMD());
		
		comandos.put("detalhe-micro-manutencao", new VizualizaDetalheMicroManutencaoCMD());
		comandos.put("finaliza-manutencao-micro", new FinalizaChamadoMicroCMD());
		comandos.put("fecha-chamado-micro", new FecharChamadoMicroCMD());
		
		comandos.put("termo-entrega-micro", new TermoEntregaMicroCMD());
		comandos.put("finaliza-chamado-tablet", new FinalizaChamadoTabletCMD());
		comandos.put("manutencao-tablet", new ListaTabletManutencaoCMD());
		
		
		comandos.put("administra-usuario", new AdmUsuarioSistemaCMD());
		comandos.put("usuario-historico", new VizualizaUsuarioCMD());
		
		comandos.put("instituicoes", new ListarInstituicaoCMD());
		comandos.put("cadastrar-instituicao", new CadastrarInstituicaoCMD());
		comandos.put("index", new CarregaIndexCMD());
	}
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#service(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Command comando = null;
		String acao = request.getParameter("action");
		
		comando = verificaComando(acao);
		proximo = comando.execute(request, response);
		
		request.getRequestDispatcher(proximo).forward(request, response);
		

	}

	public Command verificaComando(String acao){
		Command comando = null;
		
		for(String key : comandos.keySet()){
			if(key.equalsIgnoreCase(acao)){
				comando = comandos.get(key);
				
			}
		}
		
		return comando;
	}
	
}
