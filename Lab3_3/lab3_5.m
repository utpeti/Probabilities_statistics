%1 - lila, 2 - feher, 3 - piros
X = [20 24 18];

n = 10000;
good = 0;
tmp = [1 2 3];
tmp(2,:) = X ./ sum(X);
for i = 1:n
   counts = [0 0 0];
   
   for j = 1:14
       z = InversionByBinarySearch(tmp, 'MersenneTwister', 1);
       counts(z) = counts(z) + 1;
   end
   if counts(3) == 3 && counts(1) >= 2
      good = good + 1; 
   end
   
end
disp(good/n);


picks_sum = 0;

for i = 1:n
   Y = X;
   counts = [0 0 0];
   tmp = [1 2 3];
   j = 0;
   while counts(2) ~= 10
       tmp(2,:) = Y ./ sum(Y);
       z = InversionByBinarySearch(tmp, 'MersenneTwister', 1);
       counts(z) = counts(z) + 1;
       Y(z) = Y(z) - 1;
       j = j+1;
   end
   picks_sum = picks_sum + j;
end
disp(picks_sum/n);