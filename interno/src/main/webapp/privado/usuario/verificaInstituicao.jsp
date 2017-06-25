<%@page import="interno.modelo.Instituicao"%>
<%@page import="interno.bo.InstituicaoBO"%>


<%
         InstituicaoBO bo = new InstituicaoBO();
         String nome = request.getParameter("instituicao");

         
        	if(bo.verificarNomeInstituicao(nome)){
        		nome.trim().equalsIgnoreCase(nome);
        		out.println("true");
        		

        	}else{
            	out.println("false");
            	

            }
        

%>