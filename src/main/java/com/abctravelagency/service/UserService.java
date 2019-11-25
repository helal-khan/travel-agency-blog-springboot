package com.abctravelagency.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.abctravelagency.model.Role;
import com.abctravelagency.model.User;
import com.abctravelagency.repository.RoleRepository;
import com.abctravelagency.repository.UserRepository;


@Service("userService")
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
    private RoleRepository roleRepository;
	
    public User findUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public User saveUser(User user) {
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
        user.setActive(true);
        Role role = roleRepository.findByRole("ROLE_USER");
        user.setRole(role);
        return userRepository.save(user);
    }
}
