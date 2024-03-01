function test_continuous_plus
x = (1.6:0.05:3.9);

distribution_type = 'plus';
parameters = [];

%our functions
f = ContinuousPDF(x, distribution_type, parameters);
F = ContinuousCDF(x, distribution_type, parameters);

disp(ContinuousCDF(4, distribution_type, parameters) - ContinuousCDF(3/2, distribution_type, parameters));

hold on
plot(x,f,'g');
plot(x,F,'r');

end