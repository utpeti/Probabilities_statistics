function test_continuous (distribution_type)


switch(distribution_type)

    case 'normal'
        
        x = (-4:8);
        parameters = [3, 3/2];
        
    case 'uniform'
        
        x = (1:0.1:10);
        parameters = [-12, 5];
        
    case 'gamma'
        
        x = (0:0.1:30);
        parameters = [6, 3];
        
    case 'beta'
        
        x = (0:0.01:1);
        parameters = [4, 1];
        
    case 'snedecor-fisher'
        
        x = (0:0.1:3);
        parameters = [10, 6];
        
end
%our functions
f = ContinuousPDF(x, distribution_type, parameters);
F = ContinuousCDF(x, distribution_type, parameters);
subplot(1,2,1);
hold on
plot(x,f,'g');
plot(x,F,'r');

%matlab functions
switch (distribution_type)

    case 'normal'
        
        f = normpdf(x, parameters(1), parameters(2));
        F = normcdf(x, parameters(1), parameters(2));
        
    case 'uniform'
        
        f = unifpdf(x, parameters(1), parameters(2));
        F = unifcdf(x, parameters(1), parameters(2));
        
    case 'gamma'
        
        f = gampdf(x, parameters(1), parameters(2));
        F = gamcdf(x, parameters(1), parameters(2));
        
    case 'beta'
        
        f = betapdf(x, parameters(1), parameters(2));
        F = betacdf(x, parameters(1), parameters(2));
        
    case 'snedecor-fisher'
        
        f = fpdf(x, parameters(1), parameters(2));
        F = fcdf(x, parameters(1), parameters(2));
end

subplot(1,2,2);
hold on
plot(x,f,'g');
plot(x,F,'r');

end