import math
import numpy as np 

# Função main 
def air_prop():
 
#definição das variáveis 
   nc = 3
   AVOGRADO = 6.0221409e23         # 1/mol
   BOLTZMANN = 1.38064852e-23      # J/K
   r = AVOGRADO *BOLTZMANN         # J/mol/K
   MAXCONDENTHERM_TEMP = 132.6312  # 10.4477
   MAXCONDENTHERM_DENS = 10.4477   # 10.4477
   delta = float()       # reduced density
   temperature = float() # Temperatura in K
   pressure = float()    # pressure em Pa
   tau = float()
   
   nk = [0.118160747229, 0.713116392079, -1.61824192067, 0.0714140178971, -0.0865421396646, 0.134211176704, 0.0112626704218, -0.0420533228842, 0.0349008431982, 0.000164957183186, -0.101365037912, -0.17381369097, -0.0472103183731, -0.0122523554253, -0.146629609713, -0.0316055879821, 0.000233594806142, 0.0148287891978, -0.00938782884667]
   ik = [1, 1, 1, 2, 3, 3, 4, 4, 4, 6, 1, 3, 5, 6, 1, 3, 11, 1, 3]
   jk = [0, 0.33, 1.01, 0, 0, 0.15, 0, 0.2, 0, 0, 0, 0, 0, 0, 0, 0, 0.011, 0, 0]
   lk = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.2, 1.2]
   a = [-0.921875, -0.921875, -0.890625, -0.6875, -0.484375, -0.015625, 0.359375, 0.421875, 0.5625, 0.8125]
   b = [0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125]
   
   molar_mass = list(range(nc))     # molar mass in g/mol
   frac = list(range(nc))           # mole fraction
   avg_molar_mass = float() 	    # average molar mass in g/mol
 
   temperature = temperature + 273.15      # converte do K
   pressure = pressure * (100)             # converte from bar to kPa
   tau = MAXCONDENTHERM_TEMP / temperature # recuded temperature
 
   ac = 1.16145
   bc = 0.14874
   cc = 0.52487
   dc = 0.77320
   ec = 2.16178
   fc = 2.43787
 
   # M-ar mass for nitrogen in g/mol
   molar_mass[1] = 28.014
   # Molar mass for oxygen in g/mol
   molar_mass[2] = 31.999
   # Molar mass for argon in g/mol
   molar_mass[3] = 39.948
   # Mole fraction of nitrogen in air
   frac[1] = 0.7812
   # Mole fraction of oxygen in air
   frac[2] = 0.2096
   # Mole fraction of argon in air
   frac[3] = 0.0092
   # Average molar mass of air in g/mol
   avg_molar_mass = sum(molar_mass[:]*frac[:])   
   density = float()
   viscosity = float()

   compute_density(density)

   print ("Temperature" = temperature, "K")
   print ("Pressure" = pressure*(1*(10**-2)), "bar")
   print ("Density" = density*avg_molar_mass, "kg/m³")

   compute_viscosity(density,viscosity)
 
   print("Viscosity" = viscosity/10.0, "muPa.s") 
  
   return temperature , pressure , density , viscosity 


############################################################################################################################

def compute_density(density):
   tolerance = 1e-12
   density = float()
   calc_pressure = float()
   dpdrho = float()
   error = int()
   density = pressure/(r*tolerance)
   error = 1 
   while error >= tolerance :
      compute_pressure(density, calc_pressure)
      compute_dpdrho(density, dpdrho)
      density = density - (calc_pressure - pressure) / dpdrho
      error = abs((calc_pressure - pressure) / dpdrho)
   return density

############################################################################################################################

def compute_pressure(density,calc_pressure): 
   k = 1
   z = float(1)
   calc_pressure = float()
   delta = density / MAXCONDENTHERM_DENS
   while k <= 10 : 
      z = z + ik[k] * nk[k] * delta **ik[k] * tau**jk[k] 
      k += 1 

   k = 11;
   while k <= 19 :
      z = z + nk[k] * delta ** ik[k] * tau ** jk[k] * math.exp((-delta **lk[k]) * (ik[k] - lk[k] * delta **lk[k]))
      k += 1 
   pressure = z * density * r * temperature
   return pressure

############################################################################################################################

def compute_dpdrho(density,dpdrho):
  k = int()
  density = float()
  calc_pressure = float()
  delta = density / MAXCONDENTHERM_DENS
  term 1 = 0 
  while k <= 10 :
     term1 = term1+nk[k]*delta**ik[k]*tau**jk[k]*math.exp(-delta**lk[k])*(ik[k]-lk[k]*delta**lk[k])
     k += 1 
   
   k = 11
   while k <= 19 : 
      term1 = term1+nk[k]*delta**ik[k]*tau**jk[k]*math.exp(-delta**lk[k])*(ik[k]-lk[k]*delta**lk[k])
      k += 1

   term2 = 0 
   k = 0 
   while k <= 10 :
      term2 = term2+ik[k]*(ik[k]-1.0)*nk[k]*delta**ik[k]*tau**jk[k]
      k += 1 

   k = 11 
   while k <= 19 :
      term2 = term2+nk[k]*delta**ik[k]*tau**jk[k]*math.exp(-delta**lk[k])*((ik[k]-lk[k]*delta**lk[k])*(ik[k]-1.0-lk[k]*delta**lk[k])-lk[k]**2.0*delta**lk[k])

   dpdrho = r*temperature*(1.0+2.0*term1+term2)
   return dpdrho 

############################################################################################################################

