package com.mycompany.sterlasparadise;

import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author maxi
 */
public class ProgramaPrincipal {

    public static void main(String[] args) {
        
        //CREACION DE ZONAS PARA LOS DISTINTOS RESTAURANTES
        Zona hawaiiInterior = new Zona(1, 10, false);
        Zona hawaiiExterior = new Zona(2, 10, true);
        Zona cerdenyaInterior = new Zona(1, 10, false);
        Zona cerdenyaExterior = new Zona(2, 10, true);
        Zona marbellaInterior1aPlanta = new Zona(1, 10, false);
        Zona marbellaInterior2aPlanta = new Zona(3, 5, false);
        Zona londonInterior = new Zona(1, 10, false);
        
        //CREACION DE LOS RESTAURANTES 
        /*-Hawaii solo tiene servicio de comidas y London solo de cenas*/
        Restaurante hawaii = new Restaurante("Hawaii", "P.º de Maritimo Torremolinos, 17, 29620 Torremolinos, Málaga", 
                new ArrayList<>(Arrays.asList(hawaiiInterior, hawaiiExterior)));
        Restaurante cerdenya = new Restaurante("Cerdeña", "Loc Perd Orru, 09080 Nughedu Santa Vittoria OR, Italia", 
                new ArrayList<>(Arrays.asList(cerdenyaInterior, cerdenyaExterior)));
        Restaurante marbella = new Restaurante("Marbella", "Calle Virgen de los Dolores, 4, 29601 Marbella, Málaga", 
                new ArrayList<>(Arrays.asList(marbellaInterior1aPlanta, marbellaInterior2aPlanta)));
        Restaurante london = new Restaurante("London", "72-74 Lombard St, London EC3V 9AY, Reino Unido", 
                new ArrayList<>(Arrays.asList(londonInterior)));
        
        //CLIENTES DE PRUEBA
        Persona c1 = GeneradorPersonas.generarPersona();
        Persona c2 = GeneradorPersonas.generarPersona();
        Persona c3 = GeneradorPersonas.generarPersona();
        
    }
    
}
