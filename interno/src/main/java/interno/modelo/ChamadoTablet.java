/**
 * 
 */
package interno.modelo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 * @author Ronaldo
 *17 de mar de 2017
 */

@Entity
@Table(name="chamado_tablet")
@PrimaryKeyJoinColumn(name="id_chamado")
public class ChamadoTablet extends Chamado{
	
	private String patrimonio;
	private String marca;
	private String modelo;
	private boolean caixa;
	private boolean capa;
	private boolean carregador;
	private boolean fone;
	private boolean modem;
	private String matricula;
	private String tel;
	
	private String tecnico_responsavel;
	
	private String cargo;
	private boolean backup;
	private String statusTablet;
	private String solucao_tablet;
	private Date dt_inicio;
	private Date dt_fim;
	private Date dt_envio_ima;
	private Date dt_cheg_ima;
	private Date dt_solicitacao_ima;
	private boolean msg;
	private String resolvido;
	private int usuarioEnviaIma;
	private String tecnicoIma;
	private int usuarioRecebeIma;
	
	public ChamadoTablet(){}

	public String getPatrimonio() {
		return patrimonio;
	}

	public void setPatrimonio(String patrimonio) {
		this.patrimonio = patrimonio;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public boolean isCaixa() {
		return caixa;
	}

	public void setCaixa(boolean caixa) {
		this.caixa = caixa;
	}

	public boolean isCapa() {
		return capa;
	}

	public void setCapa(boolean capa) {
		this.capa = capa;
	}

	public boolean isCarregador() {
		return carregador;
	}

	public void setCarregador(boolean carregador) {
		this.carregador = carregador;
	}

	public boolean isFone() {
		return fone;
	}

	public void setFone(boolean fone) {
		this.fone = fone;
	}

	public boolean isModem() {
		return modem;
	}

	public void setModem(boolean modem) {
		this.modem = modem;
	}




	public String getTecnico_responsavel() {
		return tecnico_responsavel;
	}

	public void setTecnico_responsavel(String tecnico_responsavel) {
		this.tecnico_responsavel = tecnico_responsavel;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	


	public String getResolvido() {
		return resolvido;
	}

	public void setResolvido(String resolvido) {
		this.resolvido = resolvido;
	}

	public String getSolucao_tablet() {
		return solucao_tablet;
	}

	public void setSolucao_tablet(String solucao_tablet) {
		this.solucao_tablet = solucao_tablet;
	}

	public String getStatusTablet() {
		return statusTablet;
	}

	public void setStatusTablet(String statusTablet) {
		this.statusTablet = statusTablet;
	}

	@Override
	public String toString() {
		return marca;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public boolean isBackup() {
		return backup;
	}

	public void setBackup(boolean backup) {
		this.backup = backup;
	}



	public Date getDt_inicio() {
		return dt_inicio;
	}

	public void setDt_inicio(Date dt_inicio) {
		this.dt_inicio = dt_inicio;
	}

	public Date getDt_fim() {
		return dt_fim;
	}

	public void setDt_fim(Date dt_fim) {
		this.dt_fim = dt_fim;
	}

	public Date getDt_envio_ima() {
		return dt_envio_ima;
	}

	public void setDt_envio_ima(Date dt_envio_ima) {
		this.dt_envio_ima = dt_envio_ima;
	}

	public Date getDt_cheg_ima() {
		return dt_cheg_ima;
	}

	public void setDt_cheg_ima(Date dt_cheg_ima) {
		this.dt_cheg_ima = dt_cheg_ima;
	}

	public boolean isMsg() {
		return msg;
	}

	public void setMsg(boolean msg) {
		this.msg = msg;
	}

	public Date getDt_solicitacao_ima() {
		return dt_solicitacao_ima;
	}

	public void setDt_solicitacao_ima(Date dt_solicitacao_ima) {
		this.dt_solicitacao_ima = dt_solicitacao_ima;
	}

	public int getUsuarioEnviaIma() {
		return usuarioEnviaIma;
	}

	public void setUsuarioEnviaIma(int usuarioEnviaIma) {
		this.usuarioEnviaIma = usuarioEnviaIma;
	}

	public String getTecnicoIma() {
		return tecnicoIma;
	}

	public void setTecnicoIma(String tecnicoIma) {
		this.tecnicoIma = tecnicoIma;
	}

	public int getUsuarioRecebeIma() {
		return usuarioRecebeIma;
	}

	public void setUsuarioRecebeIma(int usuarioRecebeIma) {
		this.usuarioRecebeIma = usuarioRecebeIma;
	}


	
	

}
