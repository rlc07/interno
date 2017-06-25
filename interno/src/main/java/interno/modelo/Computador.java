/**
 * 
 */
package interno.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * @author Ronaldo
 *30 de mar de 2017
 */

@Entity
@Table(name="computador")
public class Computador {
	
	@Id
	@SequenceGenerator(name="SEQ_COMPUTADOR", sequenceName="SEQ_COMPUTADOR_ID", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_COMPUTADOR")
    private int id;
	private String patrimonio;
	private String nota_fiscal;
	private String localizacao;
	private String tipo_micro;
	private String desc_problema;
	private String status;
	private String motivo;
	private boolean backup;
	private String chamadoInterno;
	private String instituicao;
	private int usuarioVerifica;
	
	private String dt_retirada;

	public Computador(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPatrimonio() {
		return patrimonio;
	}

	public void setPatrimonio(String patrimonio) {
		this.patrimonio = patrimonio;
	}

	public String getNota_fiscal() {
		return nota_fiscal;
	}

	public void setNota_fiscal(String nota_fiscal) {
		this.nota_fiscal = nota_fiscal;
	}

	public String getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}

	public String getTipo_micro() {
		return tipo_micro;
	}

	public void setTipo_micro(String tipo_micro) {
		this.tipo_micro = tipo_micro;
	}

	public String getDesc_problema() {
		return desc_problema;
	}

	public void setDesc_problema(String desc_problema) {
		this.desc_problema = desc_problema;
	}

	
	

	public String getInstituicao() {
		return instituicao;
	}

	public void setInstituicao(String instituicao) {
		this.instituicao = instituicao;
	}

	public String getChamadoInterno() {
		return chamadoInterno;
	}

	public void setChamadoInterno(String chamadoInerno) {
		this.chamadoInterno = chamadoInerno;
	}

	public boolean isBackup() {
		return backup;
	}

	public void setBackup(boolean backup) {
		this.backup = backup;
	}

	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Computador [tipo_micro=" + tipo_micro + "]";
	}
	
	

	public String getDt_retirada() {
		return dt_retirada;
	}

	public void setDt_retirada(String dt_retirada) {
		this.dt_retirada = dt_retirada;
	}
	
	

	public int getUsuarioVerifica() {
		return usuarioVerifica;
	}

	public void setUsuarioVerifica(int usuarioVerifica) {
		this.usuarioVerifica = usuarioVerifica;
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
		Computador other = (Computador) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
	
	
	
	

}
