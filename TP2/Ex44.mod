/*********************************************
 * OPL 20.1.0.0 Model
 * Author: margauxschmied
 * Creation Date: 15 févr. 2022 at 09:43:46
 *********************************************/
range N=1..3;
range nbMois=1..5;

dvar int+ A[nbMois][N];
dvar boolean activated[nbMois][N];
dvar int+ Astore[nbMois][N];
dvar int+ vendu[nbMois][N];


int days[nbMois]=...;

int sellingPrice[N]=...;
float productCost[N]=...;
int productionQuota[N]=...;
int activityCost[N]=...;
int minBatch[N]=...;

int tabMois[nbMois][N]=...;

float storagePrice[N]=...;
int totalStorage=...;

maximize sum (j in 1..4, i in N) ((vendu[j][i]*sellingPrice[i])-(A[j][i]-productCost[i])-(Astore[j][i]*storagePrice[i])-(activityCost[i]*activated[j][i]));

subject to {
  forall (j in 1..4){
	  forall (i in N){
		  
		  A[j][i]>=minBatch[i]*activated[j][i];
		  A[j][i]<=days[j]*productionQuota[i]*activated[j][i];
		  
		  Astore[j][i]<=totalStorage*activated[j][i];
		}  
	  
	  sum(i in N) Astore[j][i]<=totalStorage;
	  
  	  sum(i in N) (A[j][i]/productionQuota[i])<=days[j];
	  
	}  
	
	forall(j in nbMois: j>1, i in N){
		Astore[j-1][i]+A[j-1][i]==Astore[j][i]+vendu[j][i];
		vendu[j][i]<=tabMois[j][i];
	}
	
	sum (i in N) Astore[5][i] == 0;
	//sum (i in N) vendu[5][i] == 0;
	sum (i in N) vendu[1][i] == 0;
	sum (i in N) A[5][i] == 0;
	
	
  
}