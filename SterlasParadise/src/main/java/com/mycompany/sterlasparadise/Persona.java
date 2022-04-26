package com.mycompany.sterlasparadise;

import java.util.Objects;

/**
 *
 * @author acutuc
 */
//Definición de la clase.
public class Persona implements Comparable<Persona>{
    //Atributos
    private String nombre;
    private String apellidos;
    
    //Constructor con sus atributos por defecto.
    public Persona() {
    }
    
    //Constructor parametrizado.
    public Persona(String nombre, String apellidos) {
        this.nombre = nombre;
        this.apellidos = apellidos;
    }
    
    //Getters y setters.
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    //hashCode()
    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + Objects.hashCode(this.nombre);
        hash = 59 * hash + Objects.hashCode(this.apellidos);
        return hash;
    }

    //equals()
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Persona other = (Persona) obj;
        if (!Objects.equals(this.nombre, other.nombre)) {
            return false;
        }
        return Objects.equals(this.apellidos, other.apellidos);
    }
    
    //toString()
    @Override
    public String toString() {
        return "Persona{" + "Nombre: " + nombre + "\tApellidos: " + apellidos + '}';
    }

    //Método compareTo.
    @Override
    public int compareTo(Persona t) {
        return this.getApellidos().compareTo(t.getApellidos());
    }
    

}
