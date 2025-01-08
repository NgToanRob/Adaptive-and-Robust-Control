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


%% regulator
theta1 = -(-a_M0 + a0)/b0;
theta2 = -(-a_M1 + a1)/b0;
kappa = b0/a_M0;

theta = [theta1; theta2];


%% 3.1.1
A = [0, 1; 
    -a0 -a1];
b = [0; b0];
C  = eye(2);

Q = [1, 0;
    0, 3];
P = lyap(A_M', Q);

gamma = 1000;

%% 3.1.2
A = [0, 1; -a0 -a1] + [0 0; 3 3];

%% 3.1.3
A = [0, 1; -a0 -a1] + [0 0; 20 20];



%% 3.2.1
gamma = 1;

%% 3.2.2
gamma = 20;

%% 3.2.3
gamma = 100;

%% 3.3
g = 1;