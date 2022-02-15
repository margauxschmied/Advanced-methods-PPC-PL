/*********************************************
 * OPL 20.1.0.0 Model
 * Author: marg
 * Creation Date: 8 févr. 2022 at 11:56:20
 *********************************************/

range N=1..3;

dvar int+ A[N];
dvar boolean activated[N];

int maximumDemand[N] = ...;
int sellingPrice[N]=...;
float productCost[N]=...;
int productionQuota[N]=...;
int activityCost[N]=...;
int minBatch[N]=...;


maximize sum(i in N) ((A[i]*(sellingPrice[i]-productCost[i]))-(activityCost[i]*activated[i]));

subject to {
  forall (i in N){
	  A[i]<=maximumDemand[i];
	  A[i]>=minBatch[i]*activated[i];
	  A[i]<=22*productionQuota[i]*activated[i];
	}  
  
  
  sum(i in N) (A[i]/productionQuota[i])<=22;
  
}

//Q1=[5300, 715, 5396]
//Q2=[0, 4500, 5400] objectif 270290
//Q3=[0, 4500, 5400] objectif 270290 même reponse car le batch ne change rien