/**
 * 
 */
package interno.dao;

import java.util.List;

import javax.persistence.EntityManager;

import interno.jpa.EntityManagerUtil;
import interno.modelo.Usuario;

/**
 * @author Ronaldo
 *17 de mar de 2017
 */
public class UsuarioDAO <T> extends GenericDAO<T> {
	
	private EntityManager em;
	
	public UsuarioDAO(){
		super.setClasse(Usuario.class);
		em = EntityManagerUtil.getEntityManager();
		super.setEm(EntityManagerUtil.getEntityManager());
	}
	
	//login
	public List<Usuario> verificaLoginEmail(String login, String senha){
		
		String sql = "SELECT user from Usuario user WHERE user.email ='"+login+"'  AND user.senha = '"+senha+"' AND user.status=true";
		
		return em.createQuery(sql).getResultList();
    }
	
     public List<Usuario> verificaLoginMatricula(String login, String senha){
		
		String sql = "from Usuario user WHERE user.matricula ='"+login+"'  AND user.senha = '"+senha+"' AND user.status=true";
		
		return em.createQuery(sql).getResultList();
    }

	//localizar usuario por id
	public Usuario localizarPorId(int id){
		return em.find(Usuario.class, id);
	}
	
	/*Lista Usuarios do sistema*/
	public List<Usuario> listaUserSistema(){
		String sql ="FROM Usuario user";
		
		return em.createQuery(sql).getResultList();
	}
	
	/*Lista Usuarios do sistema ativo*/
	public List<Usuario> listaUserSistemaAtivo(){
		String sql ="FROM Usuario user WHERE user.status= true";
		
		return em.createQuery(sql).getResultList();
	}
	

	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}
	
	
	
	

}
