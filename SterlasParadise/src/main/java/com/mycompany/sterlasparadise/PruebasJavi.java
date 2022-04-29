
package com.mycompany.sterlasparadise;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author javiakasino
 */
public class PruebasJavi {

    public static void main(String[] args) {

        CSV.generarCSVReservas();

        CSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.of(10, 30), 5, "Miau"));
        
        CSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.of(10, 30), 5, "Miau"));
        
        CSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.of(10, 30), 5, "Miau"));
        
        CSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.of(10, 30), 5, "Miau"));
        
        
        System.out.println(CSV.listaReservas());
    }
    
}
