/**
 * 
 */
package interno.dao;

import java.util.List;

import javax.persistence.EntityManager;

import interno.jpa.EntityManagerUtil;
import interno.modelo.Instituicao;

/**
 * @author Ronaldo
 *20 de mar de 2017
 */
public class InstituicaoDAO<T> extends GenericDAO<T> {
	
	private EntityManager em;
	
	public InstituicaoDAO(){
		
		super.setClasse(Instituicao.class);
		em = EntityManagerUtil.getEntityManager();
		super.setEm(EntityManagerUtil.getEntityManager());
	}
	
	/*Listar tds insituição*/
	public List<Instituicao> listarInstiticao(){
		return em.createQuery("FROM Instituicao").getResultList();
	}
	
	/*recuerar institicao or id*/
	public Instituicao recuperaPorId(int id){
		return em.find(Instituicao.class, id);
	}
	
	/*Localizar instituicao por nome*/
	public Instituicao localizarPorNome(String nome){
				
		return (Instituicao) em.createQuery("from Instituicao where upper(nome) = :nome").
				setParameter("nome", nome.toUpperCase()).getSingleResult();
	}
	
	

	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}
	
	

}
