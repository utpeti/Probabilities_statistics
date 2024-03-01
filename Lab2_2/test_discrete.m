function test_discrete (distribution_type)

switch(distribution_type)
    
    case 'geometric'
        
        x = (1:10);
        parameters = (1/3);

    case 'uniform'
        
        x = (1:10);
        parameters = (7);

    case 'bernoulli'
        
        x = [0, 1];
        parameters = (2/3);

    case 'hypergeometric'
        
        x = (0:5);
        parameters = [15, 7, 5];

    case 'pascal'
        
        x = (0:10);
        parameters = [8, 1/2];
end
        
%our functions
f = DiscretePDF(x, distribution_type, parameters);
F = DiscreteCDF(x, distribution_type, parameters);
subplot(1,2,1);
hold on
plot(x,f,'g*');
stairs(x,F,'r');

%matlab functions

switch (distribution_type)
    
    case 'geometric'
        f = geopdf(x - 1, parameters(1));
        F = geocdf(x - 1, parameters(1));
        
    case 'uniform'
        f = unidpdf(x, parameters(1));
        F = unidcdf(x, parameters(1));
        
    case 'bernoulli'
        f = binopdf(x, 1, parameters(1));
        F = binocdf(x, 1, parameters(1));
     
    case 'hypergeometric'
        f = hygepdf(x, parameters(1), parameters(2), parameters(3));
        F = hygecdf(x, parameters(1), parameters(2), parameters(3));
     
    case 'pascal'
        f = nbinpdf(x, parameters(1), parameters(2));
        F = nbincdf(x, parameters(1), parameters(2));
end

subplot(1,2,2);
hold on
plot(x,f,'g*');
stairs(x,F,'r');

end