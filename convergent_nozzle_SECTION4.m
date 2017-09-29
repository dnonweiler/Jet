function [AF,Thrust,m_fuel, TSFC, v_5] = convergent_nozzle_SECTION4(cp_prod,k_prod,T4,P4,m_air,m_fuel,rho_prod,A_intake, AF)

%Pa -- Patm -- subsonic exit conditions
P5 = 101325;
%Nozzle pressure ratio
NPR=P5/P4;

T5=isoentropic_P_T_CALC(P4,T4,P5,[],k_prod);

m_prod=m_air+m_fuel;

v_1=(m_prod)/(rho_prod*A_intake);
v_5=sqrt(-2*cp_prod*T5*(1-(1/NPR)^((k_prod-1)/k_prod)));
Thrust=-((m_prod*v_5)-(m_air*v_1));

%Thrust specific fuel consumption (kg/N)
TSFC=m_fuel/Thrust;

end
