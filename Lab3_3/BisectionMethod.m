function X = BisectionMethod(distribution_type, a, b, parameters, n, delta)

if n < 1
    error('Incorrect n!');
end

if delta <= 0
    error('Incorrect delta!');
end

X = zeros(1, n);

        for i = 1:n
            
            Fa = ContinuousCDF(a, distribution_type, parameters);
            Fb = ContinuousCDF(b, distribution_type, parameters);
            U = UMersenneTwisterRNG * (Fb - Fa) + Fa;
            
            pa = a;
            pb = b;

            while 1

                X(i) = (pa + pb) / 2;
                
                F = ContinuousCDF(X(i), distribution_type, parameters);
                if(F <= U)
                    pa = X(i);
                else
                    pb = X(i);
                end
            
                if((pb - pa) <= (2 * delta) || abs(F - U) <= delta)
                    break;
                end
            end
        end

end

