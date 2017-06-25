<%@page import="interno.modelo.Usuario"%>
<%@page import="interno.bo.UsuarioBO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="interno.modelo.ManutencaoMicro"%>
<%@page import="java.util.List"%>
<%

   UsuarioBO bo = new UsuarioBO();

  Gson gson = new Gson();
  
  List<Usuario> lista = bo.listaUserSistemaAtivo();
  
  
  String aux = gson.toJson(lista);
  
  System.out.println(aux);
  
  
  PrintWriter oPrintWriter = response.getWriter();
  oPrintWriter.print(aux);

%>