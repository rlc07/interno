/**
 * 
 */
package interno.dao;

import java.util.List;

import javax.persistence.EntityManager;

import interno.jpa.EntityManagerUtil;
import interno.modelo.ChamadoTablet;

/**
 * @author Ronaldo
 *25 de mar de 2017
 */
public class ChamadoTabletDAO<T> extends GenericDAO<T>{
	
	private EntityManager em;
	
	public ChamadoTabletDAO(){
		super.setClasse(ChamadoTablet.class);
		em = EntityManagerUtil.getEntityManager();
		super.setEm(EntityManagerUtil.getEntityManager());
	}

	
	/*Recupera por id*/
	public ChamadoTablet recuperaPorId(int id){
		return em.find(ChamadoTablet.class, id);
	}
	
	/*Lista por numero de chamado*/
	public List<ChamadoTablet> listarNumChamado(String num_chamado){
		String sql = "FROM ChamadoTablet tb WHERE tb.num_chamado_interno='"+num_chamado+"'";
		return em.createQuery(sql).getResultList();
	}
	
	/*Verifica se exite um tecnico responsavel pelo tablet*/
	public List<ChamadoTablet> verificaTecnicoResponsavel(String chamado){
		String sql = "FROM ChamadoTablet tb WHERE tb.tecnico_responsavel = 'disponivel' AND tb.num_chamado_interno='"+chamado+"'";
		return em.createQuery(sql).getResultList();
	}
	
	/*Lisa tablet manutenção*/
	public List<ChamadoTablet> lsTabletManutencao(){
		String sql = "FROM ChamadoTablet tb WHERE tb.status = 'aberto' AND tb.statusTablet = 'manutencao' "
				+ "OR tb.statusTablet = 'a devolver' OR tb.statusTablet = 'aguardando tecnico da ima'"
				+ "OR tb.statusTablet = 'ima' OR tb.statusTablet = 'em atendimento'";
		return em.createQuery(sql).getResultList();
	}
	
	/*Lista Tablet por filtro*/
	public List<ChamadoTablet> listaFiltro(String condicao){
		String sql = "FROM ChamadoTablet tb "+condicao;
		return em.createQuery(sql).getResultList();
	}
	
	/*Verifica se o usuario x e responsavel pelo tablet*/
	public List<ChamadoTablet> verificaTecnico(String nome){
		String sql = "FROM ChamadoTablet tb WHERE tb.tecnico_responsavel = '"+nome+"' AND tb.statusTablet != 'fechado'";
		return em.createQuery(sql).getResultList();
	}
	
	/*Verifica se o usuario x e responsavel pelo tablet*/
	public List<ChamadoTablet> verificaTecnicoQuantidade(String nome){
		String sql = "FROM ChamadoTablet tb WHERE tb.tecnico_responsavel = '"+nome+"'";
		return em.createQuery(sql).getResultList();
	}
	
	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}
	
	

}
