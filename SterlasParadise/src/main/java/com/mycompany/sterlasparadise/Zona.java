/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sterlasparadise;

/**
 *
 * @author fcoj
 */
import java.time.LocalDateTime;
import java.util.*;

public class Zona {
    
    private int numZona;
    private int numMesasMax;
    private boolean exterior;
    private Map<LocalDateTime,Integer> reservas;

    public Zona(int numZona, int numMesasMax, boolean exterior, Map<LocalDateTime, Integer> reservas) {
        this.numZona = numZona;
        this.numMesasMax = numMesasMax;
        this.exterior = exterior;
        this.reservas = reservas;
    }

    public int getNumMesasMax() {
        return numMesasMax;
    }

    public void setNumMesasMax(int numMesasMax) {
        this.numMesasMax = numMesasMax;
    }

    public Map<LocalDateTime, Integer> getReservas() {
        return reservas;
    }

    public void setReservas(Map<LocalDateTime, Integer> reservas) {
        this.reservas = reservas;
    }
    

    

    public int getNumZona() {
        
        return numZona;
        
    }

    public void setNumZona(int numZona) {
        
        this.numZona = numZona;
        
    }

    
    public boolean isExterior() {
        
        return exterior;
        
    }

    public void setExterior(boolean exterior) {
        
        this.exterior = exterior;
        
    }
    public int anyadirReserva(LocalDateTime hora, int numPersonas){
        int numMesas=0;
        if(numPersonas<=2){
            numMesas=1;
        }else{
            numMesas=(int)(Math.ceil((numPersonas-2)/2));
        }
        if(!this.reservas.containsKey(hora)){
            if(this.numMesasMax-numMesas>=0){
                this.reservas.put(hora,this.numMesasMax-numMesas);
            }else{
                return 0;
            }      
        }else{
            if(this.reservas.get(hora)-numMesas>=0){
                this.reservas.put(hora,this.reservas.get(hora)-numMesas-numMesas);
            }else{
                return 0;
            }      
        }
        return numMesas;
        
    }

    
            
}
