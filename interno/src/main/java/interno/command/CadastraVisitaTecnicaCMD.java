package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interno.bo.ChamadoVisitaBO;
import interno.bo.InstituicaoBO;
import interno.modelo.ChamadoVisita;
import interno.modelo.Instituicao;
import interno.modelo.Usuario;

public class CadastraVisitaTecnicaCMD implements Command, Serializable{

	private ChamadoVisitaBO bo;
	private String proximo = "";
	private InstituicaoBO escolaBO;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		proximo = "/privado/usuario/cadastrar-chamado.jsp";
		bo = new ChamadoVisitaBO();
		escolaBO = new InstituicaoBO();
		
		String instituicao = request.getParameter("instituicao");
		String desc_problema = request.getParameter("desc_problema");
		String nome = request.getParameter("nome");
		
		HttpSession session = request.getSession();
		Usuario userSession = (Usuario) session.getAttribute("usuarioLogado");
		
		ChamadoVisita visita = new ChamadoVisita();
		
		try{
			
			DateFormat data = new SimpleDateFormat("dd/MM/YYYY HH:mm");
			Date date = new Date();
			String dt_hora = data.format(date);
			
			String dt_cad = dt_hora.substring(0,10);
			String hora_cad = dt_hora.substring(11,16);
			visita.setDt_cadastro(dt_cad);
			visita.setHora_cadastro(hora_cad);
			
			/*Gerar numero de chamado Ano - Mes - Hora - Minuto - Segundo*/
			DateFormat dateFormat = new SimpleDateFormat("ddMMyyHHmmss");
			Date dateChamado = new Date();
			String numeroChamado = dateFormat.format(dateChamado);
			visita.setNum_chamado_interno(numeroChamado);
			
			visita.setDesc_problema(desc_problema);
			
			Instituicao escola = escolaBO.recuperaEscolaPorId(Integer.parseInt(instituicao));
			visita.setInstituicao(escola);
			visita.setUsuario(userSession);
			visita.setNome_solicitante(nome);
			
			if(bo.salvar(visita)){
				PrintWriter pw = response.getWriter();
				pw.print("true");
				pw.print(numeroChamado);
				pw.flush();
				pw.close();
			}
			
		}catch (Exception e) {
			System.out.println("Erro ao salvar chamado de visita COMMAND "+e.getMessage());
		}
		
		
		
		return proximo;
	}

}
