function [ seq ] = InversionPoisson( lambda, n )
%INVERSIONPOISSON Summary of this function goes here
%   Detailed explanation goes here
n = floor(n);

if(n < 1)
    error('Incorrect n!');
end

if(lambda <= 0)
    error('Incorrect lambda!');
end

seq = zeros(1, n);

for k = 1:n
    i = 0;
    p = exp(-lambda);
    s = p;
    u = UMersenneTwisterRNG();
    while u > s
        i = i + 1;
        p = lambda / i * p;
        s = s + p;
    end
    seq(k) = i;

end

