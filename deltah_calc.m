function [h_H2O, h_O2, h_N2, h_CO2] = deltah_CALC(temp)

%Difference in enthalpy with reference temperature (25 celcius)
%(Accurate from 298K to 1300K)

temps = [298, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300];
H2O = [0, 3450, 6922, 10499, 14190, 18002, 21937, 26000, 30190, 34506, 38941];
N2 = [0, 2971, 5911, 8894, 11937, 15046, 18223, 21463, 24760, 28109, 31503];
O2 = [0, 3027, 6086, 9245, 12499, 15836, 19241, 22703, 26212, 29761, 33345];
CO2 = [0, 4003, 8305, 12906, 17754, 22806, 28030, 33397, 38885, 44473, 50148];

h_H2O = interp1(temps,H2O,temp);
h_N2 = interp1(temps,N2,temp);
h_O2 = interp1(temps,O2,temp);
h_CO2 = interp1(temps,CO2,temp);
