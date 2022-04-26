
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
    
    //Clase que genera emails con los nombres y apellidos de cada persona
    public String GenerarEmail(String nombre, String apellido1, String apellido2){
        String email = (nombre + apellido1 + apellido2 + EXTENSIONES[random.nextInt(EXTENSIONES.length)]);
        return email;
    }
    
    
    
    
}
