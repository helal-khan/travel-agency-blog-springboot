package com.abctravelagency.controller;

import java.security.Principal;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.abctravelagency.model.Status;
import com.abctravelagency.model.StatusJsonRespone;
import com.abctravelagency.model.User;
import com.abctravelagency.repository.LocationRepository;
import com.abctravelagency.repository.StatusRepository;
import com.abctravelagency.repository.UserRepository;

@Controller
public class ProfileController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private LocationRepository locationRepository;

	@Autowired
	private StatusRepository statusRepository;

	@RequestMapping(value = { "/profile" })
	public ModelAndView getProfile(Principal principal) {
		ModelAndView profile = new ModelAndView("profile");
		User user = userRepository.findByUsername(principal.getName());
		profile.addObject("pageTitle", "Profile");
		profile.addObject("user", user);
		profile.addObject("locations", locationRepository.findAll());
		profile.addObject("listOfStatus", statusRepository.findAllByUserOrderByIdDesc(user));
		return profile;
	}

	@PostMapping(value = "/profile")
	@ResponseBody
	public StatusJsonRespone createStatus(Principal principal, @Valid Status status, BindingResult result) {
		status.setUser(userRepository.findByUsername(principal.getName()));
		StatusJsonRespone respone = new StatusJsonRespone();
		try {
			if (result.hasErrors()) {
				Map<String, String> errors = result.getFieldErrors().stream()
						.collect(Collectors.toMap(FieldError::getField, FieldError::getDefaultMessage));
				respone.setValidated(false);
				respone.setErrorMessages(errors);
			} else {
				status.setActive(true);
				respone.setValidated(true);
				Status myStatus = statusRepository.save(status);
				respone.setStatus(myStatus);
			}
			return respone;

		} catch (Exception e) {
			respone.setValidated(false);
			return respone;
		}
	}

	@PostMapping(value = "/update-privacy")
	@ResponseBody
	public StatusJsonRespone updatePrivacy(@Valid Status s, BindingResult result) {
		StatusJsonRespone respone = new StatusJsonRespone();
		try {
			respone.setValidated(true);
			
			Status status = statusRepository.findById(s.getId()).get();
			status.setAccess(s.getAccess());
			statusRepository.save(status);
			respone.setStatus(status);
			return respone;

		} catch (Exception e) {
			respone.setValidated(false);
			return respone;
		}
	}
	
	@PostMapping(value = "/delete-status")
	@ResponseBody
	public StatusJsonRespone deleteStatus(@Valid Status s, BindingResult result) {
		StatusJsonRespone respone = new StatusJsonRespone();
		try {
			respone.setValidated(true);
			Status status = statusRepository.findById(s.getId()).get();
			status.setAccess(s.getAccess());
			statusRepository.delete(status);
			return respone;
		} catch (Exception e) {
			respone.setValidated(false);
			return respone;
		}
	}
}