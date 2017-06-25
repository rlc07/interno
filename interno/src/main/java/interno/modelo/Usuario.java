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
 *17 de mar de 2017
 */

@Entity
@Table(name="usuario")
public class Usuario {
	
	@Id
	@SequenceGenerator(name="SEQ_USUARIO", sequenceName="SEQ_USUARIO_ID", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_USUARIO")
	private int id;
	private String nome;
	private int matricula;
	private String email;
	private boolean status;
	private boolean permissao;
	private String fone_fixo;
	private String fone_cel;
	private String senha;
	
	public Usuario(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getMatricula() {
		return matricula;
	}

	public void setMatricula(int matricula) {
		this.matricula = matricula;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean isPermissao() {
		return permissao;
	}

	public void setPermissao(boolean permissao) {
		this.permissao = permissao;
	}

	public String getFone_fixo() {
		return fone_fixo;
	}

	public void setFone_fixo(String fone_fixo) {
		this.fone_fixo = fone_fixo;
	}

	public String getFone_cel() {
		return fone_cel;
	}

	public void setFone_cel(String fone_cel) {
		this.fone_cel = fone_cel;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
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
		Usuario other = (Usuario) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Usuario [nome=" + nome + "]";
	}
	
	

}
