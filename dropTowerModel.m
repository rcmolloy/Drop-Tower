function dx = dropTowerModel(t,x)

%% Initial Conditions

g = 32.174;     % Gravitational Constant (in/s^2)
alpha = -.144;
sigma = 58000000;
delta = .001587;
Bo = .147 * .147;
lmag = .304;
wmag = .0254;


Cd = 2; % Drag Coefficient
rho = 0.080672; % Density of Air (20 Degrees C)
lcar = 1; % Feet
wcar = 4/12; %Feet

%% Two First Order ODE Solutions to 2nd Order ODE 
    dx(1,1) = x(2); % Position to Velocity (in/s)
    dx(2,1) = -g + (.5 * Cd * rho * x(2)^2 * lcar * wcar); % Acceleration (in/s)
end

