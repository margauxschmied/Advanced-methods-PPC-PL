/*********************************************
 * OPL 20.1.0.0 Model
 * Author: marg
 * Creation Date: 8 févr. 2022 at 11:56:20
 *********************************************/

dvar int+ A[1..3];

int maximumDemand[1..3] = ...;
int sellingPrice[1..3]=...;
float productCost[1..3]=...;
int productionQuota[1..3]=...;


maximize A[1]*(sellingPrice[1]-productCost[1])+A[2]*(sellingPrice[2]-productCost[2])+A[3]*(sellingPrice[3]-productCost[3]);

subject to {
  A[1]*22<=maximumDemand[1];
  A[2]*22<=maximumDemand[2];
  A[3]*22<=maximumDemand[3];
  
  A[1]<=productionQuota[1];
  A[2]<=productionQuota[2];
  A[3]<=productionQuota[3];
  
  
  
}