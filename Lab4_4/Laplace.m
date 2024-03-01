function X = Laplace(n, mu, sigma)

if n < 1 
    error('Wrong n parameter');
end

X = zeros(1,n);

for i=1:n
    
    while 1
    
        Y = ExactInversion('exponential',1,1);
        V = 2 * UMersenneTwisterRNG(1) - 1;

        if (Y - 1) ^ 2 <= -2 * log(abs(V))
            break;
        end

    end
    
    X(i) = Y * sign(V);
    
end

X = X .* sigma + mu;
hist(X);