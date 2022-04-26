package com.mycompany.sterlasparadise;

import java.util.Objects;

/**
 *
 * @author acutuc
 */
//Definición de la clase. Implementa la interfaz Comparable.
public class Persona implements Comparable<Persona>{
    //Atributos
    private String nombre;
    private String apellidos;
    private String telefono;
    private String correo;
    
    //Constructor con sus atributos por defecto.
    public Persona() {
    }
    
    //Constructor parametrizado.
    public Persona(String nombre, String apellidos, String telefono, String correo) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.correo = correo;
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

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    //hashCode()

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 17 * hash + Objects.hashCode(this.nombre);
        hash = 17 * hash + Objects.hashCode(this.apellidos);
        hash = 17 * hash + Objects.hashCode(this.telefono);
        hash = 17 * hash + Objects.hashCode(this.correo);
        return hash;
    }

    //equals()
    /*Una persona será igual a otra si coinciden en el correo electrónico.
    (Entendemos que para el ejercicio no habrán personas con el mismo nombre y apellidos,
    registradas con correos diferentes).*/
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
        if (!Objects.equals(this.apellidos, other.apellidos)) {
            return false;
        }
        if (!Objects.equals(this.telefono, other.telefono)) {
            return false;
        }
        return Objects.equals(this.correo, other.correo); //ATENCIÓN AQUÍ
    }
    
    //toString()
    @Override
    public String toString() {
        return "Persona{" + "Nombre: " + nombre + "\tApellidos: " + apellidos + "\tTeléfono: " + telefono +
                "\tCorreo: " + correo + '}';
    }

    //Método compareTo.
    //Compara el correo de una persona con otra.
    @Override
    public int compareTo(Persona t) {
        return this.getCorreo().compareTo(t.getCorreo());
    }
    

}
