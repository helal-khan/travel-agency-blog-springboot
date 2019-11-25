package com.abctravelagency.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.abctravelagency.model.Location;

public interface LocationRepository extends JpaRepository<Location, Integer>{
}
