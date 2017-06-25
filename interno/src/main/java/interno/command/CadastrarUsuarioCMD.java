/**
 * 
 */
package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.UsuarioBO;
import interno.modelo.Usuario;

/**
 * @author Ronaldo
 *18 de mar de 2017
 */
public class CadastrarUsuarioCMD implements Command, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3642768516929168805L;

	private UsuarioBO bo;
	private String proximo = "";
	/* (non-Javadoc)
	 * @see command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		bo = new UsuarioBO();
		proximo = "login.jsp";
		
		String nome = request.getParameter("nome");
		String telefone = request.getParameter("fone");
		String email = request.getParameter("email");
		String matricula = request.getParameter("matricula");
		String senha = request.getParameter("senha");
		
		Usuario usuario = new Usuario();
		
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setSenha(senha);
		usuario.setPermissao(false);
		usuario.setStatus(false);
	    usuario.setFone_cel(telefone);
		
		
		if(matricula == null || matricula == ""){
			usuario.setMatricula(0);
		}else{
			usuario.setMatricula(Integer.parseInt(matricula));
		}
		
		if(bo.cadastrarUsuario(usuario)){
			PrintWriter pw = response.getWriter();
			pw.print("true");
			pw.flush();
			pw.close();
		}
		
		
		return proximo;
	}

}
