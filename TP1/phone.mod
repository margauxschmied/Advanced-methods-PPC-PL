/*********************************************
 * OPL 20.1.0.0 Model
 * Author: marg
 * Creation Date: 8 févr. 2022 at 09:41:59
 *********************************************/
dvar int+ desk;
dvar int+ cellular;

int minQuant = ...;

int assemblyDesk = ...;
int assemblyCellular = ...;
int paintingDesk = ...;
int paintingCellular = ...;

int maxHAssembly = ...;
int maxHPainting = ...;

int deskPrice = ...;
int cellularPrice = ...;




maximize desk * deskPrice + cellular * cellularPrice;

subject to {
  desk >= minQuant;
  cellular >= minQuant;
  assemblyDesk * desk + assemblyCellular * cellular <= maxHAssembly;
  paintingDesk * desk + paintingCellular * cellular <= maxHPainting;
}