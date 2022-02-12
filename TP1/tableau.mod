/*********************************************
 * OPL 20.1.0.0 Model
 * Author: marg
 * Creation Date: 8 févr. 2022 at 10:17:14
 *********************************************/

int n = ...;
range N = 1..n;

dvar int+ x[N];

int a[N] = ...;
int b = ...;

minimize sum(i in N) x[i];

subject to {
  sum(i in N: i > 2) a[i] * x[i] >= b;
}