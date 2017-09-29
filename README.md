# Jet
coded in Objective C++

\\Run "MAIN.m" in MatLab//




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

Any questions???
