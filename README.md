# eq-landslides
Landslides triggered by multiple earthquakes: comparison with reference data

Matlab code for comparing the number of landslides triggered by an earthquake and affected area with literature data
Provided the input data (position and M of the earthquakes, number of triggered landslides and affected area), the code returns a figure including:
a)	Area affected by landslides (km2) as a function of earthquake magnitude Mw. Data from Keefer (1984) and Rodriguez et al. (1999). Solid line is approximate upper bound enclosing all data from Keefer’s work. 
b)	Relation between earthquake moment magnitude Mw and number of triggered landslides NLT. The solid line is the correlation and the dashed lines are the corresponding error bounds from Malamud et al., 2004.
c)	Location map, symbol dimension scales with magnitude.
d)	Schematic sketch of the regions where landslides area expected, given the epicenter location and the upper bound curve from Keefer (1984). I’m definitely unhappy with the rendering, but you know, I was getting crazy with geographical coordinates in Matlab… 

Enjoy!
