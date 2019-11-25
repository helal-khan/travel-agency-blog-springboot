package com.abctravelagency.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.abctravelagency.model.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {
	Role findByRole(String role);
}
