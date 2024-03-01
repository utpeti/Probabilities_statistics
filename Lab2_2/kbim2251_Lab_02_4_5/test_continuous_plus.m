function test_continuous_plus
x = (-4:0.05:4);
distribution_type = 'plus';
parameters = [];

%our functions
f = ContinuousPDF(x, distribution_type, parameters);
F = ContinuousCDF(x, distribution_type, parameters);

hold on
plot(x,f,'g');
plot(x,F,'r');

end