def compute_viscosity(density,viscosity) :
   i = int()
   j = int()
   density = float()
   crit_vol = list(range(nc))
   crit_temp = list(range(nc))
   omega_k = list(range(nc))
   omega_ij = np.array([[np.empty((nc, nc)) for _ in range(2)] , [np.empty((nc, nc)) fpr _ in range(2)]])
   mass_ij = np.array([[np.empty((nc, nc)) for _ in range(2)] , [np.empty((nc, nc)) fpr _ in range(2)]])
   sigma_k = list(range(nc))
   sigma_ij = np.array([[np.empty((nc, nc)) for _ in range(2)] , [np.empty((nc, nc)) fpr _ in range(2)]])
   eps_k = list(range(nc))
   eps_ij = np.array([[np.empty((nc, nc)) for _ in range(2)] , [np.empty((nc, nc)) fpr _ in range(2)]])
   sigma_mix = float()
   eps_mix = float()
   mass_mix = float()
   omega_mix = float()
   fcm = float()
   vcm = float()
   tcm = float()
   e_factor = list(range(10)) 
   y = float()
   g1 = float()
   g2 = float()
   collision = float()
   t_star = float()
   eta_star = float()
   eta_star_star = float()
   viscosity = float()

   #Critical molar volume for nitrogen in cm³/mol
   crit_vol[1]   = 90.10
   #Critical molar volume for oxygen in cm³/mol
   crit_vol[2]   = 73.37
   #Critical molar volume for argon in cm³/mol
   crit_vol[3]   = 74.57
   #Critical temperature for nitrogen in K
   crit_temp[1]  = 126.2
   #Critical temperature for oxygen in K
   crit_temp[2]  = 154.58
   #Critical temperature for argon in K
   crit_temp[3]  = 150.86
   #Acentric factor for nitrogen  
   omega_k[1]    = 0.037
   #Acentric factor for oxygen
   omega_k[2]    = 0.0
   #Acentric factor for argon
   omega_k[3]    = -0.002
   
   sigma_k[:] = 0.809d0*crit_vol[:]**(1.0/3.0)
   i = 1 
   while 1 <= nc :
      j = 1 
      while j <= nc : 
         sigma_ij[i][j] = math.sqrt(sigma_k[i]*sigma_k[j])
         j += 1
      i +=1

   eps_k[:] = crit_temp[:]/1.2593
   i = 1 
   while i <= nc : 
      j = 1 
      while j <= nc : 
          eps_ij[i][j] = math.sqrt(eps_k[i]*eps_k[j])
          j += 1 
      i += 1 

   i = 1 
   while 1 <= nc :
      j = 1 
      while j <= nc : 
         omega_ij[i][j] = 0.5*(omega_k[i]*omega_k[j])
         j += 1
      i +=1

   i = 1 
   while 1 <= nc :
      j = 1 
      while j <= nc : 
         mass_ij[i][j] = 2.0*(molar_mass[i]*molar_mass[j])/(molar_mass[i]+molar_mass[j])
         j += 1
      i +=1

   sigma_mix = 0.0
   i = 1 
   while i <= nc : 
      j = 1 
      while j <= nc : 
          sigma_mix = sigma_mix+frac[i]*frac[j]*sigma_ij[i][j]**3.0
          j += 1 
      i += 1 
   sigma_mix = sigma_mix**(1.0/3.0)

   eps_mix = 0.0
   i = 1 
   while i <= nc : 
      j = 1 
      while j <= nc : 
          eps_mix = eps_mix+frac[i]*frac[j]*eps_ij[i][j]*sigma_ij[i][j]**3.0
          j += 1 
      i += 1 
   eps_mix = eps_mix/sigma_mix**3.0

   mass_mix = 0.0
   i = 1 
   while i <= nc : 
      j = 1 
      while j <= nc : 
          mass_mix = mass_mix+frac[i]*frac[j]*eps_ij[i][j]*sigma_ij[i][j]**2.0*math.sqrt(mass_ij[i][j])
          j += 1 
      i += 1 
   mass_mix = (mass_mix/eps_mix/sigma_mix**2.0)**2.0

   omega_mix = 0.0
   i = 1 
   while i <= nc : 
      j = 1 
      while j <= nc : 
          omega_mix = omega_mix+frac[i]*frac[j]*omega_ij[i][j]*sigma_ij[i][j]**3.0
          j += 1 
      i += 1 
   omega_mix = omega_mix/sigma_mix**3.0

   fcm = 1.0-0.275*omega_mix
   
   vcm = (sigma_mix/0.809)**3.0
   
   tcm = 1.2593*eps_mix

   e_factor[:] = a[:] + b[:]*omega_mix

   y = 1*(10**-3)*density*vcm/6.0

   g1 = (1.0 - 0.5*y)/(1.0-y)**3.0

   g2 = e_factor[1] * (1.0-math.exp(-e_factor[4] * y)) / y + e_factor[2] * g1 * math.exp(e_factor[5] * y) + e_factor[3] * g1)/(e_factor([1] * e_factor[4] + e_factor([2] + e_factor[3])

   t_star = temperature/eps_mix
   
   eta_star_star = e_factor[7]*y**2.0*g2*math.exp(e_factor[8]+e_factor[9]/t_star+e_factor[10]/t_star**2.0)

   collision = ac*t_star**(-bc)+cc*math.exp(-dc*t_star)+ec*math.exp(-fc*t_star)

   eta_star = math.sqrt(t_star)*(fcm*(1.0/g2+e_factor[6]*y))/collision+eta_star_star

   viscosity = 36.344*eta_star*math.sqrt(mass_mix*tcm)/vcm**(2.0/3.0)

   return viscosity

 ############################################################################################################################
