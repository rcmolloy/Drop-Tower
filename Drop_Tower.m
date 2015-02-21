%% Robert Cory Molloy - Drop Tower Model :: Matlab Model

clc
clear all
close all

%% Initial Conditions & ODE45 Function for ODE

tspan = [0:.005:.67]; % Time span for ODE45 Function
ICs = [10, 0];   % Initial Position (ft) & Velocity (ft/s)

[t,x] = ode45('dropTowerModel', tspan, ICs);

brakeX = (x(end,1));
brakeV = (x(end,2));

tspan2 = [0:.005:1.25]; % Time span for ODE45 Function
ICs2 = [brakeX, brakeV];   % Initial Position (ft) & Velocity (ft/s)

[t1,x1] = ode45('dropTowerModelBrake', tspan2, ICs2);
xf1 = x(:,1);
xf2 = x1(2:131,1);
vf1 = x(:,2);
vf2 = x1(2:131,2);
newX = [0,0];
newY = [0,10];

totalTime = [0:.005:1.32];
totalTime = transpose(totalTime);

finalPositionMatrix = [xf1;xf2];
finalVelocityMatrix = [vf1;vf2];

finalMatrix = [finalPositionMatrix,finalVelocityMatrix,totalTime];
length = length(finalMatrix);
newLength = length-1;


for i = 1:newLength
   
    dv(i,1) = finalMatrix(i+1,2) - finalMatrix(i,2);
    dt(i,1) = finalMatrix(i+1,3) - finalMatrix(i,3);
    finalAccel(i,1) = dv(i,1)/dt(i,1);
    finalG(i,1) = finalAccel(i,1) / 32.174;
    accelMatrix = [finalAccel(i,1)];
end

for i = 1:265

    dropSim = finalMatrix(i,1);
    
    plot(newX,newY,0,dropSim(1),'o');
    axis([-10 10 0 12]);
    pause(max(totalTime)/265);

end
