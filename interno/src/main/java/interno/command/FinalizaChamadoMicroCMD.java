/**
 * 
 */
package interno.command;

import java.io.BufferedReader;
import java.io.IOException;
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
import interno.bo.ManutencaoMicroBO;
import interno.modelo.ChamadoComputador;
import interno.modelo.Computador;
import interno.modelo.ManutencaoMicro;
import interno.util.EnviaEmail;

/**
 * @author Ronaldo
 *8 de abr de 2017
 */
public class FinalizaChamadoMicroCMD implements Command, Serializable{


	private static final long serialVersionUID = -6908283791023556260L;

	
	private String proximo = "";
	private EnviaEmail enviaEmail;
	private ManutencaoMicroBO bo;
	private ChamadoMicroBO microBO;
	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
     
		proximo = "/privado/usuario/detalhe-micro-manutencao.jsp";
		enviaEmail = new EnviaEmail();
		bo = new ManutencaoMicroBO();
		microBO = new ChamadoMicroBO();
		
		String idManutencao = request.getParameter("idManutencao");
		String hd = request.getParameter("hd");
		String ram = request.getParameter("ram");
		String processador = request.getParameter("processador");
		String so = request.getParameter("so");
		String marca = request.getParameter("marca");
		String modelo = request.getParameter("modelo");
		String solucao = request.getParameter("solucao");

		
		String conta1 = request.getParameter("conta1");
		String senha1 = request.getParameter("senha1");
		String conta2 = request.getParameter("conta2");
		String senha2 = request.getParameter("senha2");
		
		String zip = request.getParameter("7zip");
		String cCLeaner = request.getParameter("Ccleaner");
		String firefox = request.getParameter("firefox");
		String google = request.getParameter("google");
		String flashPlayer = request.getParameter("afp");
		
		String reader = request.getParameter("reader");
		String air = request.getParameter("air");
		String shockwave = request.getParameter("shockwave");
		String vlc = request.getParameter("vlc");
		String shell = request.getParameter("shell");
		
		String cdXp = request.getParameter("cdxp");
		String java = request.getParameter("java");
		String usb = request.getParameter("usb");
		String libre = request.getParameter("libre");
		String skype = request.getParameter("skype");
		
		List<String> listaPr = new ArrayList<String>();
		
		if(zip != null){
			listaPr.add(zip);
		}
		if(cCLeaner != null){
			listaPr.add(cCLeaner);
		}
		if(firefox != null){
			listaPr.add(firefox);
		}
		if(google != null){
			listaPr.add(google);
		}
		if(flashPlayer != null){
			listaPr.add(flashPlayer);
		}
		if(reader != null){
			listaPr.add(reader);
		}
		if(air != null){
			listaPr.add(air);
		}
		if(shockwave != null){
			listaPr.add(shockwave);
		}
		if(vlc != null){
			listaPr.add(vlc);
		}
		if(shell != null){
			listaPr.add(shell);
		}
		if(cdXp != null){
			listaPr.add(cdXp);
		}
		if(java != null){
			listaPr.add(java);
		}
		if(usb != null){
			listaPr.add(usb);
		}
		if(libre != null){
			listaPr.add(libre);
		}
		if(skype != null){
			listaPr.add(skype);
		}
		
	   ManutencaoMicro manutencao = bo.recuperaPorID(Integer.parseInt(idManutencao));
	   
	   manutencao.setHd(hd);
	   manutencao.setMemoria(ram);
	   manutencao.setProcessador(processador);
	   manutencao.setMarca(marca);
	   manutencao.setModelo(modelo);
	   manutencao.setSistema_operacional(so);
	   manutencao.setSolucao_problema(solucao);
	   
	   /*Data de fechamento */
	   DateFormat df = new SimpleDateFormat("dd/mm/yyyy");
	   Date date = new Date();
	   String dt_fechamento = df.format(date);
	   
	   manutencao.setDt_termino(dt_fechamento);
	   manutencao.getMicro().setStatus("a devolver");
	   
