/**
 * 
 */
package interno.bo;

import java.util.List;

import interno.dao.ChamadoTabletDAO;
import interno.modelo.ChamadoTablet;

/**
 * @author Ronaldo
 *25 de mar de 2017
 */
public class ChamadoTabletBO {
	
	private ChamadoTabletDAO dao;
	
	public ChamadoTabletBO(){
		dao = new ChamadoTabletDAO();
	}
	
	public boolean cadastrarChamadoTablet(ChamadoTablet tablet){
		
		boolean isValido = false;
		try{
			if(dao.persist(tablet)){
				isValido = true;
			}
		}catch (Exception e) {
			System.out.println("Erro ao cadastrar chamado de tablet: "+e.getMessage());
		}
		return isValido;
	}
	
	public List<ChamadoTablet> listarNumChamado(String numChamado){
		
		List<ChamadoTablet> tablet = null;
		
		try{
			tablet = dao.listarNumChamado(numChamado);
		}catch (Exception e) {
			System.out.println("Erro ao listar chamado de tablet por numero de chamado interno: " +e.getMessage());
		}
		return tablet;
	}
	
	public ChamadoTablet recuperaPorID(int id){
		ChamadoTablet tb = null;
		try{
			tb = dao.recuperaPorId(id);
		}catch (Exception e) {
			System.out.println("Erro ao recuperar chamado de tablet por id: " +e.getMessage());
		}
		
		return tb;
	}
	
	public boolean atualiza(ChamadoTablet tablet){
		boolean isValido = false;
		try{
			if(dao.update(tablet)){
				isValido = true;
			}
		}catch (Exception e) {
			System.out.println("Erro ao atualizar tablet: "+e.getMessage());
		}
		return isValido;
	}
	
	/*Verifica se exite um tecnico responsavel pelo tablet*/
	public List<ChamadoTablet> verificaTecnicoResponsavel(String chamado){
		List<ChamadoTablet> tecnico = null;
		
		try{
			tecnico = dao.verificaTecnicoResponsavel(chamado);
		}catch (Exception e) {
			System.out.println("Erro ao verificar tecnico existente: "+e.getMessage());
		}
		return tecnico;
	}
	
	/*Lisa tablet manutenção*/
	public List<ChamadoTablet> lsTabletManutencao(){
		List<ChamadoTablet> lsTabletManutencao = null;
		
		try{
			lsTabletManutencao = dao.lsTabletManutencao();
		}catch (Exception e) {
			System.out.println("Erro ao listar tablet manutencao: "+e.getMessage());
		}
		
		return lsTabletManutencao;
	}
	
	/*Lista Tablet por filtro*/
	public List<ChamadoTablet> listaFiltro(String condicao){
		List<ChamadoTablet> lista = null;
		try{
			lista = dao.listaFiltro(condicao);
		}catch (Exception e) {
			System.out.println("Erro ao listar tablet manutencao por filtro (BO): "+e.getMessage());
		}
		return lista;
	}
	
	/*Verifica se o usuario x e responsavel pelo tablet*/
	public List<ChamadoTablet> verificaTecnico(String nome){
		List<ChamadoTablet> lista = null;

		try{
			lista = dao.verificaTecnico(nome);
		}catch (Exception e) {
			System.out.println("Erro ao listartecnico responsavel pelo tablet (BO): "+e.getMessage());
		}
		return lista;
	}
	
	/*Verifica se o usuario x e responsavel pelo tablet*/
	public List<ChamadoTablet> verificaTecnicoQuantidade(String nome){
		List<ChamadoTablet> lista = null;

		try{
			lista = dao.verificaTecnicoQuantidade(nome);
		}catch (Exception e) {
			System.out.println("Erro ao listartecnico responsavel pelo tablet (BO): "+e.getMessage());
		}
		return lista;
	}
}
