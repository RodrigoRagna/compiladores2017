/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package prácticacompiladores;
import java.util.Scanner;

/**
 *
 * @author luis
 */
public class PrácticaCompiladores {
    int[][] ejercicio1 = {{1,4,3},{4,2,4},{5,4,3},{4,4,4},{4,4,4},{4,6,4},{5,4,3}};
    int actual = 0;
    String resultado = "";
    /**
     * @param args the command line arguments
     */
    public void procesa(String s){
        String[] temp1 = s.split("(?!^)");
        for(int i = 0; i < s.length(); i++){
            String temp2 = temp1[i];
            int temp3 = corres(temp2);
            if(temp3 != 3){
                actual = ejercicio1[actual][temp3];
            }else{
                System.out.println(temp2+" es un caracter no reconocido");
                actual = 4;
                
            }
        }
        switch (actual){
            case 2:
                System.out.println(s+" es una cadena reconocida");
                break;
            case 3:
                System.out.println(s+" es una cadena reconocida");
                break;
            default:
                
                System.out.println(s+" no es una cadena reconocida y terminó en el estado "+actual);
                break;
        }
    }
    
    public int corres(String e){
        switch (e){
            case "a":
                return 0;
            case "b":
                return 1;
            case "c":
                return 2;
            default:
                return 3;
        }
    }
    public static void main(String[] args) {
        String s = "";
        Scanner sc = new Scanner(System.in);
        System.out.println("Elige el el ejercicio al que quieres entrar");
        s = sc.nextLine();
        if(s.equals("1")){
            while(true){
                System.out.println("Ingresa una cadena");
                s = sc.nextLine();
                if(s.equals("0")){
                    break;
                }else{
                    PrácticaCompiladores eje = new PrácticaCompiladores();
                    eje.procesa(s);
                }
            }
        }else{
            while(true){
                System.out.println("Ingresa una cadena para el ejercicio 2");
                s = sc.nextLine();
                if(s.equals("0")){
                    break;
                }else{
                    Ejercicio2 eje = new Ejercicio2();
                    eje.procesa(s);
                }
            }
        }
                
        
            
        
        
    }
    
}
