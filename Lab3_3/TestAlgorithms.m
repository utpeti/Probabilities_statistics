%distribution_type = 'lab3_1';


%matlab functions

%n = length(x);
%X = ExactInversion(distribution_type, [9, 13], 10000);

%subplot(1,2,2);
hold on
%hist(X);
parameters = [3, 2];
%subplot(1,2,1);

%X = ExactInversion('lab3_1', parameters, 10000);

%X = NewtonRaphson('gamma', 2/100, 25, parameters, 3, 7000, 0.01);
%X = InversionPoisson (10, 10000);
X = BisectionMethod('normal', 0, 6, parameters, 7000, 0.01);
hist(X);
%subplot(1, 2, 2);
