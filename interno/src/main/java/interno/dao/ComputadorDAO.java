/**
 * 
 */
package interno.dao;

import java.util.List;

import javax.persistence.EntityManager;

import interno.jpa.EntityManagerUtil;
import interno.modelo.ChamadoComputador;
import interno.modelo.Computador;

/**
 * @author Ronaldo
 *1 de abr de 2017
 */
public class ComputadorDAO<T> extends GenericDAO<T> {
	
	private EntityManager em;
	
	public ComputadorDAO(){
		super.setClasse(Computador.class);
		em = EntityManagerUtil.getEntityManager();
		super.setEm(EntityManagerUtil.getEntityManager());
	}



     /*Listar micros chamado*/
     public List<Computador> listarMicroPorID(int id){
	String sql = "FROM Computador pc WHERE pc.id="+id;
	
	return em.createQuery(sql).getResultList();
}
     
     /*recupera micro por id*/
     public Computador recuperaMicroID(int id){
    	 return em.find(Computador.class, id);
     }
     

	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}
	
	

}
