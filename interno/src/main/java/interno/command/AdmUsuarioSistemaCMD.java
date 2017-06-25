package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interno.bo.UsuarioBO;
import interno.modelo.Usuario;

public class AdmUsuarioSistemaCMD implements Command, Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private String proximo ="";
	private UsuarioBO bo;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		  proximo = "/privado/usuario/usuario-sistema.jsp";
		  bo = new UsuarioBO();
		  
		  String idUsuarioAdm = request.getParameter("idUsuarioAdm");
		  String idUserMudaStatus = request.getParameter("idUsuarioMudarStatus");
		  
		 
			
		  try{
			    HttpSession session = request.getSession();
				Usuario userSession = (Usuario) session.getAttribute("usuarioLogado");
				 Usuario userAdm = bo.localizarPorId(Integer.parseInt(idUsuarioAdm));

				if(userAdm.getId() == userSession.getId() && userSession.isPermissao() == true && userAdm != null){
			 
			 if(userAdm.isPermissao() == true){
				 
				 if(idUserMudaStatus != null){
					  
					 Usuario usuario = bo.localizarPorId(Integer.parseInt(idUserMudaStatus));
					 if(usuario.isStatus() == false){
						 usuario.setStatus(true);
					 }else{
						 usuario.setStatus(false);
					 }
					 
					 if(bo.atualiza(usuario)){
						 PrintWriter pw = response.getWriter();
						 pw.print("true");
						 pw.flush();
						 pw.close();
					 }
				 }else{
				 
				 request.setAttribute("lsUserSistema", bo.listaUserSistema());
				 }
			 }
			}else{
				request.setAttribute("negado", 0);
				}
		  }catch (Exception e) {
			System.out.println("erro ao listar usuarios (COMMAND)"+e.getMessage());
			request.setAttribute("negado", 0);
		}
		
		
		return proximo;
	}

}
