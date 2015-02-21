function dx = dropTowerModelBrake(t,x)

%% Initial Conditions

g = 32.174;     % Gravitational Constant (in/s^2)
alpha = -.144;
sigma = 58000000;
delta = .001587;
Bo = .354 * .354;
lmag = 1.21;
wmag = .0254;


Cd = 2; % Drag Coefficient
rho = 0.080672; % Density of Air (20 Degrees C)
lcar = 1; % Feet
wcar = 4/12; %Feet


%% Two First Order ODE Solutions to 2nd Order ODE 

    dx(1,1) = x(2); % Position to Velocity (in/s)
    dx(2,1) = -g + ((alpha * sigma * delta * Bo * lmag * wmag * (x(2)) * .2248))/1 + (.5 * Cd * rho * x(2)^2 * lcar * wcar); % Acceleration (in/s)
end

