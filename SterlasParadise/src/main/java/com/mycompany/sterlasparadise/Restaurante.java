package com.mycompany.sterlasparadise;

import java.util.ArrayList;

public class Restaurante {
    
    private String nombre;
    private String direccion;
    private ArrayList<Zona> zonas; 

    public Restaurante() {
    }

    public Restaurante(String nombre, String direccion, ArrayList<Zona> zonas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.zonas = zonas;
    }

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

    @Override
    public String toString() {
        return "Restaurante{" + "nombre=" + nombre + ", direccion=" + direccion + ", zonas=" + zonas + '}';
    }
    
}

