package com.mycompany.sterlasparadise;

import java.util.ArrayList;

public class Restaurante {
    
    //Atributos de la clase:
    private String nombre;
    private String direccion;
    private ArrayList<Zona> zonas; 

    //Metodo Constructor sin parametros
    public Restaurante() {
    }

    //Metodo Constructor con parametros
    public Restaurante(String nombre, String direccion, ArrayList<Zona> zonas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.zonas = zonas;
    }

    //Getters y Setters de los a tributos de la clase:
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public ArrayList<Zona> getZonas() {
        return zonas;
    }

    public void setZonas(ArrayList<Zona> zonas) {
        this.zonas = zonas;
    }
    //Fin de los Getters y Setters y de la clase

    //Metodo ToString 
    @Override
    public String toString() {
        return "Restaurante{" + "nombre=" + nombre + ", direccion=" + direccion + ", zonas=" + zonas + '}';
    }
    
}

