/*********************************************
 * OPL 20.1.0.0 Model
 * Author: margauxschmied
 * Creation Date: 28 févr. 2022 at 10:58:58
 *********************************************/

int nbCar=...;
range rangeNbCar=1..nbCar;
float carSize[rangeNbCar]=...;

dvar int+ A[rangeNbCar];

dexpr float side1 = sum(i in rangeNbCar)carSize[i]*(A[i]==0);
dexpr float side2 = sum(i in rangeNbCar)carSize[i]*(A[i]==1);

minimize abs (side1-side2);
//minimize sum(i in rangeNbCar) A[i]*carSize[i];
 
 subject to {
   forall(i in rangeNbCar){
     A[i]==1 || A[i]==0;
   }


 }

//[1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0]
//cotéDroit = 28.6
//cotéGauche = 28.5