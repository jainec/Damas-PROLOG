/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package damas;

import javax.swing.JFrame;

/**
 *
 * @author 10110781
 */
public class Tabuleiro {

static int branca[] = new int [12];
static String[] b = new String[12];
static String[] p = new String[12];
static String[] d = new String[24];
static int preta[] = new int [12];
static int damas[] = new int [12];
static Pecas p1;
static String separador = ",";


	public static void main(String[] args) {
            branca[0]=49;
            preta[0]=3;
            damas[0]=49;
            damas[1]=3;
		/*JFrame frame = new JFrame("Damas"); //janela
		Pecas p1 = new Pecas();
                p1.setBrancas(branca);
                p1.setPretas(preta);
                p1.setDamas(damas);
               	frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(600,625);
		frame.add(p1);

		frame.setResizable(false);
		frame.setVisible(true);*/
            String s="55,99";
            String limitador =",";
            b = s.split(limitador);
            
          
            for(int i=0;i<b.length;i++){
            System.out.println(b[i]);}    
            
	}
        
        public static void show(String sb, String sp,String sd){
            JFrame frame = new JFrame("Damas"); //janela
            
                b = sb.split(separador);
                p = sp.split(separador);
                d = sd.split(separador);
		Pecas p1 = new Pecas(b,p,d);
                for(int i=0;i<b.length;i++){
                System.out.println(b[i]);}    
        	frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(600,625);
		frame.add(p1);
                frame.setResizable(false);
		frame.setVisible(true);
        }
        
            
        public static void imprimirTab(Pecas p1){
                 
            
                JFrame frame = new JFrame("Damas"); //janela
		//Pecas p1 = new Pecas();
                //p1.setBrancas(branca);
               // p1.setPretas(preta);
               // p1.setDamas(damas);
        	frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(600,625);
		frame.add(p1);

		frame.setResizable(false);
		frame.setVisible(true);

        }
}



