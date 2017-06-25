/**
 * 
 */
package interno.bo;

import java.util.List;

import interno.dao.InstituicaoDAO;
import interno.modelo.Instituicao;

/**
 * @author Ronaldo
 *20 de mar de 2017
 */
public class InstituicaoBO {
	
	private InstituicaoDAO dao;
	
	public InstituicaoBO(){
		dao = new InstituicaoDAO();
	}
	
	/*listar instituicao*/
	public List<Instituicao> listarTdsInstituicao(){
		List<Instituicao> listar = null;
		
		try{
			listar = dao.listarInstiticao();
		}catch (Exception e) {
			System.out.println("erro listar tds institu..:"+e.getMessage());
		}
		
		return listar;
	}
	
	/*recuera instituicao por id*/
	public Instituicao recuperaEscolaPorId(int id){
		Instituicao escola = null;
		
		try{
			if(dao.recuperaPorId(id)!= null){
				escola = dao.recuperaPorId(id);
			}
		}catch (Exception e) {
          System.out.println("Erro ao recuerar instituição: "+e.getMessage());
		}
		return escola;
		
	}
	
	/*verificar instit...por nome*/
	public boolean verificarNomeInstituicao(String nome){

		boolean isValido = false;
		
		try{
			if(dao.localizarPorNome(nome) != null){
				isValido = true;
			}
		}catch (Exception e) {
         System.out.println("Erro ao verificar nome da instituição: "+e.getMessage());
		}
		
		return isValido;
	}
	
	public boolean cadastra(Instituicao instituicao){
boolean isValido = false;
		
		try{
			if(dao.persist(instituicao)){
				isValido = true;
			}
		}catch (Exception e) {
         System.out.println("Erro ao verificar nome da instituição: "+e.getMessage());
		}
		
		return isValido;
	}

}
