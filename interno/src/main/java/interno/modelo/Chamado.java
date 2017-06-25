/**
 * 
 */
package interno.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 * @author Ronaldo
 *17 de mar de 2017
 */
@Entity
@Table(name="chamado")
@Inheritance(strategy=InheritanceType.JOINED)
public class Chamado {
	
	@Id
	@SequenceGenerator(name="SEQ_CHAMADO", sequenceName="SEQ_CHAMADO_ID", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_CHAMADO")
	private int id;
	private String dt_cadastro;
	private String hora_cadastro;
	private String dt_fechamento;
	private String num_chamado_ima;
	
    @NotNull
    @Column(unique=true)
	private String num_chamado_interno;
	private String solicitante;
	private String nome_solicitante;
	private String status;
	private String desc_problema;
	private String desc_fechamento;
	private int fechadoUsuario;
	
	@ManyToOne
	private Instituicao instituicao;
	
	@ManyToOne
	private Usuario usuario;
	
	public Chamado(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDt_cadastro() {
		return dt_cadastro;
	}

	public void setDt_cadastro(String dt_cadastro) {
		this.dt_cadastro = dt_cadastro;
	}

	public String getDt_fechamento() {
		return dt_fechamento;
	}

	public void setDt_fechamento(String dt_fechamento) {
		this.dt_fechamento = dt_fechamento;
	}

	public String getNum_chamado_ima() {
		return num_chamado_ima;
	}

	public void setNum_chamado_ima(String num_chamado_ima) {
		this.num_chamado_ima = num_chamado_ima;
	}

	public String getNum_chamado_interno() {
		return num_chamado_interno;
	}

	public void setNum_chamado_interno(String num_chamado_interno) {
		this.num_chamado_interno = num_chamado_interno;
	}

	public String getSolicitante() {
		return solicitante;
	}

	public void setSolicitante(String solicitante) {
		this.solicitante = solicitante;
	}

	public String getNome_solicitante() {
		return nome_solicitante;
	}

	public void setNome_solicitante(String nome_solicitante) {
		this.nome_solicitante = nome_solicitante;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDesc_problema() {
		return desc_problema;
	}

	public void setDesc_problema(String desc_problema) {
		this.desc_problema = desc_problema;
	}

	public String getDesc_fechamento() {
		return desc_fechamento;
	}

	public void setDesc_fechamento(String desc_fechamento) {
		this.desc_fechamento = desc_fechamento;
	}
	
	

	public Instituicao getInstituicao() {
		return instituicao;
	}

	public void setInstituicao(Instituicao instituicao) {
		this.instituicao = instituicao;
	}

	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	

	public String getHora_cadastro() {
		return hora_cadastro;
	}

	public void setHora_cadastro(String hora_cadastro) {
		this.hora_cadastro = hora_cadastro;
	}

	
	public int getFechadoUsuario() {
		return fechadoUsuario;
	}

	public void setFechadoUsuario(int fechadoUsuario) {
		this.fechadoUsuario = fechadoUsuario;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Chamado other = (Chamado) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return num_chamado_interno;
	}
	
	

}
