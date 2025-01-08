%% previous task
t_p = 0.4;
t_p_s = 2.93;
omega_c = t_p_s / t_p;

a_M0 = omega_c^2;
a_M1 = sqrt(2)*omega_c;

A_M = [0 1; -a_M0 -a_M1];
b_M = [0; a_M0];
C_M = [1 0];

%% object
a0 = 1;
a1 = -5;
b0 = 4;
%% 2.1
A = [0, 1; 
    -a0 -a1];
b = [0; b0];

C = eye(2);


%% regulator
theta1 = -(-a_M0 + a0)/b0;
theta2 = -(-a_M1 + a1)/b0;
kappa = b0/a_M0;

theta = [theta1; theta2];


%% 2.2
A = [0, 1; -a0 -a1] + [0 0; 3 3];

%% 2.3
A = [0, 1; -a0 -a1] + [0 0; 20 20];
