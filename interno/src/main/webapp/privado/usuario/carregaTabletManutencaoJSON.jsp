<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="interno.bo.ChamadoTabletBO"%>
<%@page import="interno.modelo.ChamadoTablet"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%

  List<ChamadoTablet> lsTablet = null;
  ChamadoTabletBO bo = new ChamadoTabletBO();
  String chamado = request.getParameter("chamado");

  System.out.print(chamado);
  try{
	  
	   if(chamado != null){
			String condicao = "WHERE tb.num_chamado_interno='"+chamado+"'";

		   lsTablet = bo.listaFiltro(condicao);
				   
				   Gson gson = new Gson();

			  String aux = gson.toJson(lsTablet);

			  
			  PrintWriter oPrintWriter = response.getWriter();
			  oPrintWriter.print(aux);
	   }else{
	  lsTablet = bo.lsTabletManutencao();
	  Gson gson = new Gson();

	  String aux = gson.toJson(lsTablet);

	  
	  PrintWriter oPrintWriter = response.getWriter();
	  oPrintWriter.print(aux);
	   }
	  
  }catch(Exception e){
	  System.out.print("(JSON) Erro ao listar tablet manutenção: "+e.getMessage());
  }
 

%>