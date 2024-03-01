function sample = InversionByBinarySearch(X, uniform_rng, count)

% input checking
[row_count, column_count] = size(X);

if (row_count ~= 2)
    error('Wrong input discrete random variable!');
end

for j = 1:column_count
    if (X(2,j) < 0 || X(2,j) > 1)
        error('Wrong input discrete random variable!');
    end
end

total_probability = sum(X(2,:));
if (total_probability > 1)
    error('Wrong input discrete random variable!');
end

% assume accumulated errors
if (total_probability < 1)
    X(2, column_count) = 1 - sum(X(2, 1:column_count-1));
end

% calculate cumulative probabilities
cumulative_probabilities = cumsum(X(2,:));

% allocate memory
sample = zeros(1, count);

% perform binary searching
for k = 1:count
    
    switch (uniform_rng)
        case {'LEcuyer', 1}
            u = ULEcuyerRNG();

        case {'MersenneTwister', 2}
            u = UMersenneTwisterRNG();

        otherwise
            u = rand();
    end

    % Binary search
    low = 1;
    high = column_count;
    
    while (low < high)
        mid = floor((low + high) / 2);
        if (u <= cumulative_probabilities(mid))
            high = mid;
        else
            low = mid + 1;
        end
    end
    
    sample(k) = X(1, low);
end
