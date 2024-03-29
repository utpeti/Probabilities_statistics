function X = SecantMethod(distribution_type, a, b, parameters, n, delta)

if n < 1
    error('Incorrect n!');
end

if delta <= 0
    error('Incorrect delta!');
end

X = zeros(1, n);

        for i = 1:n
                    
            U = UMersenneTwisterRNG;
            
            pa = a;
            pb = b;

            while 1
                
                prevX = X(i);
                Fa = ContinuousCDF(pa, distribution_type, parameters);
                Fb = ContinuousCDF(pb, distribution_type, parameters);
                X(i) = (pa + (pb - pa) * ((U - Fa) / (Fb - Fa)));
                Fxi = ContinuousCDF(X(i), distribution_type, parameters);
                
                if(Fxi <= U)
                    pa = X(i);
                else
                    pb = X(i);
                end
            
                if(abs(prevX - X(i)) <= delta)
                    break;
                end
            end
        end

end

   