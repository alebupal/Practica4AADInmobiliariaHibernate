package com.alejandro.hibernate;
// Generated 01-feb-2015 11:52:23 by Hibernate Tools 4.3.1



/**
 * Imagen generated by hbm2java
 */
public class Imagen  implements java.io.Serializable {


     private Integer id;
     private String ruta;
     private int idInmueble;

    public Imagen() {
    }

    public Imagen(String ruta, int idInmueble) {
       this.ruta = ruta;
       this.idInmueble = idInmueble;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getRuta() {
        return this.ruta;
    }
    
    public void setRuta(String ruta) {
        this.ruta = ruta;
    }
    public int getIdInmueble() {
        return this.idInmueble;
    }
    
    public void setIdInmueble(int idInmueble) {
        this.idInmueble = idInmueble;
    }




}

