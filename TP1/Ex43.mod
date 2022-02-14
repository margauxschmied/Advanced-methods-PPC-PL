/*********************************************
 * OPL 20.1.0.0 Model
 * Author: marg
 * Creation Date: 8 févr. 2022 at 11:56:20
 *********************************************/

range N=1..3;

dvar int+ A[N];
dvar int+ activated[N];

int maximumDemand[N] = ...;
int sellingPrice[N]=...;
float productCost[N]=...;
int productionQuota[N]=...;
int activityCost[N]=...;
int minBatch[N]=...;


maximize sum(i in N) ((A[i]*(sellingPrice[i]-productCost[i]))-(activityCost[i]*activated[i]));

subject to {
  A[1]<=maximumDemand[1];
  A[2]<=maximumDemand[2];
  A[3]<=maximumDemand[3];
  
  A[1]/productionQuota[1] + A[2]/productionQuota[2] + A[3]/productionQuota[3]<=22;
  
  A[1]>=minBatch[1]*activated[1];
  A[2]>=minBatch[2]*activated[2];
  A[3]>=minBatch[3]*activated[3];
  
  activated[1]>=0;
  activated[2]>=0;
  activated[3]>=0;
  
  activated[1]<=1;
  activated[2]<=1;
  activated[3]<=1;
  
  A[1]<=22*productionQuota[1]*activated[1];
  A[2]<=22*productionQuota[2]*activated[2];
  A[3]<=22*productionQuota[3]*activated[3];
  
  
}