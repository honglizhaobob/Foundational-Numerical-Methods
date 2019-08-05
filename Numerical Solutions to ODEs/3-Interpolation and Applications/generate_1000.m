function y = generate_1000(interval)
% this is a function that generates a 1000 points on a prespecfied interval
% interval - a two-element vector with [lower_bound, upper_bound]
ymin = interval(1);
ymax = interval(2);
y = ymin + rand(1,1000)*(ymax-ymin);
end