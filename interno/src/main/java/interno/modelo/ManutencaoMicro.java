/**
 * 
 */
package interno.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * @author Ronaldo
 *17 de mar de 2017
 */

@Entity
@Table(name="manutencao_micro")
public class ManutencaoMicro {
	
	@Id
	@SequenceGenerator(name="SEQ_MANUTENCAO", sequenceName="SEQ_MANUTENCAO_ID", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_MANUTENCAO")
	private int id;
	private String hd;
	private String memoria;
	private String processador;
	private String sistema_operacional;
	private String marca;
	private String modelo;
	private String dt_inicio;
	private String dt_termino;
	
	@ManyToOne
	private Usuario tecnico;
	
	@OneToOne
	private Computador micro;
	
	private String solucao_problema;
	
	public ManutencaoMicro(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHd() {
		return hd;
	}

	public void setHd(String hd) {
		this.hd = hd;
	}

	public String getMemoria() {
		return memoria;
	}

	public void setMemoria(String memoria) {
		this.memoria = memoria;
	}

	public String getProcessador() {
		return processador;
	}

	public void setProcessador(String processador) {
		this.processador = processador;
	}

	public String getSistema_operacional() {
		return sistema_operacional;
	}

	public void setSistema_operacional(String sistema_operacional) {
		this.sistema_operacional = sistema_operacional;
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

	public String getDt_inicio() {
		return dt_inicio;
	}

	public void setDt_inicio(String dt_inicio) {
		this.dt_inicio = dt_inicio;
	}

	public String getDt_termino() {
		return dt_termino;
	}

	public void setDt_termino(String dt_termino) {
		this.dt_termino = dt_termino;
	}

	public Usuario getTecnico() {
		return tecnico;
	}

	public void setTecnico(Usuario tecnico) {
		this.tecnico = tecnico;
	}

	public String getSolucao_problema() {
		return solucao_problema;
	}

	public void setSolucao_problema(String solucao_problema) {
		this.solucao_problema = solucao_problema;
	}
	


	public Computador getMicro() {
		return micro;
	}

	public void setMicro(Computador micro) {
		this.micro = micro;
	}

	@Override
	public String toString() {
		return "ManutencaoMicro [id=" + id + "]";
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
		ManutencaoMicro other = (ManutencaoMicro) obj;
		if (id != other.id)
			return false;
		return true;
	};
	
	

}
