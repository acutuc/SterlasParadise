
package com.mycompany.sterlasparadise;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author javiakasino
 */
public class PruebasJavi {

    public static void main(String[] args) {

        

        CSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.now(), 5, "Miau"));
        
        CSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.now(), 5, "Miau"));
        
        CSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.now(), 5, "Miau"));
        
        CSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.now(), 5, "Miau"));
        
        
        System.out.println(CSV.listaReservas());
    }
    
}
