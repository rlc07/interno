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

import interno.bo.ChamadoBO;
import interno.bo.ChamadoTabletBO;
import interno.bo.InstituicaoBO;
import interno.bo.UsuarioBO;
import interno.modelo.Chamado;
import interno.modelo.ChamadoTablet;
import interno.modelo.Instituicao;
import interno.modelo.Usuario;

/**
 * @author Ronaldo
 *25 de mar de 2017
 */
public class CarregaIndexCMD implements Command{

	private String proximo = "";
	private ChamadoBO bo;
	
	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
           
		proximo = "/privado/usuario/index.jsp";
		
		bo = new ChamadoBO();
		
		List<Chamado> aberto = bo.lsChamadoAberto();
		request.setAttribute("cAberto", aberto.size());
		
		List<Chamado> abertoList = bo.lsChamadoAberto();
		request.setAttribute("abertoList", abertoList);
		
		List<Chamado> fechado = bo.lsChamadoFechado();
		request.setAttribute("cFechado", fechado.size());
		
		List<Chamado> atendimento = bo.lsChamadoAtendimento();
		request.setAttribute("cAtendimento", atendimento.size());


		
		
		return proximo;
	}

}
