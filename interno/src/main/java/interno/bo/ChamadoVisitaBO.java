package interno.bo;

import java.util.List;

import interno.dao.ChamadoVisitaDAO;
import interno.modelo.ChamadoTablet;
import interno.modelo.ChamadoVisita;

public class ChamadoVisitaBO {

	 private ChamadoVisitaDAO dao;
	 
	 public ChamadoVisitaBO(){
		 dao = new ChamadoVisitaDAO();
	 }
	 
	 public boolean salvar(ChamadoVisita visita){
		 boolean isValido = false;
		 try{
			 if(dao.persist(visita)){
				 isValido = true;
			 }
		 }catch (Exception e) {
			System.out.println("Erro ao salvar visita (BO)"+e.getMessage());
		}
		 return isValido;
	 }
	 
	 public boolean atualizar(ChamadoVisita visita){
		 boolean isValido = false;
		 try{
			 if(dao.update(visita)){
				 isValido = true;
			 }
		 }catch (Exception e) {
			System.out.println("Erro ao salvar visita (BO)"+e.getMessage());
		}
		 return isValido;
	 }
	 
	 public List<ChamadoVisita> listarNumChamado(String numChamado){
			
			List<ChamadoVisita> visita = null;
			
			try{
				visita = dao.listarNumChamado(numChamado);
			}catch (Exception e) {
				System.out.println("Erro ao listar chamado de visita por numero de chamado interno: " +e.getMessage());
			}
			return visita;
		}
	 
	 public ChamadoVisita recuperaId(int id){
			ChamadoVisita visita = null;
			
			try{
				visita = dao.recuperaId(id);
			}catch (Exception e) {
				System.out.println("Erro ao recuperar chamado de visita: " +e.getMessage());
			}
			return visita;
		}
}
