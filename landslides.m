%Landslides triggered by multiple earthquakes

%FIGURE 1
% Plot of the relation between earthquake magnitude Mw and area affected by
% landslides. Data from Keefer (1984) and Rodriguez et al (1999).
% Be aware that Keefer's datapoints were retraced and the upper bound was
% graphically captured and equation derived with Grabit.

%Upper bound from Keefer (1984)
Keef=4.5:0.1:9;
area = 0.000000001*Keef.^(15.482);

%Dataset from Keefer (1984) and Rodriguez et al (1999); row 1 is Mw, row 2
%is area
load keefer
load rodriguez

%MY DATA
%Data should be arranged in a matrix with the following structure: date;
%latitude; longitude; UTM Easting; UTM Northing; Mw; NLT; affected area (km2).
%Presented data refer to the 2018 Lombok seismic sequence (Ferrario, 2019).
load Lombok
colNames = {'Date','Latitude','Longitude','UTM_Easting', 'UTM_Northing', 'Mw', 'NLT', 'Area'};
sTable = array2table(Lombok,'VariableNames',colNames);

%Making the figure
subplot(2,2,1)
semilogy(Keef, area, '-k')
hold on
plot (keefer(1,:), keefer(2,:), 'ok')
plot (rodriguez(1,:), rodriguez(2,:), 'sb')
plot (Lombok(:,6), Lombok(:,8), 'pr', 'MarkerSize',10)
xlabel('Earthquake moment magnitude Mw')
ylabel('Affected area (km2)')

legend('Upper bound (Keefer, 1984)', 'Dataset (Keefer)', 'Dataset (Rodriguez)', 'Lombok', 'Location', 'SouthEast');
hold off
%-----------------------------------------------------------

%FIGURE 2
%Plot of the relation between moment magnitude Mw and number of triggered
%landslides NLT. Dataset and relations are from Malamud et al 2004 (their
%equation 15).

%Equation by Malamud & error bounds
x=4.5:0.1:9;
NLT = 10.^(1.27*x - 5.45);
low = 10.^(1.27*x - 5.91);
upp = 10.^(1.27*x - 4.99);

%Dataset from Malamud (their Table 1); row 1 is Mw, row 2 is Number of
%landslides
load Malamud

%Making the figure
subplot(2,2,2)
semilogy(x, NLT, '-k')
hold on
plot (Malamud(1,:), Malamud(2,:), 'ok')
plot (Lombok(:,6), Lombok(:,7), 'pr', 'MarkerSize',10)
semilogy(x, low, '--k')
semilogy(x, upp, '--k')
xlabel('Earthquake moment magnitude Mw')
ylabel('Number of landslides NLT')

xlim ([4.5 9])
ylim ([1 1000000])
legend('Relation from Malamud et al. 2004', 'Dataset', 'Lombok', 'Location', 'NorthWest');
hold off

%-----------------------------------------------------------
%FIGURE 3
% Map of epicenters

LATmin = min(Lombok(:,2));
LATmax = max(Lombok(:,2));
LONmin = min(Lombok(:,3));
LONmax = max(Lombok(:,3));

%Making the figure
subplot(2,2,3)
geobubble(Lombok(:,2),Lombok(:,3),Lombok(:,6), 'SizeLegendTitle', 'Magnitude')
geolimits([LATmin-0.1 LATmax+0.1],[LONmin-0.1 LONmax+0.1])
geobasemap('colorterrain')


%-----------------------------------------------------------

%FIGURE 4
% Schematic sketch of the regions where landslides are expected, given the
% epicenter location and Keefer's upper bound.
centers = [Lombok(:,4),Lombok(:,5)];

%given the magnitude of the events, here I calculate the area (in km2) where landslides are expected, according to the upper bound by Keefer (1984).
exp_area = 0.000000001*((Lombok(:,6)).^(15.482));

%Transforming area to radius, in m
radii = sqrt (exp_area/pi)*1000;

%Making the figure
subplot(2,2,4)
viscircles(centers, radii, 'Color', 'k', 'LineWidth', 1)
hold on
scatter (Lombok(:,4),Lombok(:,5), 'sk', 'filled')
axis square
xlabel('UTM Easting')
ylabel('UTM Northing')