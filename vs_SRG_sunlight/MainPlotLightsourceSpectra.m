%% script for the analysis of measured spectral solar simulator data
% Note: The measueremnts were preformed with respect to a calibration lamp
% to obtain absolut irradiance values.

%%% load data
load AbsSpectra.mat
LightSourcePercentageIndex = [0 2 3 5 7 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100];

t = (0:(1/60):24)'; % time in h
t2 = t*3600; % time for integrations over seconds instead of hours

load WorldAv %load the array with sun spectrum data
load XValuesSpectrum %... and corresponding wavelength values


%% plot measured 100% spectrum against sun spectrum at 1 sun and at world average
abs100 = AbsSpectra(:,2,length(LightSourcePercentageIndex));
wl = AbsSpectra(:,1,length(LightSourcePercentageIndex));
Titel = 'solar spectrum vs solar simulator'; Filename = [Titel '.jpg'];
Xlabel = 'wavelength in nm';
Ylabel1 = 'absolute irradience in W/m²/nm';
FontSize = 12;

abs2 = abs100 .*10000 .*1E-6; %unit conversion
SunFact = 1 /167.1916 *1000; % Conversion factor from world average sun intensity to 1 sun (1000 W/m²/nm)

%plot
figure
    plot(XValuesSpectrum,WorldAv,XValuesSpectrum,WorldAv *SunFact,wl,abs2,'LineWidth',2);
    ylabel(Ylabel1) % label left y-axis
    legend('world average sun','perfect solar simulator','Own LED simulator measured');
title(Titel,'FontSize',FontSize); xlabel(Xlabel,'FontSize',FontSize);
xlim([350 800]);

%draw vertical lines at 420nm and 700nm
yL = get(gca,'YLim');
line([420 420],yL,'Color','k');
line([700 700],yL,'Color','k');

saveas(gca,Filename,'jpg');
clear Titel Xlabel Ylabel Filename handle

    
