package org.example.service;

import org.example.dao.RoleDAO;
import org.example.dao.UserDAO;
import org.example.entity.Role;
import org.example.entity.User;
import org.example.user.CrmUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDAO userDAO;

    @Autowired
    RoleDAO roleDAO;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;


    @Override
    @Transactional
    public User findUserByUserName(String username) {
        return userDAO.findUserByUserName(username);
    }

    @Override
    @Transactional
    public void save(CrmUser crmUser) {

        User user = new User();
        user.setUsername(crmUser.getUsername());
        user.setPassword(bCryptPasswordEncoder.encode(crmUser.getPassword()));
        user.setEmail(crmUser.getEmail());
        user.setFirstName(crmUser.getFirstName());
        user.setLastName(crmUser.getLastName());

        user.setRoles(Arrays.asList(roleDAO.findRoleByName("ROLE_EMPLOYEE")));

        userDAO.save(user);
    }

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userDAO.findUserByUserName(s);

        if (user == null) {
            throw new UsernameNotFoundException("Invalid username or password.");
        }

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
                mapRolesToAuthorities(user.getRoles()));
    }

    @Override
    @Transactional
    public List<User> getUsers() {
        return userDAO.getUsers();
    }

    @Override
    @Transactional
    public void deleteUser(int id) {
        userDAO.deleteUser(id);
    }

    private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
        return roles.stream()
                .map(r -> new SimpleGrantedAuthority(r.getName()))
                .collect(Collectors.toList());
    }
}
