    function X = NewtonRaphson(distribution_type, a, b, parameters, strt, n, delta)

    if n < 1
        error('Incorrect n!');
    end

    if delta <= 0
        error('Incorrect delta!');
    end
    
    max_step = 5000;
    
    X = zeros(1, n);

            for i = 1:n
                F_a = ContinuousCDF(a, distribution_type, parameters);
                F_b = ContinuousCDF(b, distribution_type, parameters);
                U = UMersenneTwisterRNG() * (F_b - F_a) + F_a;
                display(i);
                x = strt;
                step = 0;
                
                while 1
                    
                    step = step + 1;
                    Fxi = ContinuousCDF(x, distribution_type, parameters);
                    fxi = ContinuousPDF(x, distribution_type, parameters);
                    x = x - ((Fxi - U) / fxi);
                    Fxinew = ContinuousCDF(x, distribution_type, parameters);

                    if(step < max_step)
                        X(i) = x;
                    else
                        i = i - 1;
                    end
                    
                    if(abs(Fxinew - U) <= delta || step >= max_step)
                        break;
                    end
                end
            end
    end