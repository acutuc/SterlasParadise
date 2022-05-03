package com.mycompany.sterlasparadise;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author javiakasino
 */
public class CSV {

    //Crea el archivo CSV de las reservas sin datos (sólo cabecera)
    public static void generarCSVReservas() {

        //Se crea el fichero en la raíz del proyecto
        String idFichero = "reservas.csv";

        //Se crea el fichero con la cabecera
        try (BufferedWriter flujo = new BufferedWriter(new FileWriter(idFichero))) {

            flujo.write("RESTAURANTE;ZONA;FECHA;HORA;NºPERSONAS;CLIENTE"); //Cabecera

            flujo.newLine(); //Salta a la siguiente línea

            flujo.flush(); // Guarda cambios en disco 

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

    }

    //Añade una reserva al CSV
    public static void aniadirReservas(Reserva reserva) {

        //Ruta relativa al archivo ya creado
        String idFichero = "reservas.csv";

        try (BufferedWriter flujo = new BufferedWriter(new FileWriter(idFichero, true))) {

            flujo.write(reserva.toString()); //Se escribe la nueva reserva

            flujo.newLine(); //Siguiente línea

            flujo.flush(); // Metodo flush() guarda cambios en disco 

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

    }

    //Devuelve la lista de Reservas desde el archivo CSV
    public static ArrayList<Reserva> listaReservas() {

        ArrayList<Reserva> lista = new ArrayList<>();
        String idFichero = "reservas.csv";

        // Variables para guardar los datos que se van leyendo
        String[] tokens;
        String linea;

        try (Scanner datosFichero = new Scanner(new FileReader(idFichero))) {

            //Salta la primera línea (cabecera)
            datosFichero.nextLine();
            // Mientras haya líneas por leer
            while (datosFichero.hasNextLine()) {

                linea = datosFichero.nextLine(); //Se lee la línea

                tokens = linea.split(";"); //Teniendo en cuenta el separador 

                lista.add(new Reserva(Integer.valueOf(tokens[0]), Integer.valueOf(tokens[1]),
                        stringFecha(tokens[2]), stringHora(tokens[3]), Integer.valueOf(tokens[4]),
                        tokens[5]));

            }

        } catch (FileNotFoundException ex) {
            System.out.println(ex.getMessage());
        }

        return lista;
    }

    //Devuelve una lista de Reservas dado un restaurante
    public static ArrayList<Reserva> listaReservasPorRestaurante(int numeroRestaurante) {

        ArrayList<Reserva> lista = new ArrayList<>();
        String idFichero = "reservas.csv";

        // Variables para guardar los datos que se van leyendo
        String[] tokens;
        String linea;

        try (Scanner datosFichero = new Scanner(new FileReader(idFichero))) {

            //Salta la primera línea (cabecera)
            datosFichero.nextLine();
            // Mientras haya líneas por leer
            while (datosFichero.hasNextLine()) {

                linea = datosFichero.nextLine(); //Se lee la línea

                tokens = linea.split(";"); //Teniendo en cuenta el separador 
                //Si es del restaurante indicado, se añade a la lista
                if (Integer.valueOf(tokens[0]) == numeroRestaurante) {

                    lista.add(new Reserva(Integer.valueOf(tokens[0]), Integer.valueOf(tokens[1]),
                            stringFecha(tokens[2]), stringHora(tokens[3]), Integer.valueOf(tokens[4]),
                            tokens[5]));
                }
            }

        } catch (FileNotFoundException ex) {
            System.out.println(ex.getMessage());
        }

        return lista;
    }

    //Devuelve una lista de Reservas dada una zona de un restaurante
    public static ArrayList<Reserva> listaReservasPorZona(int numeroRestaurante, int numeroZona) {

        ArrayList<Reserva> lista = new ArrayList<>();
        String idFichero = "reservas.csv";

        // Variables para guardar los datos que se van leyendo
        String[] tokens;
        String linea;

        try (Scanner datosFichero = new Scanner(new FileReader(idFichero))) {

            //Salta la primera línea (cabecera)
            datosFichero.nextLine();
            // Mientras haya líneas por leer
            while (datosFichero.hasNextLine()) {

                linea = datosFichero.nextLine(); //Se lee la línea

                tokens = linea.split(";"); //Teniendo en cuenta el separador 
                //Si es del restaurante y zona indicados, se añade a la lista
                if (Integer.valueOf(tokens[0]) == numeroRestaurante
                        && Integer.valueOf(tokens[1]) == numeroZona) {

                    lista.add(new Reserva(Integer.valueOf(tokens[0]), Integer.valueOf(tokens[1]),
                            stringFecha(tokens[2]), stringHora(tokens[3]), Integer.valueOf(tokens[4]),
                            tokens[5]));
                }
            }

        } catch (FileNotFoundException ex) {
            System.out.println(ex.getMessage());
        }

        return lista;
    }

    //Parsea fecha String en LocalDate con formato 
    public static LocalDate stringFecha(String fecha) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        if (fecha.isEmpty()) {
            return null;
        }

        return LocalDate.parse(fecha, formatter);
    }

    //Parsea fecha String en LocalDate con formato hh/mm/ss
    public static LocalTime stringHora(String hora) {

        DateTimeFormatter formatter = DateTimeFormatter.ISO_TIME;

        if (hora.isEmpty()) {
            return null;
        }

        return LocalTime.parse(hora, formatter);
    }

}
