%% Params
a1 = 3;
a0 = 3;
b1 = 2;
b0 = 7;

k1 = 1.6;
k0 = 0.64;

theta = [k0 - a0;
        k1 - a1;
        b0;
        b1];

A0 = [-k1, 1;
     -k0, 0];
A = [-a1, 1;
      -a0, 0];
b = [b1; b0];
C = [1, 0];
D = [0;0];

%% Adaptive
% gamma = 0.5;

%% task 2
gamma = 0.5;

