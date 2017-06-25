package interno.dao;

import java.util.List;

import javax.persistence.EntityManager;

import interno.jpa.EntityManagerUtil;
import interno.modelo.ChamadoTablet;
import interno.modelo.ChamadoVisita;

public class ChamadoVisitaDAO<T> extends GenericDAO<T>{
	
	private EntityManager em;
	 
	
	public ChamadoVisitaDAO(){
		super.setClasse(ChamadoVisita.class);
		em = EntityManagerUtil.getEntityManager();
		super.setEm(EntityManagerUtil.getEntityManager());
	}
	
	/*Lista por numero de chamado*/
	public List<ChamadoVisita> listarNumChamado(String num_chamado){
		String sql = "FROM ChamadoVisita tb WHERE tb.num_chamado_interno='"+num_chamado+"'";
		return em.createQuery(sql).getResultList();
	}
	
	public ChamadoVisita recuperaId(int id){
		return em.find(ChamadoVisita.class, id);
	}
	
	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}

}
