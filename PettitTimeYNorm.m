% Time normalization of process tracing data
% Last Pettit Edit: 10/14/20
clear

filename =('43-3-YTrack.xlsx');
data = xlsread(filename);


nbins = 101;

% Determines number of trials (should be 100)
nrows = size(data(:,1));

normdatax = [];

for i=1:nrows % loops through rows (trials)
    %i=1:nrows
    bincuts = [];
    %intcheck = [];
    normtrialx = [];
    
    % indexes one row (trial) at a time
    profrow = data(i,:); 
    [m,n] = size(profrow(~isnan(profrow)));
    steps = n;
    count = (steps-1)/(nbins-1);
    
    trialdata = data(i,:);

    bincuts = [1:count:steps]';
    
    bincuts(nbins) = steps; % so that ceil(bincuts(j)) does not index out of bounds
    %bincuts = [bincuts; steps];
    %intcheck = [intcheck; 1];

    for j=1:size(bincuts,1)
        xdiff = trialdata(ceil(bincuts(j))) - trialdata(floor(bincuts(j)));
        normx = trialdata(floor(bincuts(j))) + xdiff*(bincuts(j) - floor(bincuts(j)));
        normtrialx = [normtrialx; normx];

    end
    
    normdatax = [normdatax normtrialx];
    

%     plot(320-normtrialx,(384-normtrialy))
%     axis([-320 320 -96 384])
%     pause(0.5)
    
end

normdatax = normdatax';