/**
 * 
 */
package interno.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.command.AdicionarNewMicroCMD;
import interno.command.AlterarMicroCMD;
import interno.command.CadastrarChamadoMicroCMD;
import interno.command.CadastrarChamadoTabletCMD;
import interno.command.CadastrarUsuarioCMD;
import interno.command.CarregarSelectEscolaCMD;
import interno.command.Command;
import interno.command.FecharChamadoMicroCMD;
import interno.command.FinalizaChamadoMicroCMD;
import interno.command.FinalizaChamadoTabletCMD;
import interno.command.FinalizaMicroCMD;
import interno.command.ListaTabletManutencaoCMD;
import interno.command.ListarMaquinaManutencaoCMD;
import interno.command.LoginCMD;
import interno.command.ManutencaoMicroCMD;
import interno.command.TermoEntregaMicroCMD;
import interno.command.VizualizaChamadoComputadorCMD;
import interno.command.VizualizaDetalheMicroManutencaoCMD;
import interno.command.VizualizaMicroCMD;
import interno.command.VizualizaTabletManutencaoCMD;

/**
 * @author Ronaldo
 *18 de mar de 2017
 */

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#service(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	
	private String proximo = "";
	Map<String, Command> comandos = new HashMap<String, Command>();
	

	@Override
	public void init() throws ServletException {
		
		comandos.put("efetua-login", new LoginCMD());
		comandos.put("novo-usuario", new CadastrarUsuarioCMD());
		
	}
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
