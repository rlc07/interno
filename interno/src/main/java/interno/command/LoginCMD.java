package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interno.bo.UsuarioBO;
import interno.modelo.Usuario;

public class LoginCMD implements Command, Serializable {

	private UsuarioBO bo;
	private Usuario usuario;
	private String proximo = "";
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
             
		proximo = "login.jsp";
		bo = new UsuarioBO();
		usuario = new Usuario();

		bo = new UsuarioBO();
		usuario = new Usuario();
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		List<Usuario> lista = null;
		
		lista = bo.login(login, senha);
		
		try{
			if(!lista.isEmpty() || lista == null){
				
				int id = 0;
				
				for(Usuario u : lista){
					id = u.getId();
				}
				
				HttpSession sessao = request.getSession();
				usuario = bo.localizarPorId(id);
				sessao.setAttribute("usuarioLogado", usuario);
				PrintWriter pw = response.getWriter();
				pw.print("true");
				pw.flush();
				pw.close();
			}
		}catch (Exception e) {
			System.out.print("erroo = "+e.getMessage());
		}
		
		return proximo;
	}

}
