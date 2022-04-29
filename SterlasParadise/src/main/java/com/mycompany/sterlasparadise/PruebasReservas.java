package com.mycompany.sterlasparadise;

import java.util.ArrayList;
import java.util.Random;

public class PruebasReservas {

    public static void main(String[] args) {
        
        //Generador de un número aleatorio para la generación de solicitudes de reservas.
        Random rd = new Random();
        int reserv = rd.nextInt(25)+1;
        
        //Lista para guardas las reservas.
        ArrayList<ReservasAleatorias> reservas = new ArrayList<>();
        
        //Bucle for para generar el número de reservas que queramos, en este caso 20
        for (int i = 0; i < reserv; i++) {
            reservas.add(new ReservasAleatorias());
        }
        //Bucle for para imprimir todas las reservas.
        for (int i = 0; i < reservas.size(); i++) {
            System.out.println(reservas.get(i));
            
        }

        
        
        
        
        
    }
    
}
