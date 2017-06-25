/**
 * 
 */
package interno.modelo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 * @author Ronaldo
 *17 de mar de 2017
 */

@Entity
@Table(name="chamado_visita")
@PrimaryKeyJoinColumn(name="id_chamado")
public class ChamadoVisita extends Chamado{
	
	private String dt_visita;
	private String obs_visita;
	
	@ManyToMany(
	        cascade={CascadeType.PERSIST, CascadeType.MERGE}
	    )
	 @JoinTable(
		        name="USUARIO_VISITA",
		        joinColumns=@JoinColumn(name="id_chamado"),
		        inverseJoinColumns=@JoinColumn(name="id_usuario")
		    )
		private List<Usuario> usuarioVisita;
	
	@ManyToOne
	  private Usuario tecnicoAtt;
	 
	public ChamadoVisita(){}

	public String getDt_visita() {
		return dt_visita;
	}


	public void setDt_visita(String dt_visita) {
		this.dt_visita = dt_visita;
	}




	public List<Usuario> getUsuarioVisita() {
		return usuarioVisita;
	}

	public void setUsuarioVisita(List<Usuario> usuarioVisita) {
		this.usuarioVisita = usuarioVisita;
	}

	public String getObs_visita() {
		return obs_visita;
	}


	public void setObs_visita(String obs_visita) {
		this.obs_visita = obs_visita;
	}


	@Override
	public String toString() {
		return dt_visita;
	}

	public Usuario getTecnicoAtt() {
		return tecnicoAtt;
	}

	public void setTecnicoAtt(Usuario tecnicoAtt) {
		this.tecnicoAtt = tecnicoAtt;
	}
	
	
	

}
