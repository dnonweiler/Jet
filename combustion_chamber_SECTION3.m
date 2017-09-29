function [q, cp_prod, k_prod, rho4] = combustion_chamber_SECTION3(T3, T2, AFAFs, T4, P4)
%Calculate heat produced in combustion chamber per kmol of diesel
%C14.4H24.9 + (AF/AFs) 20.625 (O2 + 3.76 N2)
	%? 14.4 CO2 + 12.45 H2O + (AF/AFs -1) 20.625 O2 + (AF/AFs) 77.55 N2
v_diesel = 1;
v_O2r = AFAFs*20.625;
v_N2r = AFAFs*20.625*3.76;
v_CO2 = 14.4;
v_H2O = 12.45;
v_O2p = (AFAFs-1)*20.625;
v_N2p = AFAFs*77.55;

%enthalpies of formation in kJ/kmol at 25 deg C
%reactants:
hof_diesel = -174000;
%products:
hof_CO2 = -393522;
hof_H2O = -241826;

%delta h of reactants and products relative to 25 deg C
%assuming diesel enters at 25 deg C
[deltah_H2Or, deltah_O2r, deltah_N2r, deltah_CO2r] = delta_h_CALC(T2);
[deltah_H2Op, deltah_O2p, deltah_N2p, deltah_CO2p] = delta_h_CALC(T3);

H_r = v_diesel*hof_diesel + v_O2r*deltah_O2r + v_N2r*deltah_N2r;
H_p = v_CO2*hof_CO2 + v_H2O*hof_H2O + v_CO2*deltah_CO2p + v_H2O*deltah_H2Op + v_O2p*deltah_O2p + v_N2p*deltah_N2p;

%heat produced, in kJ/kmol of diesel
q = H_p-H_r;

%Calculate cp (kJ/kgK) and k of product mixture
[cp_prod, k_prod] = cpk_CALC(T3, v_CO2, v_H2O, v_N2p, v_O2p);

%Calculate density
[rho4] = density_CALC (T4, P4, v_CO2, v_H2O, v_N2p, v_O2p);
