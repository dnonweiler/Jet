%Temps in K, Area in m^2, mdot in kg/s

%turbocharger#= [1 Tmax K, 2 pressratio, 3 mdotair kg/s, 4 A_inlet sq m, 5 Pambient Pa, 6 Tambient K];
turbocharger1 = [973.15, 2, 0.3629, 0.0023, 101325, 293.15]; %T04B
turbochargers = [turbocharger1];

for i = 1:1
    Tmax = turbochargers(i,1);
    pressratio = turbochargers(i,2);
    mdotair = turbochargers(i,3);
    A_inlet = turbochargers(i,4);
    P1 = turbochargers(i,5);
    T1 = turbochargers(i,6);
end

    AF_list = [];
    Thrust_list = [];
    m_fuel_list = [];
    v_5_list = [];
    TSFC_list = [];

    for AFAFs = 1:.1:5
%% State 1 - Ambient Conditions
    %Defined as input

%% State 2 - Compressor
        k_air = 1.4;
        cp_air = 1.004;
        [T2, P2, w12] = compressor_SECTION2(k_air, cp_air, P1, T1, pressratio);


%% State 3 - Combustion
        T3 = Tmax;
        w34 = w12;
        P3 = P2;
        v_CO2 = 14.4;
        v_H2O = 12.45;
        v_O2p = (AFAFs-1)*20.625;
        v_N2p = AFAFs*77.55;
        [cp_prod, k_prod] = cpk_CALC(T3, v_CO2, v_H2O, v_N2p, v_O2p);

%% State 4 - Nozzle
        T4 = T3 - w34/cp_prod;
        P4 = isoentropic_P_T_CALC(P3, T3, [], T4, k_prod);
        [rho4] = density_CALC (T4, P4, v_CO2, v_H2O, v_N2p, v_O2p);
        AFs = 20.625;
        AF = AFs * AFAFs;
        mdotfuel = mdotair/28.97/AF*198.06;
        [AF,Thrust,m_fuel,NTSC,v_5] = convergent_nozzle_SECTION4(cp_prod, k_prod, T4, P4, mdotair, mdotfuel, rho4, A_inlet, AF);
        AF_list = [AF_list AF];
        Thrust_list = [Thrust_list Thrust];
        m_fuel_list = [m_fuel_list m_fuel];
        v_5_list = [v_5_list v_5];
        TSFC_list = [TSFC_list NTSC];
    end

%% Results - PLOTS
    percent_ta=100*AF_list/AFs;

    Table1=table(percent_ta',Thrust_list',m_fuel_list');
    Table1.Properties.VariableNames = {'Percent_ta' 'Thrust' 'm_dot_fuel'};
    %writetable(Table1);
clf
    figure('Name', strcat('Turbocharger', num2str(i), ' Results'))
    subplot(1,2,1);
    plot(percent_ta,Thrust_list);
        title('Percent Theoretical Air vs Thrust');
        xlabel('%ta');
        ylabel('Thrust (N)');
    subplot(1,2,2);
    plot(percent_ta, TSFC_list);
        title('Percent Theoretical Air vs TSFC');
        ylabel('TSFC (kg/N*s)');
        xlabel('%ta');
