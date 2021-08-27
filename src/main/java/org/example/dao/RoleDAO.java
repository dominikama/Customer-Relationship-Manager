package org.example.dao;

import org.example.entity.Role;

public interface RoleDAO {
    Role findRoleByName(String name);
}
