package com.abctravelagency.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.abctravelagency.repository.StatusRepository;
import com.abctravelagency.repository.UserRepository;

@Controller
public class HomeController {
	
	@Autowired
	private StatusRepository statusRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping({"/","/home"})
	public String Home(Model model, Principal principal) {
		model.addAttribute("pageTitle", "Home");
		model.addAttribute("listOfStatus", statusRepository.findAllByAccessOrderByIdDesc(1));
		if(principal!=null)
			model.addAttribute("user", userRepository.findByUsername(principal.getName()));
		return "home";
	}
}