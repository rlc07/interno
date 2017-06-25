/**
 * 
 */
package interno.jpa;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * @author Ronaldo
 *17 de mar de 2017
 */
public class EntityManagerUtil {
	
	private static EntityManager em;
	private static EntityManagerFactory factory;
	
	public static EntityManager getEntityManager(){
		
		if(factory==null){
			factory = Persistence.createEntityManagerFactory("interno");
		}if(em == null){
			em = factory.createEntityManager();
		}
		
		return em;
	}

}
