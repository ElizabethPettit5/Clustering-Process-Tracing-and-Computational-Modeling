%% % Load and define participant choice data
filename =('43-3-centeredx.xlsx');
xdata = xlsread(filename);
xrows = size(xdata(:,1));       % define number of x rows (should be 100)
fulltransformedx = zeros(100,101);  % initialize transformed x coordinates

philename =('43-3-centeredy.xlsx');       % load y-coordinates
ydata = xlsread(philename);
yrows = size(ydata(:,1));       % define number of y rows (should be 100)
fulltransformedy = zeros(100,101);  % initialized transformed y coordinates

%% % Loop through if y>0 change sign of x

for i=1:yrows
    y = ydata(i,:);
    x = xdata(i,:);
    if 0<y<700
        fulltransformedy(i,:) = y;
        fulltransformedx(i,:) = (x)*(-1);
    elseif -700<y<0
        fulltransformedy(i,:) = y;
        fulltransformedx(i,:) = x;
    end
end

%%

