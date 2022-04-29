
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
                                             "Isidoro", "Pedro", "Pablo", "María", "Nerea", 
                                             "Javier", "Lucía", "Carlos", "Luna"};
    
    //Array de strings con los apellidos
    private static final String[] APELLIDOS = {"Muñoz", "Moreno", "Díaz", "Ruíz",
                                               "Hernandez", "Martín", "Gómez", "García",
                                               "Rodríguez", "González", "Fernández","López",
                                               "Martínez", "Sánchez", "Pérez", "Torres", "Ramos",
                                               "Gil", "Serrano", "Molina", "Blanco", "Castro",
                                               "Rubio", "Medina", "Castillo", "Santos", "Cruz",
                                               "Prieto", "Gallego", "Vega"};
    
    //Array de strings con las extensiones de email posibles 
    private static final String[] EXTENSIONES = {"@yahoo.es", "@hotmail.com", "@gmail.com",
                                                 "@outlook.es", "@msn.com"};
    
    //Método que genera un nombre aleatorio
    public String generarNombre(){
        return NOMBRES[random.nextInt(NOMBRES.length)];
    }
    
    //Método que genera un apellido aleatorio
    public String generarApellido(){
        return APELLIDOS[random.nextInt(APELLIDOS.length)];
    }
    
    //Método que genera un nombre completo
    public String generarNombreCompleto(){
        return generarNombre() + " " + generarApellido() + " " + generarApellido();
    }
    
    //Método que genera emails con los nombres y apellidos de cada persona
    public String generarEmail(String nombre, String apellido1, String apellido2){
        String email = (nombre.substring(0, 3).toLowerCase()) + (apellido1.substring(0, 3).toLowerCase()) + (apellido2.substring(0, 3).toLowerCase()) + EXTENSIONES[random.nextInt(EXTENSIONES.length)];
        return email;
    }
    
    //Método que genera una edad aleatoria
    public int generarEdad(){
        return random.nextInt(80-18+1)+18;
    }
    
    //Método que genera un número de teléfono aleatorio
    public String generarTelefonos(){
        String tlf = "";
        //Número aleatorio entre 0 y 9
        int aleatorio = random.nextInt(10);
        
        for (int i = 0; i < 9; i++) {
            tlf += aleatorio;
        }
        
        return tlf;
    }
    
}
