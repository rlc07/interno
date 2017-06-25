<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="interno.modelo.Instituicao"%>
<%@page import="java.util.List"%>
<%@page import="interno.bo.InstituicaoBO"%>

<%

  InstituicaoBO bo = new InstituicaoBO();

  Gson gson = new Gson();
  
  List<Instituicao> lista = bo.listarTdsInstituicao();
  
  
  String aux = gson.toJson(lista);
  
  System.out.println(aux);
  
  
  PrintWriter oPrintWriter = response.getWriter();
  oPrintWriter.print(aux);

%>