/**
 * 
 */
package interno.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;

import interno.jpa.EntityManagerUtil;
import interno.modelo.ChamadoComputador;

/**
 * @author Ronaldo
 *19 de mar de 2017
 */
public class ChamadoMicroDAO<T> extends GenericDAO<T> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2049937630809256328L;
	private EntityManager em;
	
	public ChamadoMicroDAO(){
		
		super.setClasse(ChamadoComputador.class);
		em = EntityManagerUtil.getEntityManager();
		super.setEm(EntityManagerUtil.getEntityManager());
		
	}
	
	/*Pegar chamado por id*/
	public ChamadoComputador recuperaPorId (int id){
		
		return em.find(ChamadoComputador.class, id);
	}
	
	/**Lista chamado por numero interno*/
	public List<ChamadoComputador> listaPorNumeroInterno(String interno){
		String sql = "FROM ChamadoComputador pc WHERE pc.num_chamado_interno='"+interno+"'";
		return em.createQuery(sql).getResultList();
	}
	
	/*Listar micros chamado*/
	public List<ChamadoComputador> listarMicrosPorInterno(int id){
		String sql = "select cc FROM ChamadoComputador cc INNER JOIN cc.computador pc WHERE pc.id ="+id;
		
		return em.createQuery(sql).getResultList();
	}

	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}
	
	

}
