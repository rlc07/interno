/**
 * 
 */
package interno.bo;

import java.util.List;

import interno.dao.ManutencaoMicroDAO;
import interno.modelo.ManutencaoMicro;

/**
 * @author Ronaldo
 *3 de abr de 2017
 */
public class ManutencaoMicroBO {
	
	private ManutencaoMicroDAO dao;
	
	public ManutencaoMicroBO(){
		dao = new ManutencaoMicroDAO();
	}
	
	/*cadastrar micro na tabela manutencao*/
	public boolean salvar(ManutencaoMicro manutencao){
		boolean isValido = false;
		
		try{
			if(dao.persist(manutencao)){
				isValido = true;
			}
		}catch (Exception e) {
			System.out.println("Erro ao salvar micro na tabela manutenção: "+e.getMessage());
		}
		return isValido;
	}
	
	/*Atualizamicro na tabela manutencao*/
	public boolean atualiza(ManutencaoMicro manutencao){
		boolean isValido = false;
		
		try{
			if(dao.update(manutencao)){
				isValido = true;
			}
		}catch (Exception e) {
			System.out.println("Erro ao atualizar micro na tabela manutenção: "+e.getMessage());
		}
		return isValido;
	}
	
	/*Verifica se o id do micro existe na tabela manutancao*/
	public List<ManutencaoMicro> verificaIdMicro(int id){
		List<ManutencaoMicro> lista = null;
		
		try{
			lista = dao.verificaIdMicro(id);
		}catch (Exception e) {
			System.out.println("Erro ao verificar se o id do micro existe na tabela manutenção: "+e.getMessage());
		}
		return lista;
	}
	
	/*Listar todas as maquinas em manutenção*/
	public List<ManutencaoMicro> listarTdsMaquina(){
		List<ManutencaoMicro> lista = null;
		
		try{
			lista = dao.listarTdsMaquina();
		}catch (Exception e) {
			System.out.println("Erro ao listar maquinas em manutenção: "+e.getMessage());
		}
		return lista;
	}
	
	/*recupera por ID*/
	public ManutencaoMicro recuperaPorID(int id){
		ManutencaoMicro microManutencao = null;
		
		try{
			microManutencao = dao.recuperaPorID(id);
		}catch (Exception e) {
			System.out.println("Erro aorecuperar micro por id (manutencao): "+e.getMessage());
		}
		return microManutencao;
	}
	
	/*Lista filtro*/
	public List<ManutencaoMicro> listaFiltro(String condicao){
		List<ManutencaoMicro> listaFiltro = null;
		
		try{
			listaFiltro = dao.listaFiltro(condicao);
		}catch (Exception e) {
			System.out.println("Erro ao listar por filtro: "+e.getMessage());
		}
		return listaFiltro;
	}
	
	/*verifica se o usurio esta mechenmdo no icro para montar o historico*/
	public List<ManutencaoMicro> verificaTecnico(int id){
		
	List<ManutencaoMicro> lista = null;
		
		try{
			lista = dao.verificaTecnico(id);
		}catch (Exception e) {
			System.out.println("Erro ao verificar tecnico (BO): "+e.getMessage());
		}
		return lista;
	}
	
	/*verifica se o usurio esta mechenmdo no icro para montar o historico*/
	public List<ManutencaoMicro> verificaTecnicoQuantidade(int id){
		
	List<ManutencaoMicro> lista = null;
		
		try{
			lista = dao.verificaTecnicoQuantidade(id);
		}catch (Exception e) {
			System.out.println("Erro ao verificar tecnico qtd (BO): "+e.getMessage());
		}
		return lista;
	}

}
