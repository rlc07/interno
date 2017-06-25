/**
 * 
 */
package interno.modelo;


import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.*;

/**
 * @author Ronaldo
 *17 de mar de 2017
 */

@Entity
@Table(name="chamado_computador")
@PrimaryKeyJoinColumn(name="id")
public class ChamadoComputador extends Chamado{

	private int usuario_retirada;
	
	@ManyToMany(
	        cascade={CascadeType.PERSIST, CascadeType.MERGE}
	    )
	    @JoinTable(
	        name="MICRO_CHAMADO",
	        joinColumns=@JoinColumn(name="id_chamado"),
	        inverseJoinColumns=@JoinColumn(name="id_micro")
	    )
	private List<Computador> computador;
	private boolean msg;

	
	public ChamadoComputador(){}







	public boolean isMsg() {
		return msg;
	}







	public void setMsg(boolean msg) {
		this.msg = msg;
	}







	public int getUsuario_retirada() {
		return usuario_retirada;
	}

	public void setUsuario_retirada(int usuario_retirada) {
		this.usuario_retirada = usuario_retirada;
	}





	public List<Computador> getComputador() {
		return computador;
	}





	public void setComputador(List<Computador> computador) {
		this.computador = computador;
	}







	@Override
	public String toString() {
		return "ChamadoComputador [usuario_retirada=" + usuario_retirada + "]";
	}




	
}
