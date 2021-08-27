package org.example.dao;

import org.example.entity.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class RoleDAOImpl implements RoleDAO {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public Role findRoleByName(String name) {
        Session session = sessionFactory.getCurrentSession();

        Query<Role> query = session.createQuery("from Role where name =:roleName", Role.class);
        query.setParameter("roleName", name);

        Role role;

        try {
            role = query.getSingleResult();
        } catch (Exception e) {
            role = null;
        }

        return role;
    }
}
