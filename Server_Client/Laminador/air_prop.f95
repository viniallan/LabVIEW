!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Code to compute density and viscosity of air as function of         !
! temperature and pressure                                            !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! University of Campinas                                              !
! School of Chemical Engineering                                      !
! Luís Fernando Mercier Franco                                        !
! Date: April 16th, 2023                                              !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! References:                                                         !
!                                                                     !
!           [1] Lemmon, EW, Jacobsen, RT, Penoncello, SG, Friend, DG, !
!           "Thermodynamic properties of air and mixtures of nitrogen,!
!           argon and oxygen from 60 to 2000 K at pressures to 2000   !
!           MPa", J. Phys. Chem. Ref. Data, 29, 331-385, 2009         ! 
!                                                                     !
!           [2] Poling, BE, Prausnitz, JM, O'Connell, JP,             !
!           "The properties of gases and liquids", 5 ed, New York:    !
!           McGraw-Hill, 2001                                         !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

module globalvar
        implicit none
        ! Number of compounds
        integer*8, parameter :: nc = 3
        ! Avogadro's number (1/mol)
        real*8, parameter    :: avogadro            = 6.0221409d23
        ! Boltzmann constant (J/K)
        real*8, parameter    :: boltzmann           = 1.38064852d-23
        ! Universal gas constant (J/mol/K)
        real*8, parameter    :: r                   = avogadro*boltzmann
        ! Maxcondentherm temperature for air (K)
        real*8, parameter    :: maxcondentherm_temp = 132.6312d0 
        ! Maxcondentherm density for air (mol/dm³)
        real*8, parameter    :: maxcondentherm_dens = 10.4477d0
        ! Reduced density
        real*8               :: delta
        ! Temperature in K
        real*8               :: temperature
        ! Pressure in Pa
        real*8               :: pressure
        ! Reduced temperature
        real*8               :: tau
        real*8               :: nk(19)
        real*8               :: ik(19)
        real*8               :: jk(19)
        real*8               :: lk(19)
        real*8               :: a(10)
        real*8               :: b(10)
        real*8               :: ac
        real*8               :: bc
        real*8               :: cc
        real*8               :: dc
        real*8               :: ec
        real*8               :: fc
        ! Molar mass in g/mol
        real*8               :: molar_mass(nc)
        ! Mole fraction
        real*8               :: frac(nc)
        ! Average molar mass in g/mol
        real*8               :: avg_molar_mass

        contains
                subroutine init_var()
                        implicit none

                        ! Reading temperature in oC and pressure in bar
                        read(*,*) temperature,pressure

                        ! Converting temperature from oC to K
                        temperature = temperature+273.15d0

                        ! Converting pressure from bar to kPa
                        pressure    = pressure*1.d2

                        ! Reduced temperature
                        tau         = maxcondentherm_temp/temperature

                        nk(1)  = 0.118160747229d0
                        nk(2)  = 0.713116392079d0
                        nk(3)  = -0.161824192067d1
                        nk(4)  = 0.714140178971d-1
                        nk(5)  = -0.865421396646d-1
                        nk(6)  = 0.134211176704d0
                        nk(7)  = 0.112626704218d-1
                        nk(8)  = -0.420533228842d-1
                        nk(9)  = 0.349008431982d-1
                        nk(10) = 0.164957183186d-3
                        nk(11) = -0.101365037912d0
                        nk(12) = -0.173813690970d0
                        nk(13) = -0.472103183731d-1
                        nk(14) = -0.122523554253d-1
                        nk(15) = -0.146629609713d0
                        nk(16) = -0.316055879821d-1
                        nk(17) = 0.233594806142d-3
                        nk(18) = 0.148287891978d-1
                        nk(19) = -0.938782884667d-2

                        ik(1)  = 1.d0
                        ik(2)  = 1.d0
                        ik(3)  = 1.d0
                        ik(4)  = 2.d0
                        ik(5)  = 3.d0
                        ik(6)  = 3.d0
                        ik(7)  = 4.d0
                        ik(8)  = 4.d0
                        ik(9)  = 4.d0
                        ik(10) = 6.d0
                        ik(11) = 1.d0
                        ik(12) = 3.d0
                        ik(13) = 5.d0
                        ik(14) = 6.d0
                        ik(15) = 1.d0
                        ik(16) = 3.d0
                        ik(17) = 11.d0
                        ik(18) = 1.d0
                        ik(19) = 3.d0

                        jk(1)  = 0.d0
                        jk(2)  = 0.33d0
                        jk(3)  = 1.01d0
                        jk(4)  = 0.d0 
                        jk(5)  = 0.d0 
                        jk(6)  = 0.15d0 
                        jk(7)  = 0.0d0 
                        jk(8)  = 0.2d0 
                        jk(9)  = 0.35d0 
                        jk(10) = 1.35d0 
                        jk(11) = 1.6d0 
                        jk(12) = 0.8d0 
                        jk(13) = 0.95d0 
                        jk(14) = 1.25d0 
                        jk(15) = 3.6d0 
                        jk(16) = 6.d0 
                        jk(17) = 3.25d0 
                        jk(18) = 3.5d0 
                        jk(19) = 15.d0 

                        lk(1)  = 0.d0
                        lk(2)  = 0.d0
                        lk(3)  = 0.d0
                        lk(4)  = 0.d0
                        lk(5)  = 0.d0
                        lk(6)  = 0.d0
                        lk(7)  = 0.d0
                        lk(8)  = 0.d0
                        lk(9)  = 0.d0
                        lk(10) = 0.d0
                        lk(11) = 1.d0
                        lk(12) = 1.d0
                        lk(13) = 1.d0
                        lk(14) = 1.d0
                        lk(15) = 2.d0
                        lk(16) = 2.d0
                        lk(17) = 2.d0
                        lk(18) = 3.d0
                        lk(19) = 3.d0

                        a(1)   = 6.324d0
                        a(2)   = 1.210d-3
                        a(3)   = 5.283d0
                        a(4)   = 6.623d0
                        a(5)   = 19.745d0
                        a(6)   = -1.9d0
                        a(7)   = 24.275
                        a(8)   = 0.7972
                        a(9)   = -0.2382
                        a(10)  = 0.06863
                        b(1)   = 50.412
                        b(2)   = -1.154d-3
                        b(3)   = 254.209d0
                        b(4)   = 38.096d0
                        b(5)   = 7.630d0
                        b(6)   = -12.537d0
                        b(7)   = 3.450d0
                        b(8)   = 1.117
                        b(9)   = 0.0677d0
                        b(10)  = 0.3479d0

                        ac     = 1.16145d0
                        bc     = 0.14874d0
                        cc     = 0.52487d0 
                        dc     = 0.77320d0 
                        ec     = 2.16178d0 
                        fc     = 2.43787d0 

                        ! Molar mass for nitrogen in g/mol
                        molar_mass(1) = 28.014d0
                        ! Molar mass for oxygen in g/mol
                        molar_mass(2) = 31.999d0 
                        ! Molar mass for argon in g/mol
                        molar_mass(3) = 39.948d0
                        ! Mole fraction of nitrogen in air
                        frac(1)       = 0.7812d0 
                        ! Mole fraction of oxygen in air
                        frac(2)       = 0.2096d0
                        ! Mole fraction of argon in air
                        frac(3)       = 0.0092d0
                        ! Average molar mass of air in g/mol
                        avg_molar_mass = sum(frac(:)*molar_mass(:))

                end subroutine init_var

