package com.mycompany.sterlasparadise;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Objects;
import java.util.Random;

/*
 * @author samjimmaz
 */
public class ReservasAleatorias {

    //Atributos necesarios para la generación de las reservas de manera aleatoria
    private LocalDate fecha;
    private LocalTime hora;
    private Random rd = new Random();
    private int numMesas;


    public int generarMesas() {
        int mesas = rd.nextInt(10)+1;
        return mesas;
    }

    public LocalDate generarFecha() {
        int anyo = 2022;
        int mes = rd.nextInt(12) + 1;
        int dia = rd.nextInt(30) + 1;

        LocalDate fech = LocalDate.of(anyo, mes, dia);
        return fech;
    }
    
    public LocalTime generarHora(){
            int i = rd.nextInt(6);
            int j = rd.nextInt(2);
            int[] horas = {13, 14, 15, 20, 21, 22};
            int minutos[] = {0,30};
            
            LocalTime hora = LocalTime.of(horas[i], minutos[j]);
            
            return hora;
        
    }

    //Constructor por defecto que da fecha, hora y número de mesas de manera aleatoria.

    public ReservasAleatorias() {
        this.fecha = generarFecha();
        this.hora = generarHora();
        this.numMesas = generarMesas();
    }
    

    //Constructor parametrizado en el que introducimos nosotros fecha, hora y número de mesas.
    public ReservasAleatorias(LocalDate fecha, LocalTime hora, int numMesas) {
        this.fecha = fecha;
        this.hora = hora;
        this.numMesas = numMesas;
    }

    //getters y setter
    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public int getNumMesas() {
        return numMesas;
    }

    public void setNumMesas(int numMesas) {
        this.numMesas = numMesas;
    }

    //hash code para futuros métodos si fuese necesario
    @Override
    public int hashCode() {
        int hash = 5;
        hash = 47 * hash + Objects.hashCode(this.fecha);
        hash = 47 * hash + Objects.hashCode(this.hora);
        hash = 47 * hash + this.numMesas;
        return hash;
    }

    //Equals para poder comparar reservas.
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ReservasAleatorias other = (ReservasAleatorias) obj;
        if (this.numMesas != other.numMesas) {
            return false;
        }
        if (!Objects.equals(this.fecha, other.fecha)) {
            return false;
        }
        return Objects.equals(this.hora, other.hora);
    }

    //toString para visualización de datos de manera cómoda
    @Override
    public String toString() {
        return numMesas + " mesas para el día " + fecha + " a las " + hora;
    }

}
