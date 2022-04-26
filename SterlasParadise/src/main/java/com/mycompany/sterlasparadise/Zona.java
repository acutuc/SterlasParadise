/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.sterlasparadise;

/**
 *
 * @author fcoj
 */
import java.util.*;

public class Zona {
    
    private int numZona;
    private int numMesasDisp;
    private boolean exterior;

    public Zona(int numZona, boolean exterior) {
        
        this.numZona = numZona;
        numMesasDisp = 20;
        this.exterior = exterior;
        
    }

    public Zona(int numZona, int numMesasDisp, boolean exterior) {
        
        this.numZona = numZona;
        this.numMesasDisp = numMesasDisp;
        this.exterior = exterior;
        
    }
    
    public Zona() {
        
        Random generate = new Random();
        
        numZona = generate.nextInt(3) + 1;
        numMesasDisp = 20;
        exterior = generate.nextBoolean();
        
    }

    public int getNumZona() {
        
        return numZona;
        
    }

    public void setNumZona(int numZona) {
        
        this.numZona = numZona;
        
    }

    public int getNumMesasDisp() {
        
        return numMesasDisp;
        
    }

    public void setNumMesasDisp(int numMesasDisp) {
        
        this.numMesasDisp = numMesasDisp;
        
    }

    public boolean isExterior() {
        
        return exterior;
        
    }

    public void setExterior(boolean exterior) {
        
        this.exterior = exterior;
        
    }

    @Override
    public String toString() {
            
        return "Zona " + numZona + ", en el " + ((exterior)?"exterior":"interior")
                + ", con" + numMesasDisp
                + " mesas disponibles";
        
    }
            
}
