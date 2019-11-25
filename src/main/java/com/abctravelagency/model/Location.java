package com.abctravelagency.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Location extends Audit {
	
	@Id
	private int id;
	private String Name;
	private boolean active;
	@OneToMany(mappedBy = "location")
	@JsonIgnore
	private Set<Status> status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public Set<Status> getStatus() {
		return status;
	}
	public void setStatus(Set<Status> status) {
		this.status = status;
	}
}
