/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alejandro.modelo;

import com.alejandro.hibernate.HibernateUtil;
import com.alejandro.hibernate.Imagen;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Alejandro
 */
public class ModeloImagen {
    public static List<Imagen> get(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Inmueble";
        Query q = session.createQuery(hql);
        List<Imagen> inmuebles = q.list();
        session.getTransaction().commit();
        session.close();
        return inmuebles;
    }
    public static List<Imagen> getidInmueble(String idInmueble){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Imagen where idInmueble = :idInmueble";

        Query q = session.createQuery(hql);
        q.setInteger("idInmueble",Integer.parseInt(idInmueble));
        List<Imagen> inmuebles = q.list();
        session.getTransaction().commit();
        session.close();
        return inmuebles;
    }
    public static void delete(String id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        Imagen p = (Imagen) session.load(Imagen.class,Integer.parseInt(id));
        session.delete(p);
        
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    public static void insert(Imagen p){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        
        session.save(p);
        
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    public static Imagen get2(String id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Imagen p = (Imagen) session.get(Imagen.class,Integer.parseInt(id));
        session.getTransaction().commit();
        session.close();
        return p;
    }
     public static void edit(Imagen p){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
       
        session.update(p);
        
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    
}

