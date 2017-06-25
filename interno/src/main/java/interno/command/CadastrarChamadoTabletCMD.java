/**
 * 
 */
package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.ChamadoTabletBO;
import interno.bo.InstituicaoBO;
import interno.bo.UsuarioBO;
import interno.modelo.ChamadoTablet;
import interno.modelo.Instituicao;
import interno.modelo.Usuario;

/**
 * @author Ronaldo
 *25 de mar de 2017
 */
public class CadastrarChamadoTabletCMD implements Command{

	private String proximo = "";
	private ChamadoTabletBO bo;
	private InstituicaoBO escolaBO;
	private UsuarioBO usuarioBO;
	
	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
           
		proximo = "/privado/usuario/cadastrar-chamado.jsp";
		bo = new ChamadoTabletBO();
		escolaBO = new InstituicaoBO();
		usuarioBO = new UsuarioBO();
		
		String instituicao = request.getParameter("instituicao");
		String nome = request.getParameter("nome");
		String matricula = request.getParameter("matricula");
        String fone = request.getParameter("fone");
		String cargo = request.getParameter("cargo");
		String patrimonio = request.getParameter("patrimonio");
		String marca = request.getParameter("marca");
		String modelo = request.getParameter("modelo");
		String backup = request.getParameter("select_backup");
		String capa = request.getParameter("capa");
		String caixa = request.getParameter("caixa");
		String carregador = request.getParameter("carregador");
		String foneOuvido = request.getParameter("foneOuvido");
		String modem = request.getParameter("modem");
		String desc_problema = request.getParameter("desc_problema");
		String idUsuario = request.getParameter("idUsuario");
		
		
		Instituicao escola = escolaBO.recuperaEscolaPorId(Integer.parseInt(instituicao));
		Usuario usuario = usuarioBO.localizarPorId(Integer.parseInt(idUsuario));
		
		ChamadoTablet tablet = new ChamadoTablet();
		
		tablet.setInstituicao(escola);
		tablet.setUsuario(usuario);
		
		tablet.setNome_solicitante(nome);
		tablet.setMatricula(matricula);
		tablet.setDesc_problema(desc_problema);
		
		if(caixa != null){
			tablet.setCaixa(true);
		}else{
			tablet.setCaixa(false);
		}
		
		if(foneOuvido != null){
			tablet.setFone(true);
		}else{
			tablet.setFone(false);
		}

		if(capa != null){
			tablet.setCapa(true);
		}else{
			tablet.setCapa(false);
		}

		if(carregador != null){
			tablet.setCarregador(true);
		}else{
			tablet.setCarregador(false);
		}

		if(modem != null){
			tablet.setModem(true);
		}else{
			tablet.setModem(false);
		}
		
		tablet.setMarca(marca);
		tablet.setModelo(modelo);
		tablet.setPatrimonio(patrimonio);
		tablet.setTel(fone);
		tablet.setCargo(cargo);
		tablet.setStatus("aberto");
		tablet.setStatusTablet("manutencao");

        if(backup.equals("true")){
        	tablet.setBackup(true);
        }else{
        	tablet.setBackup(false);
        }
        
		try{
		DateFormat data = new SimpleDateFormat("dd/MM/YYYY HH:mm");
		Date date = new Date();
		String dt_hora = data.format(date);
		
		String dt_cad = dt_hora.substring(0,10);
		String hora_cad = dt_hora.substring(11,16);
		tablet.setDt_cadastro(dt_cad);
		tablet.setHora_cadastro(hora_cad);
		
		/*Gerar numero de chamado Ano - Mes - Hora - Minuto - Segundo*/
		DateFormat dateFormat = new SimpleDateFormat("ddMMyyHHmmss");
		Date dateChamado = new Date();
		String numeroChamado = dateFormat.format(dateChamado);
		tablet.setNum_chamado_interno(numeroChamado);
		tablet.setTecnico_responsavel("disponivel");
		
		

		if(bo.cadastrarChamadoTablet(tablet)){
			PrintWriter out = response.getWriter();
			request.setAttribute("cham", numeroChamado);

			out.print("true");
			out.print(numeroChamado);
			out.flush();
			out.close();
			
			request.setAttribute("cham", numeroChamado);
		}
		}catch (Exception e) {
			System.out.println("Erro ao cadastrar tablet: "+e.getMessage());
		}
		




		
		
		return proximo;
	}

}
