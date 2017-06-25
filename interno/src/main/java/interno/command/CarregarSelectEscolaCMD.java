/**
 * 
 */
package interno.command;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.InstituicaoBO;
import interno.modelo.Instituicao;

/**
 * @author Ronaldo
 *30 de mar de 2017
 */
public class CarregarSelectEscolaCMD implements Command, Serializable {

	private InstituicaoBO bo;
	private String proximo = "";
	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
           
		bo = new InstituicaoBO();
		proximo = "privado/usuario/index.jsp";
		
		List<Instituicao> listaEscola = bo.listarTdsInstituicao();
		try{
			
			if(!listaEscola.isEmpty()){
				listaEscola = bo.listarTdsInstituicao();
				request.setAttribute("listaEscola", listaEscola);
				proximo = "privado/usuario/cadastrar-chamado.jsp";

			}
			
		}catch (Exception e) {
			System.out.println("Erro ao carregar select de escolas: "+e.getMessage());
		}
		
		
		return proximo;
	}

}
