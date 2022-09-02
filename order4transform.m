%% % Transforming normalized IGT process tracing data: Order 4
% programmed for Pettit's Master's thesis
% last Pettit edit: Oct 27, 2020

%% % Load and define participant choice data
filename =('47-4-Xnorm.xlsx');
xdata = xlsread(filename);
xrows = size(xdata(:,1));       % define number of x rows (should be 100)
transformedx = zeros(100,101);  % initialize transformed x coordinates

philename =('47-4-Ynorm.xlsx');       % load y-coordinates
ydata = xlsread(philename);
yrows = size(ydata(:,1));       % define number of y rows (should be 100)
transformedy = zeros(100,101);  % initialized transformed y coordinates


%% % Loop through x-coordinates to center

for i=1:xrows
    topleftx = xdata(i,:);
    transformedx(i,:) = topleftx - 320;
end

%% % Loop through y-coordinates to center

for i=1:yrows
    toplefty = ydata(i,:);
    transformedy(i,:) = (toplefty - 240)*(-1);
end

%% % Loop through if y>0 change sign of x
fulltransformedx=(sign(transformedy)).*(transformedx);

xdata = fulltransformedx;
ydata = transformedy;

x = xdata(18,:);
y = ydata(18,:);
plot(x,y)
