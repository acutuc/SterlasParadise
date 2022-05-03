/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sterlasparadise;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author miguel
 * 
 * PRUEBA CAMBIOS
 */
public class Reserva {
    int restaurante;
    int zona;
    String nombreCliente;
    LocalDate diaReserva;
    LocalTime horaReserva;
    int numPersonas;

    public int getRestaurante() {
        return restaurante;
    }

    public void setRestaurante(int restaurante) {
        this.restaurante = restaurante;
    }

    public int getZona() {
        return zona;
    }

    public void setZona(int zona) {
        this.zona = zona;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public LocalDate getDiaReserva() {
        return diaReserva;
    }

    public void setDiaReserva(LocalDate diaReserva) {
        this.diaReserva = diaReserva;
    }

    public LocalTime getHoraReserva() {
        return horaReserva;
    }

    public void setHoraReserva(LocalTime horaReserva) {
        this.horaReserva = horaReserva;
    }

    public int getNumPersonas() {
        return numPersonas;
    }

    public void setNumPersonas(int numPersonas) {
        this.numPersonas = numPersonas;
    }

    public Reserva(int restaurante, int zona, LocalDate diaReserva, LocalTime horaReserva, int numPersonas, String nombreCliente) {
        this.restaurante = restaurante;
        this.zona = zona;
        this.nombreCliente = nombreCliente;
        this.diaReserva = diaReserva;
        this.horaReserva = horaReserva;
        this.numPersonas = numPersonas;
    }

    @Override
    public String toString() {
        return  restaurante + ";" + zona + ";" + diaReserva + ";" + horaReserva + ";" + numPersonas + ";" + nombreCliente ;
    }
}
