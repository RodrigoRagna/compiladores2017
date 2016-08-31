/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package prácticacompiladores;

/**
 *
 * @author luis
 */
public class Ejercicio2{
    int[][] ejercicio2 = {{1,5},{3,2},{5,5},{5,4},{5,5},{5,5}};
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
            if(temp3 != 2){
                actual = ejercicio2[actual][temp3];
            }else{
                System.out.println(temp2+" es un caracter no reconocido");
                actual = 4;
                
            }
        }
        switch (actual){
            case 2:
                System.out.println(s+" es una cadena reconocida");
                break;
            case 4:
                System.out.println(s+" es una cadena reconocida");
                break;
            default:
                System.out.println(s+" no es una cadena reconocida y terminó en el estado "+actual);
                break;
        }
    }
    
    public int corres(String e){
        switch (e){
            case "0":
                return 0;
            case "1":
                return 1;
            default:
                return 2;
        }
    }
    
    
}