function Kozrefogas(n)

if n < 1 
    error('Wrong n parameter!');
end

X = zeros(1,n);
e = exp(1);
alfa = 1 / sqrt(e);
beta = 1 / 2;
gamma = sqrt(2);

ertekelessurusegfgv = 0;
elfogadas = 0;

for i = 1:n
    
    while 1
    
        u = UMersenneTwisterRNG();
        v = UMersenneTwisterRNG();
        y = tan (pi * v);
        s = beta * y ^ 2;
        w = (alfa * u) / (beta + s);
        
        elfogadas = elfogadas + 1;

        if (abs(y) > gamma)
            L = false;
        else
            L = (w <= 1 - s);
        end

        if (L == false)
            ertekelessurusegfgv = ertekelessurusegfgv + 1;
            L = (w <= exp(-s));
        end
        
        if (L == true)
            break;
        end
    end
    
    X(i) = y;
end

hist(X);
title('Kozrefogas');
ertekelessurusegfgv / n
elfogadas / n

end