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
    private int numMesas;
    private Random rd = new Random();
    private final int anyo = 2022;
    private int mes = rd.nextInt(12)+1;
    private int dia = rd.nextInt(30) + 1;
    private int[] horas = {13,14,15,20,21,22};
    private int minutos = rd.nextInt(60);

    //Constructor por defecto que da fecha, hora y número de mesas de manera aleatoria.
    public ReservasAleatorias() {
        if (minutos >= 0 && minutos<30){
            this.minutos = 0;
        }else{
            this.minutos = 30;
        }
        int i = rd.nextInt(6);
        this.fecha = LocalDate.of(anyo, mes, dia);
        this.hora = LocalTime.of(horas[i], minutos);
        this.numMesas = rd.nextInt(10) + 1;
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
