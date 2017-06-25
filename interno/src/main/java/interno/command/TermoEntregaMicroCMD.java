package interno.command;

import java.io.IOException;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import interno.bo.ChamadoMicroBO;
import interno.modelo.ChamadoComputador;

public class TermoEntregaMicroCMD implements Command, Serializable {

	
	private static final long serialVersionUID = 1L;
  
	private String proximo="";
	private ChamadoMicroBO bo;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
            
		proximo = "/privado/usuario/termo-entrega-micro.jsp";
        bo = new ChamadoMicroBO();
        
        String num_chamado = request.getParameter("num-chamado");
        
        List<ChamadoComputador> termo = bo.listaPorInterno(num_chamado);
        
        for(ChamadoComputador cc : termo){
        	
        	request.setAttribute("escola", cc.getInstituicao().getNome());
        	request.setAttribute("email", cc.getInstituicao().getEmail());
        	request.setAttribute("rua", cc.getInstituicao().getRua());
        	
        	if(cc.getInstituicao().getNumero() == 0){
            	request.setAttribute("numero", "S/N");
        	}else{
            	request.setAttribute("numero", cc.getInstituicao().getNumero());
        	}
        	
        	request.setAttribute("bairro", cc.getInstituicao().getBairro());
        	
        	if(cc.getInstituicao().getTelefone() == 0){
            	request.setAttribute("telefone", "S/ Telefone");
        	}else{
            	request.setAttribute("telefone", cc.getInstituicao().getTelefone());
        	}
        	
        	request.setAttribute("computador", cc.getComputador());
        	request.setAttribute("dt_cadastro", cc.getDt_cadastro());
        	request.setAttribute("chamado", num_chamado);

            
        	DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        	Date date = new Date();
        	String dt_entrega = df.format(date);
        	request.setAttribute("dt_retirada", dt_entrega);


        }
		
		return proximo;
	}

}