end module globalvar


program air_prop
        use globalvar
        implicit none
        real*8 :: density
        real*8 :: viscosity

        call init_var()

        call compute_density(density)
        
        write(*,*) 'Temperature = ',temperature,'K'
        write(*,*) 'Pressure    = ',pressure*1.d-2,'bar'
        write(*,*) 'Density     = ',density*avg_molar_mass,'kg/m³'

        call compute_viscosity(density,viscosity)

        write(*,*) 'Viscosity   = ',viscosity/10.d0,'muPa.s'

end program air_prop

subroutine compute_density(density)
        use globalvar
        implicit none
        real*8, parameter :: tolerance = 1.d-12
        real*8            :: density
        real*8            :: calc_pressure
        real*8            :: dpdrho
        real*8            :: error

        ! Initial guess for density: ideal gas law
        density = pressure/(r*temperature)
        error   = 1.d0
        do while (error >= tolerance)
           call compute_pressure(density,calc_pressure)
           call compute_dpdrho(density,dpdrho)
           ! Newton-Raphson method
           density = density-(calc_pressure-pressure)/dpdrho
           error   = dabs((calc_pressure-pressure)/dpdrho)
        end do

end subroutine compute_density

subroutine compute_pressure(density,calc_pressure)
        use globalvar
        implicit none
        integer*8 :: k
        real*8    :: density
        real*8    :: z
        real*8    :: calc_pressure 

        delta = density/maxcondentherm_dens
        ! Eqs. (27) and (50), Ref. [1]
        z = 1.d0
        do k=1,10
           z = z+ik(k)*nk(k)*delta**ik(k)*tau**jk(k)
        end do
        do k=11,19
           z = z+nk(k)*delta**ik(k)*tau**jk(k)                         &
               *dexp(-delta**lk(k))*(ik(k)-lk(k)*delta**lk(k))
        end do
        calc_pressure = z*density*r*temperature

