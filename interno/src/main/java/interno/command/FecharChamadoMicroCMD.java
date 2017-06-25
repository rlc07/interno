package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.ChamadoMicroBO;
import interno.bo.ComputadorBO;
import interno.modelo.ChamadoComputador;
import interno.modelo.Computador;

public class FecharChamadoMicroCMD implements Command, Serializable {

	
	private static final long serialVersionUID = 1L;
	
	private String proximo = "";
	private ChamadoMicroBO bo;
	private PrintWriter pw;
	private ComputadorBO computadorBO;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
            
		bo = new ChamadoMicroBO();
		proximo = "/privado/usuario/chamado-computador.jsp";
		pw = response.getWriter();
		computadorBO = new ComputadorBO();
		
		String chamadoInterno = request.getParameter("numChamado");
		String desc_fechamento = request.getParameter("desc_fechamento");
		String idUsuario = request.getParameter("idUsuario");
		
		
		
		List<ChamadoComputador> lista = null;
		List<Computador> listStatus = null;
		List<Computador> newStatus = new ArrayList<>();
		try{
			
			lista = bo.listaPorInterno(chamadoInterno);
			int idChamado = 0;
			for(ChamadoComputador cc : lista){
				idChamado = 0;
				idChamado = cc.getId();
			}
			ChamadoComputador chamadoComputador = bo.recuperaPorID(idChamado);

			listStatus = chamadoComputador.getComputador();
			
			for(Computador pc : listStatus){
				
				Computador comp = computadorBO.recuperaPorID(pc.getId());
	            comp.setStatus("fechado");
	            newStatus.add(comp);
			}
			
			List<String> listaMicroFechado = new ArrayList<>();
			
             for(Computador pc : listStatus){
				
				Computador comp = computadorBO.recuperaPorID(pc.getId());
	            
				if(!comp.getStatus().equals("finalizado")){
					listaMicroFechado.add(comp.getStatus());
				}
			}
			
			if(chamadoComputador.getStatus().equals("aberto")){
				
				chamadoComputador.setComputador(newStatus);
				chamadoComputador.setDesc_fechamento(desc_fechamento);
				chamadoComputador.setStatus("fechado");
				chamadoComputador.setFechadoUsuario(Integer.parseInt(idUsuario));
				
				/*Data fechamento*/
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				Date data = new Date();
				String dt_fechamento = df.format(data);
				
				chamadoComputador.setDt_fechamento(dt_fechamento);
				
				if(bo.atualiza(chamadoComputador)){
					pw.print("true");
					pw.flush();
					pw.close();
				}
			}
			
			
			
		}catch (Exception e) {
			System.out.println("Erro ao fechar chamado de micro: "+e.getMessage());
		}
		
		
		
		
		return proximo;
	}

}
