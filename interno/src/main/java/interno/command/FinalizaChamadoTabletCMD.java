package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.ChamadoTabletBO;
import interno.modelo.ChamadoTablet;

public class FinalizaChamadoTabletCMD implements Command, Serializable {

	
	private static final long serialVersionUID = -5309008191432452608L;
	
	private String proximo = "";
	private ChamadoTabletBO bo;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
          
		proximo = "privado/usuario/chamado-tablet-manutencao.jsp";
		bo = new ChamadoTabletBO();
		
		String select = request.getParameter("select_problema_tablet");
		String solucao = request.getParameter("solucao");
		String chamadoTablet = request.getParameter("chamado");
		String resp_ima = request.getParameter("resp_ima");
		String idUsuarioEnviaIma = request.getParameter("idUsuarioEnviaIma");
		String idUsuarioRecIma = request.getParameter("idUsuarioRecIma");
		
		List<ChamadoTablet> listaTablet = null;
		int idChamado = 0;
		
		try{
			listaTablet = bo.listarNumChamado(chamadoTablet);
            /*Recupera id do chamado de tablet*/
			for(ChamadoTablet tablet : listaTablet){
				idChamado = 0;
				idChamado = tablet.getId();
			}
			
			if(select != null){
				if(select.equals("departamento")){
					
					ChamadoTablet resDepartamento = bo.recuperaPorID(idChamado);
					
					resDepartamento.setSolucao_tablet(solucao);
					
				    DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				    Date dtTermino = new Date();
				    
					resDepartamento.setDt_fim(dtTermino);
					resDepartamento.setStatusTablet("a devolver");
					resDepartamento.setResolvido("departamento");
					
					
					PrintWriter print = response.getWriter();
					if(bo.atualiza(resDepartamento)){
						print.print("true");
						print.flush();
						print.close();
						
					}
					
				}else if(select.equals("ima")){
					
					ChamadoTablet resIma = bo.recuperaPorID(idChamado);
					
					resIma.setResolvido("ima");
					 DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
					    Date dtTermino = new Date();					    
						resIma.setDt_fim(dtTermino);
					/*Data envio*/
					Date date = new Date();
					resIma.setDt_solicitacao_ima(date);
					resIma.setStatusTablet("aguardando tecnico da ima");
					PrintWriter print = response.getWriter();
					if(bo.atualiza(resIma)){
						print.print("true");
						print.flush();	
						print.close();
					}
				}
				
			}else if(resp_ima != null){
				
				ChamadoTablet enviaIma = bo.recuperaPorID(idChamado);
				
				Date dt_envio_ima = new Date();
				enviaIma.setDt_envio_ima(dt_envio_ima);
				
				enviaIma.setUsuarioEnviaIma(Integer.parseInt(idUsuarioEnviaIma));
				enviaIma.setTecnicoIma(resp_ima);
				enviaIma.setStatusTablet("ima");
				
				PrintWriter print = response.getWriter();
				if(bo.atualiza(enviaIma)){
					print.print("true");
					print.flush();	
					print.close();
				}
			}else if(idUsuarioRecIma != null){

				ChamadoTablet chegaIma = bo.recuperaPorID(idChamado);
				
				Date dt_cheg_ima = new Date();
				chegaIma.setDt_cheg_ima(dt_cheg_ima);
				
				chegaIma.setUsuarioRecebeIma(Integer.parseInt(idUsuarioRecIma));
				chegaIma.setStatusTablet("a devolver");
				
				PrintWriter print = response.getWriter();
				if(bo.atualiza(chegaIma)){
					print.print("true");
					print.flush();
					print.close();
				}

			}
		}catch (Exception e) {
			System.out.println("Erro ao finalizar chamado de tablet: "+e.getMessage());
		}
		
		
		return proximo;
	}

}
