/*********************************************
 * OPL 20.1.0.0 Model
 * Author: margauxschmied
 * Creation Date: 8 mars 2022 at 09:28:06
 *********************************************/

 int nbMounth=...;
 range mounths=1..nbMounth;
 range mounths1=1..(nbMounth+1);
 
 int demande[mounths]=...;
 int nbWorker=...;
 int unitMounth=...;
 int addUnit=...;
 int costAddUnit=...;
 int storageCost=...;
 int variasionNbEployee=...;
 int costEmployee=...;
 int costDismiss=...;
 
 dvar int+ stock[mounths1];
 dvar int+ employee[mounths1];
 dvar int+ employeeExtra[mounths];
 dvar int+ production[mounths];
 dvar int+ dismiss[mounths];
 dvar int+ hire[mounths];
 
 
 dexpr int costStockEmployee=sum(i in mounths)(stock[i]*storageCost+employeeExtra[i]*costAddUnit);
 dexpr int costEmploy=sum(i in mounths) (hire[i]*costEmployee);
 dexpr int costDismis=sum(i in mounths) (dismiss[i]*costDismiss);
 
 
 minimize costStockEmployee+costEmploy+costDismis;
 
 subject to {
   production[1]>=demande[1];
   employee[1]==nbWorker;
   
   forall(i in mounths){
     	production[i]==(employee[i]*unitMounth)+employeeExtra[i];
     	employeeExtra[i]<=employee[i]*addUnit;
     	hire[i]<=variasionNbEployee;
     	dismiss[i]<=variasionNbEployee;
     	hire[i]==0 || dismiss[i]==0;
     	
   }
   
   forall(i in mounths: i>1){
		//(production[i]+stock[i-1])>=demande[i];
		employeeExtra[i]+stock[i-1]+production[i]==demande[i]+stock[i];
		employee[i-1]+hire[i]==dismiss[i]+employee[i];
   }
   
   stock[1]==0;
   stock[nbMounth+1]==0;
   
 }
 
 //A FINIR
 
 