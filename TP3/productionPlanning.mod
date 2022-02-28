/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Arnaud Malapert
 *
 * Production Planning (Ex. 4.4) 
 * Problems and exercises in Operations Research, Leo Liberti
 * https://www.lix.polytechnique.fr/~liberti/teaching/dix/inf580-17/
 * Original author: E. Amaldi, Politecnico di Milano
 *
 * Creation Date: 16 févr. 2022 at 14:06:16
 *********************************************/

/////////////////////
// Problem Dimensions

// Number of products
 int n = ...;
 range N = 1..n;
 
 // Number of months
 int m = ...;
 range M = 1..m;
 range M1 = 1..m+1;

/////////////////////
// Problem Data  
 int demands[N][M] = ...;
 
 float unitPrices[N] = ...;
 float activationCosts[N] = ...;
 float productionCosts[N] = ...;
 int productionQuotas[N] = ...;
 int minimumBatches[N] = ...;
 
 int productiveDays[M] = ...;
 
 float storageCosts[N] = ...;
 int storageCapacity = ...;
 
 /////////////////////
 // Decision variables 
 
 // Number of A_i  produced at the j-th month 
 dvar int+ produced[N][M];
 // Number of A_i  consumed/sold at the j-th month
 dvar int+ consumed[N][M];
 // Number of A_i  available in the storage at the j-th month
 dvar int+ stocked[N][M1];

///////////////////// 
// Expressions
 
 // Indicate of the production line of A_i is activated at the j-th month. 
 dexpr int activated[i in N][j in M] = produced[i][j] >= 1;

///////////////////// 
// Objective  

 // Total activation cost for all production lines over months 
 dexpr float activationCost = sum(i in N, j in M) activationCosts[i] * activated[i][j];
 // Total production cost of products over months
 dexpr float productionCost = sum(i in N, j in M) productionCosts[i] * produced[i][j];
 // Total storage cost for all products over months
 dexpr float storageCost = sum(i in N, j in M1) storageCosts[i] * stocked[i][j];
// Total profit for all products over months
 dexpr float consumptionProfit = sum(i in N, j in M) unitPrices[i] * consumed[i][j];
 
 maximize consumptionProfit - productionCost - activationCost - storageCost;
 
 ///////////////////// 
 // Constraints 
 subject to {
   
   forall(i in N) {
   	// The initial stock of each product is empty.  
   	stocked[i][1] == 0;	
 	 
 	 
   forall(j in M) {
   	 // Product Flow Conservation
     stocked[i][j] + produced[i][j] - consumed[i][j] == stocked[i][j + 1];
   
     // Cannot sell more than the demand
 	 consumed[i][j] <= demands[i][j];
 	 
 	 // Must satisfy minimum batches
 	 produced[i][j] >= minimumBatches[i] * activated[i][j];
   }
 } 
 	
 forall(j in M) {
   // Do not exceed monthly production quotas
   sum(i in N) produced[i][j] / productionQuotas[i] <= productiveDays[j];	
} 	
	
forall(j in M1) {
	// Do not exceed monthly storage capacity
   sum(i in N) stocked[i][j] <= storageCapacity;	  		
 }     
}

