/*********************************************
 * OPL 20.1.0.0 Model
 * Author: margauxschmied
 * Creation Date: 1 mars 2022 at 11:06:00
 *********************************************/

 int nbTypePlaque = ...;
 range typePlaques = 1..nbTypePlaque;
 
 int largeurPlaqueRecu = ...;
 int logueurPlaqueRecu = ...;
 
 int minimumFabrication[typePlaques] =...;
 int largeurVoulu[typePlaques] = ...;
 
 
 dvar int+ A[typePlaques];
 dvar float quantiteUtilise;
 
 dvar int nbPlaques; //la plus petite valeur entiere supérieur a la quantité utilisé
 
 
 minimize nbPlaques-quantiteUtilise; //les dechets
 
 subject to {
   forall(i in typePlaques){
     A[i]>=minimumFabrication[i];
   }
   nbPlaques>=quantiteUtilise;

   quantiteUtilise*largeurPlaqueRecu==sum(i in typePlaques) (A[i]*largeurVoulu[i]);
 }
 
 //solution = [30, 40, 15]
 //objectif = 0 dechet
 
 //je suis contiente que modele ne fonctionne pas entierement
 //mon modele concidere qu'on peux repartir une petite plaque sur deux grandes
 
 
 