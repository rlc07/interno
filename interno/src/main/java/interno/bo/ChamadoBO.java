package interno.bo;

import java.util.List;

import interno.dao.ChamadoDAO;
import interno.modelo.Chamado;

public class ChamadoBO {
  
	
	 private ChamadoDAO dao;
	 
	 public ChamadoBO(){
		 dao = new ChamadoDAO();
	 }
	 
	 /*Lista chamados abertto or uusario*/
		public List<Chamado> lsChamadoPorUser(int id){
			List<Chamado> lsChamado = null;
			try{
				lsChamado = dao.lsChamadoPorUser(id);
			}catch (Exception e) {
				System.out.println("Erro de listar chamado por usuario(BO)"+ e.getMessage());

			}
			return lsChamado;
		}
		
		public List<Chamado> lsChamadoAberto(){
			return dao.lsChamadoAberto();
		}
		
		public List<Chamado> lsChamadoFechado(){
			return dao.lsChamadoFechado();
		}

		public List<Chamado> lsChamadoAtendimento(){
			return dao.lsChamadoAtendimento();
		}
}
