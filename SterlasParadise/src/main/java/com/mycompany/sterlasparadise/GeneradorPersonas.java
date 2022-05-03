
package com.mycompany.sterlasparadise;

import java.util.Random;

/*
 *
 * @author eduardo
 *
 */
public class GeneradorPersonas {
    
    //Creamos un objeto Random
    private static final Random random = new Random();
    
    //Array de strings con los nombres
    private static final String[] NOMBRES = {"Gonzalo", "Antonio", "Lola", "Aitana",
                                             "Claudia", "Olivia", "Carmen", "Bruno",
                                             "Marcos", "Alex", "David", "Diego",
                                             "Manuel", "Noa", "Carla", "Daniela",
                                             "Leo", "Sofia", "Hugo", "Andreu", "Mireya",
                                             "Isidoro", "Pedro", "Pablo", "Maria", "Nerea", 
                                             "Javier", "Lucia", "Carlos", "Luna"};
    
    //Array de strings con los apellidos
    private static final String[] APELLIDOS = {"Muñoz", "Moreno", "Diaz", "Ruiz",
                                               "Hernandez", "Martin", "Gomez", "Garcia",
                                               "Rodriguez", "Gonzalez", "Fernandez","Lopez",
                                               "Martinez", "Sanchez", "Perez", "Torres", "Ramos",
                                               "Gil", "Serrano", "Molina", "Blanco", "Castro",
                                               "Rubio", "Medina", "Castillo", "Santos", "Cruz",
                                               "Prieto", "Gallego", "Vega"};
    
    //Array de strings con las extensiones de email posibles 
    private static final String[] EXTENSIONES = {"@yahoo.es", "@hotmail.com", "@gmail.com",
                                                 "@outlook.es", "@msn.com"};
    
    //Método que genera un nombre aleatorio
    public static String generarNombre(){
        return NOMBRES[random.nextInt(NOMBRES.length)];
    }
    
    //Método que genera un apellido aleatorio
    public static String generarApellido(){
        return APELLIDOS[random.nextInt(APELLIDOS.length)];
    }
    
    //Método que genera los apellidos aleatoriamente
    public static String generarApellidos(String apellido1, String apellido2){
        return apellido1 + apellido2;
    }
    
    //Método que genera un nombre completo
    public static String generarNombreCompleto(){
        return generarNombre() + " " + generarApellido() + " " + generarApellido();
    }
    
    //Método que genera emails con los nombres y apellidos de cada persona
    public static String generarEmail(String nombre, String apellido1, String apellido2){
        String email = (nombre.substring(0, 3).toLowerCase()) + (apellido1.substring(0, 3).toLowerCase()) + (apellido2.substring(0, 3).toLowerCase()) + EXTENSIONES[random.nextInt(EXTENSIONES.length)];
        return email;
    }
    
    //Método que genera una edad aleatoria
    public static int generarEdad(){
        return random.nextInt(80-18+1)+18;
    }
    
    //Método que genera un número de teléfono aleatorio
    public static String generarTelefono(){
        String tlf = "";
        //Número aleatorio entre 0 y 9
        int aleatorio = random.nextInt(10);
        
        for (int i = 0; i < 9; i++) {
            tlf += aleatorio;
        }
        
        return tlf;
    }
    
    //Método para generar una persona con datos aleatorios
    public static Persona generarPersona(){
        String nombre = generarNombre();
        String apellido1 = generarApellido();
        String apellido2 = generarApellido();
        String apellidos = generarApellidos(apellido1, apellido2);
        String correo = generarEmail(nombre, apellido1, apellido2);
        String telefono = generarTelefono();
        int edad = generarEdad();
        
        Persona p = new Persona(nombre, apellidos, telefono, correo, edad);
        
        return p;
    }
    
}
