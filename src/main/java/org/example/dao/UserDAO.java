package org.example.dao;

import org.example.entity.User;

import java.util.List;

public interface UserDAO {
    User findUserByUserName(String username);
    void save(User user);
    List<User> getUsers();
    void deleteUser(int id);

}
