/**
 * 
 */
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
import interno.bo.InstituicaoBO;
import interno.bo.UsuarioBO;
import interno.dao.ChamadoMicroDAO;
import interno.modelo.ChamadoComputador;
import interno.modelo.Computador;
import interno.modelo.Instituicao;
import interno.modelo.Usuario;


/**
 * @author Ronaldo
 *19 de mar de 2017
 */
public class CadastrarChamadoMicroCMD implements Command, Serializable{


	private static final long serialVersionUID = -3364566596936748404L;

	private String proximo = "";
	private ChamadoMicroBO bo;
	private InstituicaoBO instBO;
	private UsuarioBO userBO;
	
	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		proximo = "privado/usuario/cadastrar-chamado.jsp";
		bo = new ChamadoMicroBO();
		instBO = new InstituicaoBO();
		userBO = new UsuarioBO();
		
		String instituicao = request.getParameter("instituicao");

		String solicitante = request.getParameter("solicitante");
		String nome_solicitante = request.getParameter("nome");
		String num_ima= request.getParameter("numima");
		String idUsuario = request.getParameter("idUsuario");
		
		String patrimonio="";
		String nf="";
		String localizacao="";
		String tipo_micro="";
		String desc_problema="";
		String bk="";
		
		int posicao;
		int qtd = 10;
		
		List<Computador> listaComputador = new ArrayList<Computador>();
		for(posicao= 0; posicao<=10; posicao++){
						
			 tipo_micro = request.getParameter("tipo_micro["+posicao+"]");
			 desc_problema = request.getParameter("desc_problema["+posicao+"]");
			 patrimonio = request.getParameter("patrimonio["+posicao+"]");
			 nf = request.getParameter("nf["+posicao+"]");
			 localizacao = request.getParameter("localizacao["+posicao+"]");
			 bk = request.getParameter("bk["+posicao+"]");
			 
				try{
				if(tipo_micro != null){
					
					Computador micro = new Computador();
					
						micro.setTipo_micro(tipo_micro);
						micro.setDesc_problema(desc_problema);
						micro.setPatrimonio(patrimonio);
						micro.setNota_fiscal(nf);
						micro.setLocalizacao(localizacao);
						
						if(bk.equals("Sim") || bk.equals("")){
							micro.setBackup(true);
						}else if(bk.equals("Não")){
							micro.setBackup(false);
						}
						micro.setStatus("aguardando");
						
						listaComputador.add(micro);
				
				}
				}
				catch (Exception e) {
                 System.out.println("erro ao gravar os micro na lista: "+e.getMessage());
				}

		}

		ChamadoComputador pc = new ChamadoComputador();
		
		Instituicao escola = instBO.recuperaEscolaPorId(Integer.parseInt(instituicao));
		
		pc.setInstituicao(escola);
		pc.setSolicitante(solicitante);
		pc.setNome_solicitante(nome_solicitante);
		pc.setMsg(false);
	    pc.setNum_chamado_ima(num_ima);
        pc.setComputador(listaComputador);
        pc.setStatus("aberto"); 
		

		DateFormat data = new SimpleDateFormat("dd/MM/YY HH:mm");
		Date date = new Date();
		String dt_hora = data.format(date);
		
		String dt_cad = dt_hora.substring(0,8);
		String hora_cad = dt_hora.substring(9,14);
		pc.setDt_cadastro(dt_cad);
		pc.setHora_cadastro(hora_cad);
		
	
		
		Usuario user = null;
		try{
			/*Gerar numero de chamado Ano - Mes - Hora - Minuto - Segundo*/
			DateFormat dateFormat = new SimpleDateFormat("ddMMyyHHmmss");
			Date dateChamado = new Date();
			String numeroChamado = dateFormat.format(dateChamado);
			
			pc.setNum_chamado_interno(numeroChamado);
			
			user = userBO.localizarPorId(Integer.parseInt(idUsuario));
            pc.setUsuario(user);
			
			if(bo.cadastrarChamadoMicro(pc)){
				PrintWriter out = response.getWriter();
				out.print("true");
				out.print(numeroChamado);
				out.flush();
				out.close();
			}
		}catch (Exception e) {
            System.out.println("erro ao cadastrar chamado de micro: "+e.getMessage());
		}
		
		
		return proximo;
	}

}
