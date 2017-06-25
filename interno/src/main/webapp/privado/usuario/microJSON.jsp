<%@page import="interno.modelo.Computador"%>
<%@page import="interno.bo.ComputadorBO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="interno.modelo.Instituicao"%>
<%@page import="java.util.List"%>
<%@page import="interno.bo.InstituicaoBO"%>

<%

  ComputadorBO bo = new ComputadorBO();

  Gson gson = new Gson();
  String id = request.getParameter("idMicro");
  
  System.out.println(id);
  List<Computador> lista = bo.listaMicroPorID(Integer.parseInt(id));
  
  
  String aux = gson.toJson(lista);
  
  System.out.println(aux);
  
  
  PrintWriter oPrintWriter = response.getWriter();
  oPrintWriter.print(aux);

%>