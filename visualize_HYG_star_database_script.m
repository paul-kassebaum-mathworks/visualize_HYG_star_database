%% Visualizing the HYG Star Database
% By Paul Kassebaum
% pkassebaum@gmail.com
% 
% Source of data: https://github.com/astronexus/HYG-Database/raw/master/hygdata_v3.csv
% 
% This visualization was inspired by <https://raw.githubusercontent.com/zonination/h-r-diagram/master/twinkle.gif 
% this figure> by <https://www.reddit.com/user/zonination u/zonination>.

% Set up a datastore.
filename = 'hygdata_v3.csv';
ds = datastore(filename);

% Focus on the absolute visual magnitude and color index data fields.
ds.SelectedVariableNames = {'absmag','ci'};
 
% Create a tall table of the data.
tbl = tall(ds);

% Draw a two variable histogram.
h = histogram2(tbl.ci,tbl.absmag,'DisplayStyle','tile');

% Customize the figure.
xlabel('Color Index');
ylabel('Absolute Visual Magnitude');
title('Histogram of Star Data');

ax = gca;
ax.ColorScale = 'log';
ax.YDir = 'reverse';

cb = colorbar;
cb.Label.String = 'Count';
cb.Limits = [1 5e3];

text(0, 17,'white dwarfs');
text(3,-14,'super giants');
text(2.4, 17,'main sequence');
text(2.5,-5,'giants');
line([2.4 1.6],[-5 -1],'Color','black');

% Save the figure as a PNG.
print('ci_vs_absmag','-dpng');