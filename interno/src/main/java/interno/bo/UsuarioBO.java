/**
 * 
 */
package interno.bo;

import java.util.List;

import interno.dao.UsuarioDAO;
import interno.modelo.Instituicao;
import interno.modelo.Usuario;

/**
 * @author Ronaldo
 *18 de mar de 2017
 */
public class UsuarioBO {
	
	private UsuarioDAO dao;
	
	public UsuarioBO(){
		dao = new UsuarioDAO();
	}
	
	/*Cadastrar usuario*/
	public boolean cadastrarUsuario(Usuario usuario){
		boolean isValido = false;
		if(dao.persist(usuario)){
			isValido = true;
		}
		return isValido;
	}
	
	/*Atualiza usuario*/
	public boolean atualiza(Usuario usuario){
		boolean isValido = false;
		if(dao.update(usuario)){
			isValido = true;
		}
		return isValido;
	}
	
	/*Login*/
	public List<Usuario> login(String login, String senha){
		List<Usuario> listar = null;
		
		try{
		if(!dao.verificaLoginEmail(login, senha).isEmpty()){
			listar = dao.verificaLoginEmail(login, senha);
		}
		else if(!dao.verificaLoginMatricula(login, senha).isEmpty()){
			listar = dao.verificaLoginMatricula(login, senha);
		}
		}catch(Exception e){
			System.out.println("Erro de login: "+e.getMessage());
		}
			
		return listar;
	}
	
	/*localizar usuario por id*/
	public Usuario localizarPorId(int id){
		
         Usuario usuario = null;
		
		try{
			if(dao.localizarPorId(id)!= null){
				usuario = dao.localizarPorId(id);
			}
		}catch (Exception e) {
          System.out.println("Erro ao recuperar usuario: "+e.getMessage());
		}
		return usuario;
	}
	
	/*Lista Usuarios do sistema*/
	public List<Usuario> listaUserSistema(){
		List<Usuario> usuarios = null;
		try{
			usuarios = dao.listaUserSistema();
		}catch (Exception e) {
	          System.out.println("Erro ao listar usuario:(BO) "+e.getMessage());
		}
		return usuarios;
	}
	
	/*Lista Usuarios do sistemaAtivo*/
	public List<Usuario> listaUserSistemaAtivo(){
		List<Usuario> usuarios = null;
		try{
			usuarios = dao.listaUserSistemaAtivo();
		}catch (Exception e) {
	          System.out.println("Erro ao listar usuario:(BO) "+e.getMessage());
		}
		return usuarios;
	}
	

}
