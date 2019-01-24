%load the Wine Dataset already extracted from http://www.models.life.ku.dk/Wine_GCMS_FTIR
load('Wine_v7.mat')
%plot the Infrared Spectra
subplot(3,1,1)
plot(axis_spectra_wavenumber,IR_spectra)
Label_Wine_samples = categorical(strtok(Label_Wine_samples,'-')); % this removes unnecesary information and leaves the country name intact
IRData = table(cellstr(Label_Wine_samples),IR_spectra)

%Infrared wavenumber data is presented from higher wavenumber to lower wavenumber
set(gca,'Xdir','reverse')
%set the axis wavenumbers to fit the data
axis tight
%label the axes
xlabel('Wavenumber (cm^-^1)')
ylabel('Reflectance (AU)')
title('Wine Infrared Spectra')
legend(cellstr(Label_Wine_samples))
legend off
hold off
%Plot the GC data
subplot(3,1,2)
[m n] =size(Elution_profiles)
Data= zeros(size(Elution_profiles));
Figure_2 = plot(cell2mat(Label_Elution_time),Elution_profiles);
xlabel('Retention time (min)')
ylabel('Intensity (a.u.)')
legend(cellstr(Label_Wine_samples))
title('GC data')
legend off
GCData = table(cellstr(Label_Wine_samples),Elution_profiles)

hold off

%Plot the MS data
subplot(3,1,3)
[m n] =size(Mass_profiles)
Data= zeros(size(Elution_profiles));
plot(cell2mat(Label_Mass_channels),Mass_profiles)
xlabel('m/z')
ylabel('Abundance (a.u.)')
title('MS Data')
legend(cellstr(Label_Wine_samples))
legend off
MSData = table(Class,Mass_profiles)
saveas(gcf,'Alldata.tif')
hold off %when finished loading the spectra