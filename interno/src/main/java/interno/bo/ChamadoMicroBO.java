/**
 * 
 */
package interno.bo;

import java.util.List;

import interno.dao.ChamadoMicroDAO;
import interno.modelo.ChamadoComputador;

/**
 * @author Ronaldo
 *19 de mar de 2017
 */
public class ChamadoMicroBO {
	
	private ChamadoMicroDAO dao;
	
	public ChamadoMicroBO(){
		dao = new ChamadoMicroDAO();
	}
	
	/*Cadastrar chamado de micro*/
	public boolean cadastrarChamadoMicro(ChamadoComputador micro){
		
		boolean isValido = false;
		
		try{
			if(dao.persist(micro)){
				isValido = true;
			}
			
		}catch (Exception e) {
			System.out.println("Erro de cadastro (Micro)"+ e.getMessage());
		}
		
		return isValido;
		
	}
	
	/*Atualiza chamado micro*/
	public boolean atualiza(ChamadoComputador micro){
		boolean isValido = false;
		
		try{
			if(dao.update(micro)){
				isValido = true;
			}
		}catch (Exception e) {
			System.out.println("Erro ao atualizar chamado micro: "+e.getMessage());
		}
		return isValido;
	}

	/*Recupera chamado por ID*/
	public ChamadoComputador recuperaPorID(int id){
		ChamadoComputador pc = null;
		
		try{
			pc = dao.recuperaPorId(id);
		}catch (Exception e) {
			System.out.println("Erro ao recuperar chamado de computador por ID: "+e.getMessage());
		}
		return pc;
	}
	
	/*Lista or numero de chamado interno*/
	public List<ChamadoComputador> listaPorInterno(String interno){
		List<ChamadoComputador> listarInterno = null;
		
		try{
			listarInterno = dao.listaPorNumeroInterno(interno);
		}catch (Exception e) {
			System.out.println("Erro ao recuperar chamado de computador por numero interno: "+e.getMessage());
		}
		return listarInterno;
	}
	
	/*Listar micro por chamado*/
	public List<ChamadoComputador> listarMicroPorChamado(int id){
		List<ChamadoComputador> lista = null;
		
		try{
			lista = dao.listarMicrosPorInterno(id);
		}catch (Exception e) {
			System.out.println("Erro ao listar micro por id: "+e.getMessage());
		}
		return lista;
	}
	
}
