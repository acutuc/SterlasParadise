
package com.mycompany.sterlasparadise;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author javiakasino
 */
public class GenerarCSV {
    
    public void generarCSVReservas(){
        
        
        //Paso reserva a ArrayList de String con el orden pactado
        ArrayList<String> reserva = new ArrayList<>();
        
        System.out.println("\n\nRESERVAS\n");

        //Fichero a crear. Ruta relativa a la carpeta raíz del proyecto
        String idFichero = "reservas.csv";

        //Estructura try-with-resources. Instancia el objeto con el fichero a escribir
        //Se encarga de cerrar el recurso "flujo" una vez finalizadas las operaciones
        try ( BufferedWriter flujo = new BufferedWriter(new FileWriter(idFichero))) {

            flujo.write("RESTAURANTE\tZONA\tFECHA\tHORA\tNºPERSONAS\tCLIENTE"); //Cabecera

            flujo.newLine();

           

            flujo.flush(); // Metodo flush() guarda cambios en disco 

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        
    }
    
    
}
