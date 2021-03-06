/*********************************************
 * OPL 20.1.0.0 Model
 * Author: margauxschmied
 * Creation Date: 18 févr. 2022 at 12:28:05
 *********************************************/
int nbSalle=...;
range nbSalleRange=1..nbSalle;
int portes[nbSalleRange][nbSalleRange]=...;

dvar int+ A[nbSalleRange][nbSalleRange];

 
minimize sum(i in nbSalleRange, j in nbSalleRange) A[i][j]/2;

subject to{
  forall(j in nbSalleRange){
  	sum(i in nbSalleRange) portes[i][j]*A[i][j]>=1;
  	
  	forall(i in nbSalleRange){
  	  A[i][j]==A[j][i];
  	}
  	
   } 
	 
}

//objectif: 6

//A FAIRE: 4.12, CPU scheduling(4.10)