function X = Lab04_plus(n)

    f = @(x) (108*x.*exp(-6*x));
    %g = @(x) ();
    X=zeros(1,n);
    for i=1:n
        
        Y = ExactInversion('exponential', 3/4, 1);
        U = UMersenneTwisterRNG(1);
        step=step+1;
        
        while (U > f(Y)/(c*g(Y)) )
            
            Y = ExactInversion('exponential', 3/4, 1);
            U = UMersenneTwisterRNG(1);
            
        end
        
        X(i) = Y;
    end  
    
end