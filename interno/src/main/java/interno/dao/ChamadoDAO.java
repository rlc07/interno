/**
 * 
 */
package interno.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;

import interno.jpa.EntityManagerUtil;
import interno.modelo.Chamado;

/**
 * @author Ronaldo
 *19 de mar de 2017
 */
public class ChamadoDAO<T> extends GenericDAO<T> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private EntityManager em;
	
	public ChamadoDAO(){
		super.setClasse(Chamado.class);
		em = EntityManagerUtil.getEntityManager();
		super.setEm(EntityManagerUtil.getEntityManager());
	}
	
	/*Lista chamados abertto or uusario*/
	public List<Chamado> lsChamadoPorUser(int id){
		String sql = "FROM Chamado c WHERE c.usuario = "+id;
		return em.createQuery(sql).getResultList();
	}
	
	public List<Chamado> lsChamadoAberto(){
		String sql = "FROM Chamado c WHERE c.status = 'aberto' ";
		return em.createQuery(sql).getResultList();
	}
	
	public List<Chamado> lsChamadoFechado(){
		String sql = "FROM Chamado c WHERE c.status = 'fechado' ";
		return em.createQuery(sql).getResultList();
	}

	public List<Chamado> lsChamadoAtendimento(){
		String sql = "FROM Chamado c WHERE c.status = 'em atendimento' ";
		return em.createQuery(sql).getResultList();
	}

	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}
	
	

}
