function [cp_prod, k_prod] = cpk_calculator(T3, v_CO2, v_H2O, v_N2p, v_O2p)
%Calculate cp (kJ/kgK) of product mixture
%Calculate cp of each product - dependent on temp
theta = T3/1000;
cp_CO2 = 0.45+1.67*theta-1.27*theta^2+0.39*theta^3;
cp_H2O = 1.79+.107*theta+.586*theta^2-.2*theta^3;
cp_O2 = .88-.0001*theta+.54*theta^2-.33*theta^3;
cp_N2 = 1.11-.48*theta+.96*theta^2-.42*theta^3;
% GIVEN % molar mass in kg/kmol
M_CO2 = 44.01;
M_H2O = 18.015;
M_O2 = 15.999;
M_N2 = 28.013;
%Calculate mass concentration of each product
total = M_CO2*v_CO2 + M_H2O*v_H2O + M_N2*v_N2p + M_O2*v_O2p;
ci_CO2 = M_CO2*v_CO2/total;
ci_H2O = M_H2O*v_H2O/total;
ci_O2 = M_O2*v_O2p/total;
ci_N2 = M_N2*v_N2p/total;
cp_prod = ci_CO2*cp_CO2 + ci_H2O*cp_H2O + ci_O2*cp_O2 + ci_N2*cp_N2;

%Calculate k of product mixture
%k_mix = cp_prod/cv_prod = cp_prod/(cp_prod-R_prod) = cp_prod/(cp-R)prod

% GIVEN % R in kJ/kg-K
R_CO2 = .1889;
R_H2O = .4615;
R_O2 = .2598;
R_N2 = .2968;
cv_prod = ci_CO2*(cp_CO2-R_CO2) + ci_H2O*(cp_H2O-R_H2O) + ci_O2*(cp_O2-R_O2) + ci_N2*(cp_N2-R_N2);
k_prod = cp_prod/cv_prod;