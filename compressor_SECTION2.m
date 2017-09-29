function [T2, P2, w12] = compressor_SECTION2(k_air, cp_air, P1, T1, P2, pressratio, T2)


T2 = isoentropic_P_T_CALC(P1, T1, P2, [], k_air);
P2 = pressratio*P1;
w12 = cp_air*(T2-T1);
