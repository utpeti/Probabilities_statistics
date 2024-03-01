function X = Compact(n)
    
f = @(x) (1/36)*(6*(x.^2)-2*(x.^3)+5*x);
M = f((6 + sqrt(66))/6);

X = zeros(1,n);

if (n < 1)
    error('Wrong n parameter!')
end

a = 0;
b = 3;

for i = 1:n
    while 1
        U = UMersenneTwisterRNG(1);
        V = UMersenneTwisterRNG(1);
        Y = a + (b - a) * V;    
        if(U * M <= f(Y))
            break;
        end
    end
    X(i) = Y;
end

hist(X);
