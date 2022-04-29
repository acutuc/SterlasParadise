
package com.mycompany.sterlasparadise;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author javiakasino
 */
public class PruebasJavi {

    public static void main(String[] args) {

        //CSV.generarCSVReservas();

        CSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.of(10, 30), 5, "Miau11"));
        
        CSV.aniadirReservas(new Reserva(2, 2, LocalDate.now(), LocalTime.of(10, 30), 5, "Miau22"));
        
        CSV.aniadirReservas(new Reserva(2, 1, LocalDate.now(), LocalTime.of(10, 30), 5, "Miau21"));
        
        CSV.aniadirReservas(new Reserva(1, 2, LocalDate.now(), LocalTime.of(10, 30), 5, "Miau12"));
        
        
        System.out.println(CSV.listaReservas());
        
        System.out.println(CSV.listaReservasPorRestaurante(1));
        
        System.out.println(CSV.listaReservasPorZona(2, 1));
    }
    
}
