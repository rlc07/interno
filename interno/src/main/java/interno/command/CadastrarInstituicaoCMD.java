/**
 * 
 */
package interno.command;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.ChamadoMicroBO;
import interno.bo.ComputadorBO;
import interno.bo.InstituicaoBO;
import interno.bo.ManutencaoMicroBO;
import interno.bo.UsuarioBO;
import interno.modelo.ChamadoComputador;
import interno.modelo.Computador;
import interno.modelo.Instituicao;
import interno.modelo.ManutencaoMicro;
import interno.modelo.Usuario;

/**
 * @author Ronaldo
 *3 de abr de 2017
 */
public class CadastrarInstituicaoCMD implements Command, Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private String proximo="";
	private InstituicaoBO escolaBO;

	/* (non-Javadoc)
	 * @see interno.command.Command#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		proximo = "/privado/usuario/cadastrar-instituicao.jsp";
		escolaBO = new InstituicaoBO();
		
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String naed = request.getParameter("naed");
		String fone = request.getParameter("fonei");
		String numero = request.getParameter("n");
		String cc = request.getParameter("cc");
		String rua = request.getParameter("rua");
		String bairro = request.getParameter("bairro");
		
		try{
			
			Instituicao i = new Instituicao();
			
			i.setBairro(bairro);
			i.setCentro_custo(cc);
			i.setNome(nome);
			i.setRua(rua);
			i.setEmail(email);
			i.setNaed(naed);
			i.setTelefone(Integer.parseInt(fone));
			i.setNumero(Integer.parseInt(numero));
			
			if(escolaBO.cadastra(i) == true){
				proximo = "main?action=instituicoes";

			}
		
			
		}catch (Exception e) {
			System.out.println("Erro ao listar maquinas em manutenção: "+e.getMessage());
		}
		 
	
		return proximo;
	}
	

}
