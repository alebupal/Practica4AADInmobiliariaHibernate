package com.alejandro.hibernate;
// Generated 01-feb-2015 11:52:23 by Hibernate Tools 4.3.1



/**
 * Inmueble generated by hbm2java
 */
public class Inmueble  implements java.io.Serializable {


     private Integer id;
     private String calle;
     private String localidad;
     private String tipo;
     private int precio;
     private String usuario;

    public Inmueble() {
    }

    public Inmueble(String calle, String localidad, String tipo, int precio, String usuario) {
       this.calle = calle;
       this.localidad = localidad;
       this.tipo = tipo;
       this.precio = precio;
       this.usuario = usuario;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getCalle() {
        return this.calle;
    }
    
    public void setCalle(String calle) {
        this.calle = calle;
    }
    public String getLocalidad() {
        return this.localidad;
    }
    
    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }
    public String getTipo() {
        return this.tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public int getPrecio() {
        return this.precio;
    }
    
    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
}


