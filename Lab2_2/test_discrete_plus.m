function test_discrete_plus
x = (1:9);
distribution_type = 'plus';
parameters = [];

%our functions
f = DiscretePDF(x, distribution_type, parameters);
F = DiscreteCDF(x, distribution_type, parameters);

disp(DiscreteCDF(6, distribution_type, parameters));
disp(1 - DiscreteCDF(2, distribution_type, parameters));
-DiscreteCDF(1, distribution_type, parameters) + DiscreteCDF(6, distribution_type, parameters)

hold on
plot(x,f,'g*');
stairs(x,F,'r');

end