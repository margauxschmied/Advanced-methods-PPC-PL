/*********************************************
 * OPL 20.1.0.0 Model
 * Author: margauxschmied
 * Creation Date: 15 mars 2022 at 09:54:17
 *********************************************/

 int nbDemand=...;
 range demands=1..nbDemand;
 
 int u1=...;
 int u2=...;
 
 float requiredCapacity[demands]=...;
 int cost1[demands]=...;
 
 int  cost2percentage=...;
 
 dvar boolean link1[demands];
 dvar boolean link2[demands];
 

 
 minimize sum(i in demands) (link1[i]*cost1[i]+link2[i]*((cost2percentage*cost1[i]/100)+cost1[i]));
 
 subject to {
	forall(i in demands){
	  link1[i]==1 || link2[i]==1;
	}
	
	sum(i in demands) (link1[i]*requiredCapacity[i])<=u1;
   	sum(i in demands) (link2[i]*requiredCapacity[i])<=u2;
   
 }
 
 //objectif=3610
 //pour generaliser mettre les link dans des list de link