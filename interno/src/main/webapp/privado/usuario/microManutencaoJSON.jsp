<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="interno.modelo.ManutencaoMicro"%>
<%@page import="java.util.List"%>
<%@page import="interno.bo.ManutencaoMicroBO"%>
<%

  ManutencaoMicroBO bo = new ManutencaoMicroBO();

  Gson gson = new Gson();
  
  List<ManutencaoMicro> lista = bo.listarTdsMaquina();
  
  
  String aux = gson.toJson(lista);
  
  System.out.println(aux);
  
  
  PrintWriter oPrintWriter = response.getWriter();
  oPrintWriter.print(aux);

%>