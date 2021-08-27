package org.example.dao;

import org.example.entity.Customer;
import org.example.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.hibernate.query.Query;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDAO {

    @Autowired
    SessionFactory factory;

    @Override
    public User findUserByUserName(String username) {

        Session session = factory.getCurrentSession();

        Query<User> query = session.createQuery("from User where username =:userN", User.class);

        query.setParameter("userN", username);

        User user;

        try {
            user = query.getSingleResult();
        } catch (Exception e) {
            user = null;
        }

        return user;
    }

    @Override
    public void save(User user) {
        Session session = factory.getCurrentSession();

        session.saveOrUpdate(user);

    }

    @Override
    public List<User> getUsers() {
        Session session = factory.getCurrentSession();
        Query<User> query =
                session.createQuery("from User order by lastName", User.class);
        return query.getResultList();
    }

    @Override
    public void deleteUser(int id) {
        Session session = factory.getCurrentSession();
        Query query = session.createQuery("delete from User where id=" + id);

        query.executeUpdate();
    }
}
