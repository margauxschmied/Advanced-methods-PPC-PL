/*********************************************
 * OPL 20.1.0.0 Model
 * Author: margauxschmied
 * Creation Date: 15 mars 2022 at 10:27:54
 *********************************************/

 int nbConnection=...;
 range connections=1..nbConnection;
 
 int c=...;
 float connection[connections][connections]=...;
 
 dvar boolean group1[connections]; 
 dvar boolean group2[connections]; 
 dvar boolean group3[connections]; 
 


 
 subject to {
   forall(i in connections){
     (group1[i]+group2[i]+group3[i])==1;
   }
   
   sum(i in connections)group1[i]>=2;
   sum(i in connections)group2[i]>=2;
   sum(i in connections)group3[i]>=2;
   

 }
 