end subroutine compute_pressure

subroutine compute_dpdrho(density,dpdrho)
        use globalvar
        implicit none
        integer*8 :: k
        real*8    :: density
        real*8    :: term1
        real*8    :: term2
        real*8    :: dpdrho

        delta = density/maxcondentherm_dens
        ! Eqs. (27) and (50), Ref. [1]
        term1 = 0.d0
        do k=1,10
           term1 = term1+ik(k)*nk(k)*delta**ik(k)*tau**jk(k)
        end do
        do k=11,19
           term1 = term1+nk(k)*delta**ik(k)*tau**jk(k)                 &
                   *dexp(-delta**lk(k))*(ik(k)-lk(k)*delta**lk(k))
        end do

        ! Eq. (51), Ref. [1]
        term2 = 0.d0
        do k=1,10
           term2 = term2+ik(k)*(ik(k)-1.d0)*nk(k)*delta**ik(k)         &
                   *tau**jk(k)
        end do
        do k=11,19
           term2 = term2+nk(k)*delta**ik(k)*tau**jk(k)                 &
                   *dexp(-delta**lk(k))*((ik(k)-lk(k)*delta**lk(k))    &
                   *(ik(k)-1.d0-lk(k)*delta**lk(k))                    &
                   -lk(k)**2.d0*delta**lk(k))
        end do

        dpdrho = r*temperature*(1.d0+2.d0*term1+term2)
        
end subroutine compute_dpdrho

