package com.mycompany.sterlasparadise;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;

/**
 *
 * @author samjimmaz
 */
public class PruebasGenerales {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona p1 = new Persona();
        
        System.out.println(p1);
        
        System.out.println(GeneradorPersonas.generarPersona());
    }
    
}
