%% % Plotting Trajectories from IGT
% Programmed for Pettit's Master's Thesis 
% Last Pettit edit: Oct 25, 2020

%% % Load and define participant choice data
% files organized as follows:
% rows = trials 1-100
% columns = coordinates, 101 time normalized, and un-counter balanced

filename =('39-X.xlsx');
xdata = xlsread(filename);

philename =('39-Y.xlsx');
ydata = xlsread(philename);

%% % Define a trial and plot it
x = xdata(35,:);
y = ydata(35,:);
plot(x,y)



