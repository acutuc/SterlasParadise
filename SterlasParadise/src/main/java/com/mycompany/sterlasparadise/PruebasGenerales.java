/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
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
        Persona p1 = new Persona("Mein", "Herz", "987654321", "meinherzbrent@outlook.de", LocalDate.of(1980, 02, 15));
        
        System.out.println(p1);
    }
    
}
