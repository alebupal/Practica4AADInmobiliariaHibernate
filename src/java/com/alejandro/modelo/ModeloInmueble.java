/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alejandro.modelo;

import com.alejandro.hibernate.HibernateUtil;
import com.alejandro.hibernate.Inmueble;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Alejandro
 */
public class ModeloInmueble {
    public static List<Inmueble> get(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Inmueble";
        Query q = session.createQuery(hql);
        List<Inmueble> inmuebles = q.list();
        session.getTransaction().commit();
        session.close();
        return inmuebles;
    }
    public static void delete(String id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        Inmueble p = (Inmueble) session.load(Inmueble.class,Integer.parseInt(id));
        session.delete(p);
        
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    public static void insert(Inmueble p){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        session.save(p);
        
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    public static Inmueble get2(String id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Inmueble p = (Inmueble) session.get(Inmueble.class,Integer.parseInt(id));
        session.getTransaction().commit();
        session.close();
        return p;
    }
     public static void edit(Inmueble p){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
       
        session.update(p);
        
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    
}

