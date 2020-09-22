package com.abctravelagency.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = "email"))
public class User extends Audit {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty
	private String firstName;
	@NotEmpty
	private String lastName;

	@NotEmpty
	@Size(min=6, max=30)
	@Pattern(regexp="^[a-zA-Z0-9_.]+$")
	private String username;
	
	@NotEmpty
//	@Size(min=6, max=30)
	@Pattern(regexp="^\\S+$")
	private String password;
	
	@NotEmpty
	@Email
	private String email;
	
	@NotEmpty()
	@Pattern(regexp="^(01)(1|7|8|9|6|3|4)[0-9]{8}$")
	private String phone;
	
	private boolean active;
	
	@ManyToOne
	private Role role;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private Set<Status> status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Set<Status> getStatus() {
		return status;
	}

	public void setStatus(Set<Status> status) {
		this.status = status;
	}
}