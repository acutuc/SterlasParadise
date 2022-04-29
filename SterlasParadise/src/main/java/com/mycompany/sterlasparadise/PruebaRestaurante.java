/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package com.mycompany.sterlasparadise;

/**
 *
 * @author fcoj
 */
import java.util.*;

public class PruebaRestaurante {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Restaurante hawaii = new Restaurante("Hawaii", "Hawaii", new ArrayList<>());
        Restaurante cerdena = new Restaurante("Cerdeña", "Cerdeña", new ArrayList<>());
        Restaurante marbella = new Restaurante("Marbella", "Marbella", new ArrayList<>());
        Restaurante london = new Restaurante(/*"London", "Londres", new ArrayList<>()*/);
        
        london.setDireccion("Londres");
        london.setNombre("London");
        london.setZonas(new ArrayList<>());
        
        london.getZonas().add(new Zona(1, false));
        hawaii.getZonas().add(new Zona(0, 10, true));
        hawaii.getZonas().add(new Zona(1, 10, false));
        cerdena.getZonas().add(new Zona(0, 5, true));
        cerdena.getZonas().add(new Zona(1, 10, false));
        marbella.getZonas().add(new Zona(1, 10, false));
        marbella.getZonas().add(new Zona(2, 5, false));
        london.getZonas().add(new Zona());
        
        System.out.println("Restaurante 1 : " + hawaii);
        System.out.println("Restaurante 2 : " + cerdena);
        System.out.println("Restaurante 3 : " + marbella);
        System.out.println("Restaurante 4 : " + london);
        
    }
    
}
