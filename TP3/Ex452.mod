/*********************************************
 * OPL 20.1.0.0 Model
 * Author: margauxschmied
 * Creation Date: 18 févr. 2022 at 10:18:52
 *********************************************/
 int nbEC=...;
 int nbCD=...;
 
 range nbEmptyContainer=1..nbEC;
 range nbContainerDemand=1..nbCD;
 
dvar int+ A[nbEmptyContainer][nbContainerDemand];
dvar int+ camion[nbEmptyContainer][nbContainerDemand];

 int emptyContainer[nbEmptyContainer]=...;
 int containerDemand[nbContainerDemand]=...;
 int priceKilometre[nbEmptyContainer][nbContainerDemand]=...;
 int costByKilometre=...;

minimize sum(i in nbEmptyContainer, j in nbContainerDemand) camion[i][j]*priceKilometre[i][j]*costByKilometre;
 
 subject to {
   forall(j in nbContainerDemand){
     sum(i in nbEmptyContainer)(A[i][j])==containerDemand[j];
   }
   
   forall(i in nbEmptyContainer){
     sum(j in nbContainerDemand)(A[i][j])<=emptyContainer[i];
   }
   
   forall(i in nbEmptyContainer, j in nbContainerDemand) {
     2 * camion[i][j] >= A[i][j];
   }     
   
 }
 
 //objectif: 468 510
 //[[0, 10, 0, 0, 0], [6, 5, 1, 0, 0], [14, 0, 0, 6, 0], [0, 0, 24, 0, 0], [0, 0, 0, 1, 17], [0, 0, 0, 26, 4]]
 
 
 
 