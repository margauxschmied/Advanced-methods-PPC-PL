/*********************************************
 * OPL 20.1.0.0 Model
 * Author: margauxschmied
 * Creation Date: 1 mars 2022 at 10:47:06
 *********************************************/

int nbDigit=4;
range digits=1..nbDigit;

dvar int+ codePin[digits];

 dexpr float cd = (codePin[3]*10)+codePin[4];
 dexpr float ab = (codePin[1]*10)+codePin[2];
 dexpr float da = (codePin[4]*10)+codePin[1];
 dexpr float bc = (codePin[2]*10)+codePin[3];
 
 
 subject to {
   forall(i in digits){
     codePin[i]<=9 && codePin[i]>=0;  
 	
     forall(j in digits: i!=j){
       codePin[i]!=codePin[j];
     }
   
	}
	cd*3==ab;
	da*2==bc;
	
	//pour vérifier que la solution est unique
	//codePin[1]!=6; 
	//codePin[2]!=3; 
	//codePin[3]!=2; 
	//codePin[4]!=1; 
	//essayer de decommanter chaque ligne independement
	
 }
 
 //solution = [6, 3, 2, 1]
 //la solution est unique puisque si on essaie de mettre une autre valeur ça ne fonctionne pas 