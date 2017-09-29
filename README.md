# Jet
coded in Objective C++

\\Run "MAIN.m" in MatLab//


THIS ENGINE IS DESIGNED TO RUN ON DIESEL FUEL


Description of structure............

                    2 types of scripts: SECTIONs and CALCs

%%        1) MAIN calls sections                                               %%
%%        2) SECTIONs call CALCs                                               %%
%%        3) CALCs take user inputs from MAIN and lookup data in tables        %%

MAIN
     yeah I'm still trying to figure out wtf we did here

SECTIONs
     4 sections of the Jet Engine
       1) Intake
            Only inputs, no calculations -> no script
       2) Compressor      [NEED TO MAKE THIS ITS OWN SCRIPT?]
            Calls insoentropic_CALC
       3) Combustion Chamber
            Calls deltah_CALC
            Calls cpk_CALC
            Calls density_CALC
       4) Nozzle
            Calls isoentropic_P_T_CALC
CALCs
     4 calculators used in no particular order:
       1) isoentropic_P_T_CALC
            Uses equations from DOTS textbook
       2) deltah_CALC
            "delta h calc"
            This is a simple interpolation calculator pulling data from a chart in DOTS textbook
            Runs from 298K to 1300K
       3) density_CALC
            Gives density of combusted fuel+air mixutre (density at nozzle)
       4) cpk_CALC
            Uses lots of equations from DOTS textbook
            calculates cp_prod AND k_prod
                                                            ............end


Variables.........

[P] Pressure
[T] Temperature
  [Tmax] Maximum temperature in jet engine... this always occurs in section3
[m] Mass in kg
  [mdotair] Mass flow rate of air entering engine
  [mdotfuel] Mass flow rate of fuel
  [m_prod] Mass of air+mass of fuel
  [M] Molar mass in kg/mol
[A_inlet] Area of the jet engine inlet
[pressratio] Compression ratio of compressor
[AF] Air to fuel ratio
  [AFs] Stoichiometric air to fuel ratio
[w12] Work done from state 1 to 2
[rho4] Density of air+fuel at section4
[TSFC] Thrust specific fuel consumption (kg of fuel burned per N of thrust)
[v#] Velocity at section #
[NPR] Nozzle pressure ratio
[h] Enthalpy in units of J/kg
[R] Gas constant (kJ/kg-K)

I NEED TO LOOK UP:
[v_molecule]
[ci]
[cp]
[cv]
[k]
                                                        ............end

Any questions???


TO DO

check lines 4, 12 of nozzle




