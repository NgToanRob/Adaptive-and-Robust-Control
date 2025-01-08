% MATLAB code to plot step response with bounds and intersection point

% Define time step and time vector
dt = 1e-3;  % Time step = 1 ms
t = 0:dt:5;  % Time vector from 0 to 10 seconds

% Define the transfer function coefficients for a 2nd-order Butterworth filter

num = 1;  % Numerator
% den = [1 sqrt(2) 1];  % Denominator s^2 + sqrt(2)s + 1
den = [1 10.395 53.656];

% Create transfer function system
H = tf(num, den);

% Compute the step response
[y, t_out] = step(H, t);

% Plot the step response
figure;
plot(t_out, y, 'b', 'LineWidth', 1.5); hold on;
title('Step Response with Upper and Lower Bounds');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Draw lower and upper bounds
% y_lower = 0.95;
% y_upper = 1.05;
y_max = max(y);
plot(t, y_max * ones(size(t)), 'r--', 'LineWidth', 1.5);
% plot(t, y_lower * ones(size(t)), 'r--', 'LineWidth', 1.5);  % Lower bound y=0.95
% plot(t, y_upper * ones(size(t)), 'g--', 'LineWidth', 1.5);  % Upper bound y=1.05

% Find the intersection point of the step response and the lower bound
% idx = find(y >= y_lower, 1);  % First index where the response crosses the lower bound
% t_intersection = t_out(idx);   % Time of intersection
% y_intersection = y(idx);       % Amplitude at the intersection

% Mark the intersection point
% plot(t_intersection, y_intersection, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(t_intersection, y_intersection, ['(' num2str(t_intersection, '%.2f') ', ' num2str(y_intersection, '%.2f') ')'], ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

% Add legend
% legend('Step Response', 'Lower Bound (y=0.95)', 'Upper Bound (y=1.05)', 'Intersection Point');
legend('Step Response', 'Max response');

hold off;
