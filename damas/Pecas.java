/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package damas;

import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JPanel;

public class Pecas extends JPanel {
	int []x={0,600,600,0};
	int []y={0,0,600,600};
        String []pecaBranca= new String[12];
        String []pecaPreta= new String[12];
        String []dama= new String[12];
       

   

    Pecas(String []sb, String []sp, String []sd ) {
            this.pecaBranca=sb;
            this.pecaPreta=sp;
            this.dama=sd;    }
                        
        
	public void paintComponent (Graphics g){
		g.setColor(Color.BLACK);
		g.fillPolygon(x, y, 4);
		int x1[] = {0,75,75,0};
		int y1[] = {0,0,75,75};
		g.setColor(Color.WHITE);
		g.fillPolygon(x1, y1, 4);

		for(int i = 1; i < 5; i++){ //1linha
			x1 = dobrar(x1);
			g.fillPolygon(x1, y1, 4);
		}

		x1[0] = 0; x1[1] = 75; x1[2] = 75; x1[3] = 0;
		y1[0] = 150; y1[1] = 150; y1[2] = 225; y1[3] = 225;

		g.fillPolygon(x1, y1, 4);
		for(int j = 1; j < 5 ; j++){  //3 linha
			x1 = dobrar(x1);
			g.fillPolygon(x1, y1, 4);
		}

		x1[0] = 0; x1[1] = 75; x1[2] = 75; x1[3] = 0;
		y1[0] = 300; y1[1] = 300; y1[2] = 375; y1[3] = 375;

		g.fillPolygon(x1, y1, 4);
		for(int j = 1; j < 5 ; j++){  //5 linha
			x1 = dobrar(x1);
			g.fillPolygon(x1, y1, 4);
		}

		x1[0] = 0; x1[1] = 75; x1[2] = 75; x1[3] = 0;
		y1[0] = 450; y1[1] = 450; y1[2] = 525; y1[3] = 525;

		g.fillPolygon(x1, y1, 4);
		for(int j = 1; j < 5 ; j++){  //7 linha
			x1 = dobrar(x1);
			g.fillPolygon(x1, y1, 4);
		}

		x1[0] = 75; x1[1] = 150; x1[2] = 150; x1[3] = 75;
		y1[0] = 75; y1[1] = 75; y1[2] = 150; y1[3] = 150;

		g.fillPolygon(x1, y1, 4);
		for(int j = 1; j < 5 ; j++){  //7 linha
			x1 = dobrar(x1);
			g.fillPolygon(x1, y1, 4);
		}

		x1[0] = 75; x1[1] = 150; x1[2] = 150; x1[3] = 75;
		y1[0] = 225; y1[1] = 225; y1[2] = 300; y1[3] = 300;

		g.fillPolygon(x1, y1, 4);
		for(int j = 1; j < 5 ; j++){  //7 linha
			x1 = dobrar(x1);
			g.fillPolygon(x1, y1, 4);
		}

		x1[0] = 75; x1[1] = 150; x1[2] = 150; x1[3] = 75;
		y1[0] = 375; y1[1] = 375; y1[2] = 450; y1[3] = 450;

		g.fillPolygon(x1, y1, 4);
		for(int j = 1; j < 5 ; j++){  //7 linha
			x1 = dobrar(x1);
			g.fillPolygon(x1, y1, 4);
		}

		x1[0] = 75; x1[1] = 150; x1[2] = 150; x1[3] = 75;
		y1[0] = 525; y1[1] = 525; y1[2] = 600; y1[3] = 600;

		g.fillPolygon(x1, y1, 4);
		for(int j = 1; j < 5 ; j++){  //7 linha
			x1 = dobrar(x1);
			g.fillPolygon(x1, y1, 4);
		}

/*


AQui começa a pintar as peças
        
        
        */
                for (int i=0;i<pecaBranca.length;i++){
                if ( "58".equals(pecaBranca[i])){
                    g.setColor(Color.yellow);
                    g.fillOval(75, 0, 75, 75);
                

              }}for (int i=0;i<pecaPreta.length;i++){ if("58".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(75, 0, 75, 75);
                  }
                 }for (int i=0;i<dama.length;i++){   
                    if ("58".equals(dama[i])){
                        
                         g.drawOval(75, 0, 25, 25);
                        g.fillOval(75, 0, 25, 25);
                    }}
                                
               for (int i=0;i<pecaBranca.length;i++){
                if ( "60".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(225, 0, 75, 75);
                }}for (int i=0;i<pecaPreta.length;i++){ if("60".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(225, 0, 75, 75);
                    }   }for (int i=0;i<dama.length;i++){
                        if ("60".equals(dama[i])){

                       g.drawOval(225, 0, 25, 25);
                         g.fillOval(225, 0, 25, 25);
                    }
                  }
                 
                for (int i=0;i<pecaBranca.length;i++){
                if ( "62".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(375, 0, 75, 75);

                   }}for (int i=0;i<pecaPreta.length;i++){ if("62".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(375, 0, 75, 75);
                    }}for (int i=0;i<dama.length;i++){
                        if ("62".equals(dama[i])){

                       g.drawOval(375, 0, 25, 25);
                       g.fillOval(375, 0, 25, 25);
                    }
                  }

               for (int i=0;i<pecaBranca.length;i++){
                if ( "64".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(525, 0, 75, 75);
                }}for (int i=0;i<pecaPreta.length;i++){ if("64".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(525, 0, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                        if ("64".equals(dama[i])){
                        g.drawOval(525, 0, 25, 25);
                        g.fillOval(525, 0, 25, 25);
                    }
                 }

               for (int i=0;i<pecaBranca.length;i++){
                if ( "48".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(525, 150, 75,75);
                 }}for (int i=0;i<pecaPreta.length;i++){if("48".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(525, 150, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("48".equals(dama[i])){
                         g.drawOval(525, 150,25, 25);
                         g.fillOval(525, 150,25, 25);
                    }
                 }

                for (int i=0;i<pecaBranca.length;i++){
                if ( "46".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(375, 150, 75,75);
                 }}for (int i=0;i<pecaPreta.length;i++){if("46".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(375, 150, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("46".equals(dama[i])){
                         g.drawOval(375, 150,25, 25);
                         g.fillOval(375, 150,25, 25);
                    }
                 }

                for (int i=0;i<pecaBranca.length;i++){
                if ( "44".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(225, 150, 75,75);
               }}for (int i=0;i<pecaPreta.length;i++){if("44".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(225, 150, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("44".equals(dama[i])){
                         g.drawOval(225, 150,25, 25);
                         g.fillOval(225, 150,25, 25);
                    }
                 }

                for (int i=0;i<pecaBranca.length;i++){
                if ( "42".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(75, 150, 75,75);
                }}for (int i=0;i<pecaPreta.length;i++){ if("42".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(75, 150, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("42".equals(dama[i])){
                         g.drawOval(75, 150,25, 25);
                         g.fillOval(75, 150,25, 25);
                    }
                 }

                for (int i=0;i<pecaBranca.length;i++){
                if ( "32".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(525, 300, 75,75);
                 }}for (int i=0;i<pecaPreta.length;i++){ if("32".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(525, 300, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("32".equals(dama[i])){
                         g.drawOval(525, 300,25, 25);
                         g.fillOval(525, 300,25, 25);
                    }
                 }

                for (int i=0;i<pecaBranca.length;i++){
                if ( "30".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(375, 300, 75,75);
                   }}for (int i=0;i<pecaPreta.length;i++){ if("30".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(375,300, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("30".equals(dama[i])){
                         g.drawOval(375, 300,25, 25);
                         g.fillOval(375, 300,25, 25);
                    }
                 }

                for (int i=0;i<pecaBranca.length;i++){
                if ( "28".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(225, 300, 75,75);
                    }}for (int i=0;i<pecaPreta.length;i++){ if("28".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(225,300, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("28".equals(dama[i])){
                         g.drawOval(225, 300,25, 25);
                         g.fillOval(225, 300,25, 25);
                    }
                 }

               for (int i=0;i<pecaBranca.length;i++){
                if ( "26".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(75, 300, 75,75);
                 }}for (int i=0;i<pecaPreta.length;i++){ if("26".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(75, 300, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("26".equals(dama[i])){
                         g.drawOval(75, 300,25, 25);
                         g.fillOval(75, 300,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "10".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(75, 450, 75,75);
                 }}for (int i=0;i<pecaPreta.length;i++){if("10".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(75, 300, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("10".equals(dama[i])){
                         g.drawOval(75, 450,25, 25);
                         g.fillOval(75, 450,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "12".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(225, 450, 75,75);
                 }}for (int i=0;i<pecaPreta.length;i++){ if("12".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(225,450, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("12".equals(dama[i])){
                         g.drawOval(225, 450,25, 25);
                         g.fillOval(225, 450,25, 25);
                    }
                 }
                
               for (int i=0;i<pecaBranca.length;i++){
                if ( "14".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(375, 450, 75,75);
                }}for (int i=0;i<pecaPreta.length;i++){ if("14".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(375,450, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("14".equals(dama[i])){
                         g.drawOval(375, 450,25, 25);
                         g.fillOval(375, 450,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "16".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(525, 450, 75,75);
                }}
                for (int i=0;i<pecaPreta.length;i++){if("16".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(525, 450, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("16".equals(dama[i])){
                         g.drawOval(525, 450,25, 25);
                         g.fillOval(525, 450,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "1".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(0,525, 75,75);
                }}for (int i=0;i<pecaPreta.length;i++){if("1".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(0,525, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("1".equals(dama[i])){
                         g.drawOval(0,525,25, 25);
                         g.fillOval(0,525,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "3".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(150,525, 75,75);
                    }}for (int i=0;i<pecaPreta.length;i++){ if("3".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(150,525, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("3".equals(dama[i])){
                         g.drawOval(150,525,25, 25);
                         g.fillOval(150,525,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "5".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(300,525, 75,75);
                }}for (int i=0;i<pecaPreta.length;i++){if("5".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(300,525, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("5".equals(dama[i])){
                         g.drawOval(300,525,25, 25);
                         g.fillOval(300,525,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "7".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(450,525, 75,75);
                    }}for (int i=0;i<pecaPreta.length;i++){if("7".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(450,525, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("7".equals(dama[i])){
                         g.drawOval(450,525,25, 25);
                         g.fillOval(450,525,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "17".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(0,375, 75,75);
                  }}for (int i=0;i<pecaPreta.length;i++){if("17".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(0,375, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("17".equals(dama[i])){
                         g.drawOval(0,375,25, 25);
                         g.fillOval(0,375,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "19".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(150,375, 75,75);
                   }}for (int i=0;i<pecaPreta.length;i++){if("19".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(150,375, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("19".equals(dama[i])){
                         g.drawOval(150,375,25, 25);
                         g.fillOval(150,375,25, 25);
                    }
                 }
                
   for (int i=0;i<pecaBranca.length;i++){
                if ( "21".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(300,375, 75,75);
               }}for (int i=0;i<pecaPreta.length;i++){ if("21".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(300,375, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("21".equals(dama[i])){
                         g.drawOval(300,375,25, 25);
                         g.fillOval(300,375,25, 25);
                    }
                 }
                
             for (int i=0;i<pecaBranca.length;i++){
                if ( "23".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(450,375, 75,75);
               }}for (int i=0;i<pecaPreta.length;i++){if("23".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(450,375, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("23".equals(dama[i])){
                         g.drawOval(450,375,25, 25);
                         g.fillOval(450,375,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "33".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(0,225, 75,75);
                  }}for (int i=0;i<pecaPreta.length;i++){if("33".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(0,225, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("33".equals(dama[i])){
                         g.drawOval(0,225,25, 25);
                         g.fillOval(0,225,25, 25);
                    }
                 }
                
               for (int i=0;i<pecaBranca.length;i++){
                if ( "35".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(150,225, 75,75);
                    }}for (int i=0;i<pecaPreta.length;i++){ if("35".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(150,225, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("35".equals(dama[i])){
                         g.drawOval(150,225,25, 25);
                         g.fillOval(150,225,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "37".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(300,225, 75,75);
                 }}for (int i=0;i<pecaPreta.length;i++){ if("37".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(300,225, 75, 75);
                        }
                }for (int i=0;i<dama.length;i++){
                 if ("37".equals(dama[i])){
                         g.drawOval(300,225,25, 25);
                         g.fillOval(300,225,25, 25);
                    }
                 }
                
               for (int i=0;i<pecaBranca.length;i++){
                if ( "39".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(450,225, 75,75);
                    }}for (int i=0;i<pecaPreta.length;i++){ if("39".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(450,225, 75, 75);
                        }}
                for (int i=0;i<dama.length;i++){
                 if ("39".equals(dama[i])){
                         g.drawOval(450,225,25, 25);
                         g.fillOval(450,225,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "49".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(0,75, 75,75);
                    }}for (int i=0;i<pecaPreta.length;i++){ if("49".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(0,75, 75, 75);
                        }}
                for (int i=0;i<dama.length;i++){
                 if ("49".equals(dama[i])){
                         g.drawOval(0,75,25, 25);
                         g.fillOval(0,75,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "51".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(150,75, 75,75);
                }}for (int i=0;i<pecaPreta.length;i++){   
                if("51".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(150,75, 75, 75);
                        }}
                 for (int i=0;i<dama.length;i++){
                 if ("51".equals(dama[i])){
                         g.drawOval(150,75,25, 25);
                         g.fillOval(150,75,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "53".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(300,75, 75,75);
                }}for (int i=0;i<pecaPreta.length;i++){
                    if("53".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(300,75, 75, 75);
                        }}
                 for (int i=0;i<dama.length;i++){
                 if ("53".equals(dama[i])){
                         g.drawOval(300,75,25, 25);
                         g.fillOval(300,75,25, 25);
                    }
                 }
                
                for (int i=0;i<pecaBranca.length;i++){
                if ( "55".equals(pecaBranca[i]) ){
                    g.setColor(Color.yellow);
                    g.fillOval(450,75, 75,75);
                    }}
                for (int i=0;i<pecaPreta.length;i++){ if("55".equals(pecaPreta[i])){
                        g.setColor(Color.blue);
                        g.fillOval(450,75, 75, 75);
                        }}
                for (int i=0;i<dama.length;i++){
                 if ("55".equals(dama[i])){
                         g.drawOval(450,75,25, 25);
                         g.fillOval(450,75,25, 25);
                    }
                 }
                /*
                
		g.fillOval(375, 0, 75, 75);
		g.fillOval(525, 0, 75, 75);   */

	}//fim do paintComponent

	public int[] dobrar(int x []){
		for (int i = 0; i < 4; i++ )
			x[i] = x[i]+150;
			return x;
		} //fim de dobrar

	
}//fim da classe
