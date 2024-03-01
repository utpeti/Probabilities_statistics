% X = [Xi]n<-i=1 - denotes the sample that has to be generated
% distribution_type - a string that identifies the distrubution of the
% random variate X
% parameters - an array that strores the parameters of the given
% distribution
% n - denotes the sample size

function X = ExactInversion(distribution_type, parameters, n)

X = zeros(1, n);

for i = 1:n
    U = UMersenneTwisterRNG;
    
    switch(distribution_type)
        
        case 'exponential'
            
            alpha = parameters(1);
            
            if(alpha <= 0)
                error('Incorrect parameter!');
            end
            
            X(i) = -(1 / alpha) * log(U);
        
        case 'cauchy'
            
            sigma = parameters(1);
            
            if(sigma <= 0)
                error('Incorrect parameter!');
            end
            
            X(i) = sigma * tan(pi * U);
            
        case 'rayleigh'
            
            sigma = parameters(1);
            
            if(sigma <= 0)
                error('Incorrect parameter!');
            end
            
            X(i) = sigma * sqrt(-2 * log(U));
            
        case 'triangle'
            
            a = parameters(1);
            
            if(a < 0)
                error('Incorrect parameter!');
            end
            
            X(i) = a * (1 - sqrt(U));
        
        case 'rayleigh-end'
            
            a = parameters(1);
            
            if(a <= 0)
                error('Incorrect parameter!');
            end
            
            X(i) = sqrt((a^2) - 2 * log(U));
            
        case 'pareto'
            
            a = parameters(1);
            b = parameters(2);
            
            if(a <= 0 || b <= 0)
                error('Incorrect parameters!');
            end
            
            X(i) = b / (U^(1 / a));
            
        case 'lab3_1'
            
            if U > 0 && U <= 4/9
                X(i) = (-2/3 + 3 * sqrt(8/3 * U + 4/81))/4;
            elseif U > 4/9 && U <= 1
                X(i) = 5/2 - sqrt(25/4 -2 -2*U);
            elseif U == 0
                X(i) = 0;
            else
                X(i) = 1;
            end
    end
end
           