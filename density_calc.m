function [rho4] = density_CALC (T4, P4, v_CO2, v_H2O, v_N2p, v_O2p)
Pstp = 100000;
Tstp = 25+273.15;
rho_CO2_stp = 1.775;
rho_H2O_stp = .0231;
rho_N2_stp = 1.13;
rho_O2_stp = 1.292;
rho_CO2p = rho_CO2_stp*P4*Tstp/Pstp/T4;
rho_H2Op = rho_H2O_stp*P4*Tstp/Pstp/T4;
rho_N2p = rho_N2_stp*P4*Tstp/Pstp/T4;
rho_O2p = rho_O2_stp*P4*Tstp/Pstp/T4;
totalmoles = v_CO2+v_H2O + v_N2p + v_O2p;
rho4 = (rho_CO2p*v_CO2 + rho_H2Op*v_H2O + rho_N2p*v_N2p + rho_O2p*v_O2p)/totalmoles;
