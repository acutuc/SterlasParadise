
package com.mycompany.sterlasparadise;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author javiakasino
 */
public class PruebasJavi {

    public static void main(String[] args) {

        

        GenerarCSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.now(), 5, "Miau"));
        
        GenerarCSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.now(), 5, "Miau"));
        
        GenerarCSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.now(), 5, "Miau"));
        
        GenerarCSV.aniadirReservas(new Reserva(1, 1, LocalDate.now(), LocalTime.now(), 5, "Miau"));
    }
    
}
