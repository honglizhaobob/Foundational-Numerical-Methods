% This function defines and returns the 1+omega(x) function so that we can
% plot it after plugging numbers

% x - input to function; points - implementation of interpolants
% n - how many points to interpolate at
function y = omega_x(x, points, n)
interpolants = points(n);
w_x = 1; % initialize w_x to be 1 for multiplication
for c = interpolants
    w_x = w_x .* (x-c); % this is supposed to give us the w_x
end
y = log(1 + abs(w_x));
end
