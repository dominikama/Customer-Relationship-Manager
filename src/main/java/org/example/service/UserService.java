package org.example.service;

import org.example.entity.Role;
import org.example.entity.User;
import org.example.user.CrmUser;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {

    User findUserByUserName(String username);
    void save(CrmUser user);
    List<User> getUsers();
    void deleteUser(int id);
}
