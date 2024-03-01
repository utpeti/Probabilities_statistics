function seq = InversionGeo( p,n )

if p <0 || p > 1
    error('Incorrect p parameter!');
end

if n < 1
    error('Incorrect n!');
end


lambda = -log(1 - p);
seq = ceil(ExactInversion('exponential', lambda, n));

end