subroutine compute_viscosity(density,viscosity)
        use globalvar
        implicit none
        integer*8            :: i
        integer*8            :: j
        real*8               :: density
        real*8               :: crit_vol(nc)
        real*8               :: crit_temp(nc)
        real*8               :: omega_k(nc)
        real*8               :: omega_ij(nc,nc)
        real*8               :: mass_ij(nc,nc)
        real*8               :: sigma_k(nc)
        real*8               :: sigma_ij(nc,nc)
        real*8               :: eps_k(nc)
        real*8               :: eps_ij(nc,nc)
        real*8               :: sigma_mix
        real*8               :: eps_mix
        real*8               :: mass_mix
        real*8               :: omega_mix
        real*8               :: fcm
        real*8               :: vcm
        real*8               :: tcm
        real*8               :: e_factor(10)
        real*8               :: y
        real*8               :: g1
        real*8               :: g2
        real*8               :: collision
        real*8               :: t_star
        real*8               :: eta_star
        real*8               :: eta_star_star
        real*8               :: viscosity

        ! Critical molar volume for nitrogen in cm³/mol
        crit_vol(1)   = 90.10d0 
        ! Critical molar volume for oxygen in cm³/mol
        crit_vol(2)   = 73.37d0 
        ! Critical molar volume for argon in cm³/mol
        crit_vol(3)   = 74.57d0 
        ! Critical temperature for nitrogen in K
        crit_temp(1)  = 126.2d0 
        ! Critical temperature for oxygen in K
        crit_temp(2)  = 154.58d0
        ! Critical temperature for argon in K
        crit_temp(3)  = 150.86d0
        ! Acentric factor for nitrogen
        omega_k(1)    = 0.037d0 
        ! Acentric factor for oxygen
        omega_k(2)    = 0.d0
        ! Acentric factor for argon
        omega_k(3)    = -0.002d0

        ! Eq. 9-5.32, Ref. [2]
        sigma_k(:) = 0.809d0*crit_vol(:)**(1.d0/3.d0)
        do i=1,nc
           do j=1,nc
              ! Eq. 9-5.33
              sigma_ij(i,j) = dsqrt(sigma_k(i)*sigma_k(j))
           end do
        end do
 
        ! Eq. 9-5.34, Ref. [2]
        eps_k(:) = crit_temp(:)/1.2593d0
        do i=1,nc
           do j=1,nc
              ! Eq. 9-5.35, Ref. [2]
              eps_ij(i,j) = dsqrt(eps_k(i)*eps_k(j))
           end do
        end do

        do i=1,nc
           do j=1,nc
              ! Eq. 9-5.37, Ref. [2]
              omega_ij(i,j) = 0.5d0*(omega_k(i)+omega_k(j))
           end do
        end do

        do i=1,nc
           do j=1,nc
              ! Eq. 9-5.39, Ref. [2]
              mass_ij(i,j) = 2.d0*(molar_mass(i)*molar_mass(j))        &
                             /(molar_mass(i)+molar_mass(j))
           end do
        end do

        ! Eq. 9-5.25, Ref. [2]
        sigma_mix = 0.d0
        do i=1,nc
           do j=1,nc
              sigma_mix = sigma_mix+frac(i)*frac(j)*sigma_ij(i,j)**3.d0
           end do
        end do
        sigma_mix = (sigma_mix)**(1.d0/3.d0)

        ! Eq. 9-5.27, Ref. [2]
        eps_mix = 0.d0
        do i=1,nc
           do j=1,nc
              eps_mix = eps_mix+frac(i)*frac(j)*eps_ij(i,j)            &
                        *sigma_ij(i,j)**3.d0
           end do
        end do
        eps_mix = eps_mix/sigma_mix**3.d0

        ! Eq. 9-5.28, Ref. [2]
        mass_mix = 0.d0
        do i=1,nc
           do j=1,nc
              mass_mix = mass_mix+frac(i)*frac(j)*eps_ij(i,j)          &
                        *sigma_ij(i,j)**2.d0*dsqrt(mass_ij(i,j))
           end do
        end do
        mass_mix = (mass_mix/eps_mix/sigma_mix**2.d0)**2.d0

        ! Eq. 9-5.29, Ref. [2]
        omega_mix = 0.d0
        do i=1,nc
           do j=1,nc
              omega_mix = omega_mix+frac(i)*frac(j)*omega_ij(i,j)      &
                          *sigma_ij(i,j)**3.d0
           end do
        end do
        omega_mix = omega_mix/sigma_mix**3.d0

        ! Eq. 9-5.41, Ref. [2]
        fcm = 1.d0-0.275d0*omega_mix

        ! Eq. 9-5.43, Ref. [2]
        vcm = (sigma_mix/0.809d0)**3.d0

        ! Eq. 9-5.44, Ref. [2]
        tcm = 1.2593d0*eps_mix

        ! Table 9-6, Ref. [2]
        e_factor(:) = a(:)+b(:)*omega_mix

        ! Eq. 9-6.20, Ref. [2] 
        y             = 1.d-3*density*vcm/6.d0
        ! Eq. 9-6.21, Ref. [2]
        g1            = (1.d0-0.5d0*y)/(1.d0-y)**3.d0
        ! Eq. 9-6.22, Ref. [2]
        g2            = (e_factor(1)*(1.d0-dexp(-e_factor(4)*y))/y     &
                        +e_factor(2)*g1*dexp(e_factor(5)*y)            &
                        +e_factor(3)*g1)                               &
                        /(e_factor(1)*e_factor(4)                      &
                        +e_factor(2)+e_factor(3))

        ! Eq. 9-5.26, Ref. [2]
        t_star        = temperature/eps_mix

        ! Eq. 9-6.23, Ref. [2]
        eta_star_star = e_factor(7)*y**2.d0*g2*dexp(e_factor(8)        &
                        +e_factor(9)/t_star+e_factor(10)/t_star**2.d0)
        
        ! Eq. 9-4.3, Ref. [2]
        collision     = ac*t_star**(-bc)+cc*dexp(-dc*t_star)           &
                        +ec*dexp(-fc*t_star)

        ! Eq. 9-6.19, Ref. [2]
        eta_star      = dsqrt(t_star)*(fcm*(1.d0/g2+e_factor(6)*y))    &
                        /collision+eta_star_star

        ! Eq. 9-6.18, Ref. [2]
        viscosity     = 36.344d0*eta_star*dsqrt(mass_mix*tcm)          &
                        /vcm**(2.d0/3.d0)

end subroutine compute_viscosity
