#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define nc 3
#define AVOGRADO 6.0221409e23         // 1/mol
#define BOLTZMANN 1.38064852e-23      // J/K
#define r AVOGRADO *BOLTZMANN         // J/mol/K
#define MAXCONDENTHERM_TEMPO 132.6312 // 10.4477
#define MAXCONDENTHERM_DENS 10.4477   // 10.4477

float delta;       // reduced density
float temperature; // Temperatura in K
float pressure;    // pressure em Pa
float tau;
float nk =
    (0.118160747229, 0.713116392079, -1.61824192067, 0.0714140178971,
     -0.0865421396646, 0.134211176704, 0.0112626704218, -0.0420533228842,
     0.0349008431982, 0.000164957183186, -0.101365037912, -0.17381369097,
     -0.0472103183731, -0.0122523554253, -0.146629609713, -0.0316055879821,
     0.000233594806142, 0.0148287891978, -0.00938782884667);
float ik = (1, 1, 1, 2, 3, 3, 4, 4, 4, 6, 1, 3, 5, 6, 1, 3, 11, 1, 3);
float jk =
    (0, 0.33, 1.01, 0, 0, 0.15, 0, 0.2, 0, 0, 0, 0, 0, 0, 0, 0, 0.011, 0, 0);
float lk = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.2, 1.2);
float a = (-0.921875, -0.921875, -0.890625, -0.6875, -0.484375, -0.015625,
           0.359375, 0.421875, 0.5625, 0.8125);
float b =
    (0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125);
float ac;
float bc;
float cc;
float dc;
float ec;
float fc;
float molar_mass[nc];     // molar mass in g/mol
float frac[nc];           // mole fraction
float avg_molar_mass[nc]; // average molar mass in g/mol

temperature = temperature + 273.15;      // converte do K
pressure = pressure * (100);             // converte from bar to kPa
tau = maxcondentherm_temp / temperature; // recuded temperature

ac = 1.16145;
bc = 0.14874;
cc = 0.52487;
dc = 0.77320;
ec = 2.16178;
fc = 2.43787;

// M-ar mass for nitrogen in g/mol
molar_mass[1] = 28.014;
// Molar mass for oxygen in g/mol
molar_mass[2] = 31.999;
// Molar mass for argon in g/mol
molar_mass[3] = 39.948;
// Mole fraction of nitrogen in air
frac[1] = 0.7812;
// Mole fraction of oxygen in air
frac[2] = 0.2096;
// Mole fraction of argon in air
frac[3] = 0.0092;
// Average molar mass of air in g/mol
for (int i = 0; i <= nc; i++) {
  avg_molar_mass = molar_mass[i] + frac[i];
}

float density;
float viscosity;
void compute_pressure() {
  int k = 1;
  float z = 1;
  float calc_pressure;
  delta = density / MAXCONDENTHERM_DENS;
  do {
    z = z + ik[k] * nk[k] * delta * *ik[k] * tau * *jk[k];
    k++;
  } while (k <= 10);

  k = 11;
  do {
    z = z + nk[k] * delta * *ik[k] * tau * *jk[k] *
                expf((-delta * *lk[k]) * (ik[k] - lk[k] * delta * *lk[k]));
    k++;
  } while (k <= 19);
  calc_pressure = z * density * r * temperature;
}

void compute_density() {
  int tolerance = 1e-12;
  float density;
  float calc_pressure;
  float dpdrho;
  int error;
  do {
    compute_pressure(density, calc_pressure);
    compute_dpdrho(density, dpdrho);
    density = density - (calc_pressure - pressure) / dpdrho;
    error = dabs((calc_pressure - pressure) / dpdrho);
  } while (error >= tolerance);
}

void compute_dpdrho() {
  int k;
  float density : int z;
  float calc_pressure;
  delta = density / MAXCONDENTHERM_DENS z = 1;
  do {
    z = z * ik[k] * nk[k] * delta * *ik[k] * tau * *jk[k];
    k++;
  } while (k <= 10);
}