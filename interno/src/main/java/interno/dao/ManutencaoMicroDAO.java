/**
 * 
 */
package interno.dao;

import java.util.List;

import javax.persistence.EntityManager;

import interno.jpa.EntityManagerUtil;
import interno.modelo.ChamadoComputador;
import interno.modelo.ManutencaoMicro;

/**
 * @author Ronaldo
 *3 de abr de 2017
 */
public class ManutencaoMicroDAO<T> extends GenericDAO<T> {
	
	private EntityManager em;

	public ManutencaoMicroDAO(){
		super.setClasse(ManutencaoMicro.class);
		em = EntityManagerUtil.getEntityManager();
		super.setEm(EntityManagerUtil.getEntityManager());
	}
	
	/*verifica se o id do micro ja existe na tabela de manutenção*/
	public List<ManutencaoMicro> verificaIdMicro(int id){
		String sql = "FROM ManutencaoMicro mm WHERE mm.micro ="+id;
		
		return em.createQuery(sql).getResultList();
	}
	
	/*Listar maquinas manutenção*/
	public List<ManutencaoMicro> listarTdsMaquina(){
		String sql = "SELECT mm FROM ManutencaoMicro mm INNER JOIN mm.micro mc WHERE mc.status='manutencao'"
				+ " OR mc.status='em atendimento' OR mc.status='a devolver'";
		return em.createQuery(sql).getResultList();
	}
	
	/*lista filtro*/
	public List<ManutencaoMicro> listaFiltro(String condicao){
		
		String sql = "SELECT mm FROM ManutencaoMicro mm INNER JOIN mm.micro mc "+condicao;
		
		return em.createQuery(sql).getResultList();
	}
	
	/*recupera por id*/
	public ManutencaoMicro recuperaPorID(int id){
		return em.find(ManutencaoMicro.class, id);
	}
	
	/*verifica se o usurio esta mechenmdo no icro para montar o historico*/
	public List<ManutencaoMicro> verificaTecnico(int id){
		
		String sql = "SELECT mm FROM ManutencaoMicro mm INNER JOIN mm.micro mc WHERE mm.tecnico ="+id+" AND mc.status != 'fechado'";
		
		return em.createQuery(sql).getResultList();
	}
	/*verifica se o usurio esta mechenmdo no icro para montar o historico*/
	public List<ManutencaoMicro> verificaTecnicoQuantidade(int id){
		
		String sql = "SELECT mm FROM ManutencaoMicro mm INNER JOIN mm.micro mc WHERE mm.tecnico ="+id;
		
		return em.createQuery(sql).getResultList();
	}
	
	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}
	
	

}
