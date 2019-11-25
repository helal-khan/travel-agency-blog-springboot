package com.abctravelagency.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.abctravelagency.model.Status;
import com.abctravelagency.repository.StatusRepository;

@RestController
@RequestMapping("/api/v1/status")
public class StatusController {

	@Autowired
	private StatusRepository statusRepository;
	
	@GetMapping
	public List<Status> getAllStatus(){
		return statusRepository.findAll();
	}
}