/*********************************************
 * OPL 20.1.0.0 Model
 * Author: marg
 * Creation Date: 8 févr. 2022 at 10:23:41
 *********************************************/

tuple MyData {
    int coeff;
}

{MyData} Data = ...;

dvar int+ x[Data];

int b = ...;

minimize sum(i in Data) x[i];

subject to {
  sum(i in Data) i.coeff * x[i] >= b;
}