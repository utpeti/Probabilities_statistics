function X = Cauchy(n, mu, sigma)

if n < 1 
    error('Wrong n parameter!');
end

X = zeros(1,n);

a = sqrt(exp(1)) / 2;

for i = 1:n
    while 1
        U = UMersenneTwisterRNG(1);
        V = UMersenneTwisterRNG(1);
        Y = tan(pi * V);
        S = Y ^ 2;
        
        if(U <= a * (1 + S) * exp(-1 * S / 2))
            break;
        end
        
    end
    
    X(i) = Y;
end

X = X .* sigma + mu;
hist(X);