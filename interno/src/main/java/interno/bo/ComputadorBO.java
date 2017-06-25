/**
 * 
 */
package interno.bo;

import java.util.List;

import interno.dao.ComputadorDAO;
import interno.modelo.Computador;

/**
 * @author Ronaldo
 *1 de abr de 2017
 */
public class ComputadorBO {
	
	private ComputadorDAO dao;
	
	public ComputadorBO(){
		dao = new ComputadorDAO();
	}

	
	/*Listar micro por id*/
	public List<Computador> listaMicroPorID(int id){
		List<Computador> listaMicro = null;
		
		try{
			listaMicro = dao.listarMicroPorID(id);
		}catch (Exception e) {
			System.out.println("Erro ao listar micro por ID: "+e.getMessage());
		}
		return listaMicro;
	}
	
	/*recupera por id -- micro*/
	public Computador recuperaPorID(int id){
		Computador pc = null;
		
		try{
			pc = dao.recuperaMicroID(id);
		}catch (Exception e) {
			System.out.println("erro ao recupera micro por id: "+e.getMessage());
		}
		return pc;
	}
	
	/*Atualiza micro*/
	public boolean atualizarMicro(Computador pc){
		boolean isValido = false;
		
		try{
			if(dao.update(pc)){
				isValido = true;
			}
		}catch (Exception e) {
			System.out.println("erro ao atualizar micro: "+e.getMessage());
		}
		
		return isValido;
	}
}
