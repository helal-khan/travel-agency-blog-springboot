package com.abctravelagency.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.abctravelagency.service.UserService;
import com.abctravelagency.model.User;

@Controller
public class AuthController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String showLoginPage(Principal principal) {
		return principal != null ? "home" : "login";
	}
	
	@RequestMapping(value="/registration", method = RequestMethod.GET)
	public String showRegistrationPage(Model model, Principal principal) {
		model.addAttribute("user", new User());
		return principal != null ? "home" : "registration";
	}
	
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView createNewUser(@Valid User user, BindingResult bindingResult) {
		ModelAndView modelAndView = new ModelAndView();
		
        if (userService.findUserByUsername(user.getUsername()) != null)
            bindingResult.rejectValue("username", "DuplicateKey.user.username");
        if (userService.findUserByEmail(user.getEmail()) != null)
            bindingResult.rejectValue("email", "DuplicateKey.user.email");
		if(bindingResult.hasErrors()) {
			modelAndView.setViewName("registration");
		} else {
			userService.saveUser(user);
            modelAndView.addObject("successMessage", "User has been registered successfully");
            modelAndView.addObject("user", new User());
            modelAndView.addObject("reg", true);
            modelAndView.setViewName("registration");
		}
        return modelAndView;
    }
	
	@RequestMapping("/access-denied")
	public String showAccessDenied(){
		return "accessDenied";
	}
}