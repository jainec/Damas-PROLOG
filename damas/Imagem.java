/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package damas;

import java.awt.ComponentOrientation;
import javax.swing.*;

public class Imagem extends JFrame{
    
    ImageIcon iconimg = new ImageIcon("tabuleiro.jpg");
    JLabel jblimg; 
   
    
    public Imagem(){
        super("Tabuleiro de Damas");
        setDefaultLookAndFeelDecorated(true); 
          setComponentOrientation(ComponentOrientation.RIGHT_TO_LEFT);
          
        jblimg = new JLabel();  
       
        jblimg.setIcon(iconimg);  
        add(jblimg);  
        
        setSize(235, 250);
        setVisible(true);
        setLocation(1000,100);
       
        
    } 
}
