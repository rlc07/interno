package interno.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import interno.bo.ChamadoTabletBO;
import interno.modelo.ChamadoTablet;

public class ListaTabletManutencaoCMD implements Command, Serializable {

	
	private static final long serialVersionUID = 1L;

	private String proximo = "";
	private ChamadoTabletBO bo;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
          
		proximo = "/privado/usuario/manutencao-tablet.jsp";
		bo = new ChamadoTabletBO();
		  String chamado = request.getParameter("chamado");
		  String nome_solicitante = request.getParameter("nome_solicitante");
		  String patrimonio = request.getParameter("patrimonio");
		  String select_status = request.getParameter("select_status");
		  String matricula = request.getParameter("matricula");
          String condicao = "";
          
			request.setAttribute("chamado", chamado);
			request.setAttribute("patrimonio", patrimonio);
			request.setAttribute("nome_solicitante", nome_solicitante);
			request.setAttribute("status", select_status);		
			request.setAttribute("matricula", matricula);





		List<ChamadoTablet> lsTabletManutencao = null;
		
		try{
			
			if(chamado != null && !"".equals(chamado) || nome_solicitante != null && !"".equals(nome_solicitante)
					|| patrimonio != null && !"".equals(patrimonio) || select_status != null && !"".equals(select_status)
					|| matricula != null && !"".equals(matricula)){
				
				/*Inicio Filtro por numero de chamado*/
				if(!chamado.equals("") && nome_solicitante.equals("") && patrimonio.equals("") && select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE tb.num_chamado_interno ='"+chamado+"'";
					lsTabletManutencao = bo.listaFiltro(condicao);	
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por numero de chamado*/
				
				/*Inicio Filtro por nome do solicitante*/
				else if(chamado.equals("") && !nome_solicitante.equals("") && patrimonio.equals("") && select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE lower(tb.nome_solicitante)  LIKE '%"+nome_solicitante.toLowerCase()+"%' "
							+ "OR upper(tb.nome_solicitante)  LIKE '%"+nome_solicitante.toLowerCase()+"%'";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por nome do solicitante*/

				/*Inicio Filtro por patrimonio*/
				else if(chamado.equals("") && nome_solicitante.equals("") && !patrimonio.equals("") && select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE lower(tb.patrimonio)  LIKE '%"+patrimonio.toLowerCase()+"%' "
							+ "OR upper(tb.patrimonio)  LIKE '%"+patrimonio.toLowerCase()+"%'";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por ppatrimonio*/
				
				/*Inicio Filtro por status do tablet*/
				else if(chamado.equals("") && nome_solicitante.equals("") && patrimonio.equals("") && !select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE tb.statusTablet =  '"+select_status+"'";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por status do tablet*/
				
				/*Inicio Filtro por matricula*/
				else if(chamado.equals("") && nome_solicitante.equals("") && patrimonio.equals("") && select_status.equals("") && !matricula.equals("")){
					condicao = "";
					condicao = "WHERE tb.matricula =  '"+matricula+"'";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por matricula*/
				
				/*************************************INICIo FILT EM GRUPOS - (CHAMaDO E X)************************************/
				
				/*Inicio Filtro por chamado e nome do solicitane*/
				else if(!chamado.equals("") && !nome_solicitante.equals("") && patrimonio.equals("") && select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE tb.num_chamado_interno ='"+chamado+"' AND lower(tb.nome_solicitante)  LIKE '%"+nome_solicitante.toLowerCase()+"%' "
							+ "OR upper(tb.nome_solicitante)  LIKE '%"+nome_solicitante.toLowerCase()+"%'";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por chamado e nome do solicitane*/
				
				/*Inicio Filtro por chamado e patrimonio*/
				else if(!chamado.equals("") && nome_solicitante.equals("") && !patrimonio.equals("") && select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE tb.num_chamado_interno ='"+chamado+"' AND lower(tb.patrimonio)  LIKE '%"+patrimonio.toLowerCase()+"%' "
							+ "OR upper(tb.patrimonio)  LIKE '%"+patrimonio.toLowerCase()+"%'";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por chamado e patrimonio*/
				
				/*Inicio Filtro por chamado e status*/
				else if(!chamado.equals("") && nome_solicitante.equals("") && patrimonio.equals("") && !select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE tb.num_chamado_interno ='"+chamado+"' AND tb.statusTablet = '"+select_status+"'";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por chamado e status*/
				
				/*Inicio Filtro por chamado e matricula*/
				else if(!chamado.equals("") && nome_solicitante.equals("") && patrimonio.equals("") && select_status.equals("") && !matricula.equals("")){
					condicao = "";
					condicao = "WHERE tb.num_chamado_interno ='"+chamado+"' AND tb.matricula = '"+matricula+"'";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por chamado e matricula*/
				
				
				/*************************************INICIo FILT EM GRUPOS - (Nome solici.. E X)************************************/

				
				/*Inicio Filtro por nome solicitante e patrimonio*/
				else if(chamado.equals("") && !nome_solicitante.equals("") && !patrimonio.equals("") && select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE lower(tb.nome_solicitante)  LIKE '%"+nome_solicitante.toLowerCase()+"%' "
							+ " AND lower(tb.patrimonio)  LIKE '%"+patrimonio.toLowerCase()+"%' ";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por nome solicitante e patrimonio*/
				
				/*Inicio Filtro por nome soliciante e status*/
				else if(chamado.equals("") && !nome_solicitante.equals("") && patrimonio.equals("") && !select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE lower(tb.nome_solicitante)  LIKE '%"+nome_solicitante.toLowerCase()+"%' "
							+ "AND tb.statusTablet = '"+select_status+"'"; 
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por nome  e status*/
				
				/*Inicio Filtro por nome soliciante e matricula*/
				else if(chamado.equals("") && !nome_solicitante.equals("") && patrimonio.equals("") && select_status.equals("") && !matricula.equals("")){
					condicao = "";
					condicao = "WHERE lower(tb.nome_solicitante)  LIKE '%"+nome_solicitante.toLowerCase()+"%' "
							+ " AND tb.matricula= '"+matricula+"'"; 
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por nome  e matricula*/
				
				
				/*************************************INICIo FILT EM GRUPOS - (Patrimonio.. E X)************************************/

				/*Inicio Filtro por patrimonio e status*/
				else if(chamado.equals("") && nome_solicitante.equals("") && !patrimonio.equals("") && !select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE lower(tb.patrimonio)  LIKE '%"+patrimonio.toLowerCase()+"%' "
							+ " AND tb.statusTablet = '"+select_status+"'";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por patrimonio e status*/
				
				/*Inicio Filtro por patrimonio e matricula*/
				else if(chamado.equals("") && nome_solicitante.equals("") && !patrimonio.equals("") && select_status.equals("") && !matricula.equals("")){
					condicao = "";
					condicao = "WHERE lower(tb.patrimonio)  LIKE '%"+patrimonio.toLowerCase()+"%' "
							+ " AND tb.matricula = '"+matricula+"'";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por patrimonio e matricula*/
				
				/*************************************INICIo FILT EM GRUPOS d 3- (Chamado.. E X,X)************************************/

				/*Inicio Filtro por chamado , nome do solicitane, e patrimonio*/
				else if(!chamado.equals("") && !nome_solicitante.equals("") && !patrimonio.equals("") && select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE tb.num_chamado_interno ='"+chamado+"' AND lower(tb.nome_solicitante)  "
							+ "LIKE '%"+nome_solicitante.toLowerCase()+"%' "
									+ "AND lower(tb.patrimonio)  LIKE '%"+patrimonio.toLowerCase()+"%' ";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por chamado , nome do solicitane e patrimonio*/
				
				/*Inicio Filtro por chamado , status, e patrimonio*/
				else if(!chamado.equals("") && nome_solicitante.equals("") && !patrimonio.equals("") && !select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE tb.num_chamado_interno ='"+chamado+"' AND tb.statusTablet = '"+select_status+"'"
									+ "AND lower(tb.patrimonio)  LIKE '%"+patrimonio.toLowerCase()+"%' ";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por chamado , status e patrimonio*/
				
				/*Inicio Filtro por status , nome do solicitane, e patrimonio*/
				else if(chamado.equals("") && !nome_solicitante.equals("") && !patrimonio.equals("") && !select_status.equals("") && matricula.equals("")){
					condicao = "";
					condicao = "WHERE lower(tb.nome_solicitante) LIKE '%"+nome_solicitante.toLowerCase()+"%' "
							+"AND tb.statusTablet = '"+select_status+"'"
									+ "AND lower(tb.patrimonio)  LIKE '%"+patrimonio.toLowerCase()+"%' ";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro por status , nome do solicitane e patrimonio*/
				
				/*Inicio Filtro por completo*/
				else if(!chamado.equals("") && !nome_solicitante.equals("") && !patrimonio.equals("") && !select_status.equals("") && !matricula.equals("")){
					condicao = "";
					condicao = "WHERE tb.num_chamado_interno = '"+chamado+"' AND tb.matricula ='"+matricula+"' AND"
							+ " AND lower(tb.nome_solicitante) LIKE '%"+nome_solicitante.toLowerCase()+"%' "
							+"AND tb.statusTablet =  '"+select_status+"'"
									+ "AND lower(tb.patrimonio)  LIKE '%"+patrimonio.toLowerCase()+"%' ";
					lsTabletManutencao = bo.listaFiltro(condicao);		
					request.setAttribute("lsTabletManutencao", lsTabletManutencao);

				}
				/*Fim Filtro completo*/
				
			}else{			
			lsTabletManutencao = bo.lsTabletManutencao();
			request.setAttribute("lsTabletManutencao", lsTabletManutencao);
			}

				  
		}catch (Exception e) {
          System.out.println("(COMMAND) Erro ao listar tablet manutencão: "+e.getMessage());
		}
		
		return proximo;
	}

}
