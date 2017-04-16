/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.faberlic.billing.getter;

import com.faberlic.billing.hibernate.HibernateUtil;
import com.faberlic.billing.objects.Operators;
import com.faberlic.billing.objects.Users;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author LLAlive
 */
public class InfoGetter {
    
    Session session = null;
    SessionFactory sessionFactory = null;

    public InfoGetter() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
        this.sessionFactory = HibernateUtil.getSessionFactory();
    }

    public List<Operators> getOperators(){
        List<Operators> operators;
        session.beginTransaction();
        Query q = session.createQuery("from Operators");
        operators = (List<Operators>) q.list();
        return operators;
    }
    
    public Users getUser(String username){
        Users user;
        Query q = sessionFactory.openSession().createQuery(
                "from Users where username = :username");
        q.setParameter("username", username);
        List list = q.list();
        if(list.size() > 0){
            user = (Users) list.get(0);
        } else {
            user = null;
        }
        return user;
    }
}
