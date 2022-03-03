/*********************************************
 * OPL 20.1.0.0 Model
 * Author: margauxschmied
 * Creation Date: 1 mars 2022 at 12:02:59
 *********************************************/

 int nbPiece=...;
 int nbTour=...;
 
 range pieces=1..nbPiece;
 range tours=1..nbTour;
 
 int heure[tours][pieces]=...;
 		
 int diponibilite[tours]=...;
 
 int demande[pieces]=...;
 
 dvar int+ A[tours][pieces];

 
 minimize sum(i in tours) sum(j in pieces) A[i][j]*heure[i][j] ; //minimize le monbre total d'heure ou les machine tourne
 
 subject to {
   
   forall(i in tours){
     forall(j in pieces){
       A[i][j]>=0;  //le nombre de piece affecté est positife
     }
   }
   
   forall(i in pieces){
     sum(j in tours) A[j][i]==demande[i]; //le total de chauque type de piece est égal a la demande
   }
   
   forall(i in tours){
     sum(j in pieces) A[i][j]*heure[i][j]<=diponibilite[i]; //le total de temps de chaque machine est inférieur ou egale au temps ou elle peux fonctionner
   }
 }
 
 //solution = [[0, 0, 20, 0], [0, 0, 30, 0, ], [10, 40, 0, 20]]
 //objectif = 190
 
 
 