	   if(bo.atualiza(manutencao)){
		   
		   if(conta1 != ""){
		   /*Monta Mensagem para enviar para o email da escola*/
			String mensagem =  "<h4>Ola, Segue abaixo usuário e senha para logar no computador!</h4></br>"+
			  
			   "<table style='width:25%;'>"+
			  "<tr>"+
			    "<th>Usuário</th>"+
			    "<th>Senha</th>"+
			  "</tr>"+
			  "<tr>"+
			    "<td>"+conta1+"</td>"+
			    "<td>"+senha1+"</td>"+
			  "</tr>"+
			  "<tr>"+
			    "<td>"+conta2+"</td>"+
			    "<td>"+senha2+"</td>"+
			 "</tr>"+
			"</table> </br>"+
			  
	       "<h4 style='color:blue;'>Programas Instalados:</h4>"+
	       "<li style='color:red;'><b> "+listaPr+" </b></li> </br> " +
			  "</br> <b>Atenciosamente: </br>"+
			  "Tecnologia da Educação </br>"+
			  "2116-0695 / 2116-0487 </br>"+
			  "sme.chamados@campinas.sp.gov.br </b>";
			
					enviaEmail.enviaEmail(mensagem, "ronaldo.lc95@hotmail.com","USUARIO E SENHA");
		   }
		   
		   /*Verifica se os micro ja foram finalizados*/
		  List<ChamadoComputador> chamadoPC = microBO.listaPorInterno(manutencao.getMicro().getChamadoInterno());
		  List<String> listaMicro = new ArrayList<>();
		  List<String> listaTecnico = new ArrayList<>();
		  
		  int idChamadoComputador = 0;
		  String dt_atendimento = "";
		  StringBuilder builder = new StringBuilder();
		  StringBuilder builderTec = new StringBuilder();

			 
		
		  for(ChamadoComputador chamadoComputador : chamadoPC){
			  
			 List<Computador> pc = chamadoComputador.getComputador();
			 idChamadoComputador = chamadoComputador.getId();
			 
			
			 
			 for(Computador comp : pc){
				 
				List<ManutencaoMicro> manutencaoMicro =  bo.verificaIdMicro(comp.getId());
				
				for(ManutencaoMicro tecnico : manutencaoMicro){
					builderTec.append("Técnico Responsavel: "+tecnico.getTecnico().getNome());
					builderTec.append("\n");
			
				}
				 
				 if(!comp.getStatus().equals("a devolver")){
					 
					 listaMicro.add(comp.getStatus());
					 
				 }else{
					 
					 if(!comp.getPatrimonio().equals("")){
						 builder.append("Patrimônio: "+comp.getPatrimonio());
						 builder.append("\n");

					 }else if(!comp.getNota_fiscal().equals("")){
						 builder.append("Nota Fiscal: "+comp.getNota_fiscal());
						 builder.append("\n");

					 }
				 }
				 dt_atendimento = comp.getDt_retirada();
			 }
		  }
		  
		  if(!listaMicro.isEmpty()){
			  System.out.println("Não envia email");
		  }else{
			  
			 ChamadoComputador cc =  microBO.recuperaPorID(idChamadoComputador);
              
			  
			  
			if(cc.isMsg() == false && listaMicro.isEmpty()){
				 

  			   String msg = "<h3>Sistema Interno informa: </h3></br>"
  			   		+ "<b>Número de chamado:</b> "+cc.getNum_chamado_interno()+"</br>"+
  			          "<b>Escola: </b>"+cc.getInstituicao().getNome()+ "</br>"+
  			   		  "<b>Aberto em:</b> "+cc.getDt_cadastro()+ "</br>"+
  			   		  "<b>Atendido em:</b> "+dt_atendimento+ "</br>"+
  			   		  "</br> <b><h3>Informações da Manutenção</h3></b></br>"+
  			          "<b>Computadores: </b>"+builder.toString()+"</br>"+
  			   		  "<b>Técnicos Responsáveis: </b>" +builderTec.toString()+"</br>"+
  			          "<h3>Os computadores ja estão disponível para entrega!</h3>";
  			   
  			   EnviaEmail email = new EnviaEmail();
  			   
  			   email.enviaEmail(msg,"ronaldo.lc95@hotmail.com", "COMPUTADORES FINALIZADO'S");
  			   
  			   cc.setMsg(true);
  			   microBO.atualiza(cc);
			 }

		  }
			
	   }
	   
	   
	   
		
        
		
		return proximo;
	}

}
