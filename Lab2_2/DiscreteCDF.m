% -----------
% Description
% -----------
% The function evaluates the values of different discrete cumulative distribution 
% functions.
%
% -----
% Input
% -----
% $\Green{\mathbf{x} = \left[x_i\right]_{i=1}^n}$                   - an increasing sequence of $\text{\Red{\textbf{positive integers}}}$
%
% distribution_type  - a string that identifies the distribution (e.g., 'Bernoulli', 
%                      'binomial', 'Poisson', 'geometric', etc.)
%
% parameters         - an array of parameters which characterize the distribution 
%                      specified by distribution_type(*@\framebreak@*)
% ------
% Output
% ------
% $\Green{ \mathbf{F} = \left[F_i\right]_{i=1}^n = \left[F(x_i)\right]_{i=1}^n }$                   - values of the given cumulative distribution function
%
% ----
% Hint
% ----
% Since the input sequence $\Green{\mathbf{x} = \left[x_i\right]_{i=1}^n\subset \mathbb{N}}$ is increasing it is sufficient to calculate 
% the values
%
% $\Green{ F_1 = \displaystyle\sum_{i=i_{\min}}^{x_1} f\left(i\right),\, F_2 = F_1 + \displaystyle\sum_{i = x_1 + 1}^{x_2}f\left(i\right), \ldots,\, F_n = F_{n-1}+\displaystyle\sum_{i = x_{n-1}+1}^{x_n} f\left(i\right)}$,
%
% where $\Green{f}$ denotes the probability density function that corresponds to $\Green{F}$ and $\Green{i_{\min}}$ 
% represents the minimal integer value of the distribution (e.g., in case of the  
% geometric distribution $\Green{i_{\min} = 1}$, while in the case of the Poisson distribution $\Green{i_{\min} = 0}$).
%
function F = DiscreteCDF(x, distribution_type, parameters)
    %f = @(y)(DiscretePDF(y, distribution_type, parameters));
    
    sort(x);
    
    n = length(x);
    
    F = zeros(1, n);
    
    switch (distribution_type)
       
        case 'geometric'
            
            min_i = 1;
            
        case 'uniform'
            
            min_i = 0;
        
        case 'bernoulli'
            
            min_i = 0;
            
        case 'hypergeometric'
            
            pN = parameters(1);
            pM = parameters(2);
            pn = parameters(3);
            
            min_i = max(0, pn - pN + pM);
            
        case 'pascal'
            
            min_i = 0;
        
        case 'plus'
            
            min_i = 1;
            
    end
    
    F(1) = sum(DiscretePDF(min_i:x(1), distribution_type, parameters));
    min_i = x(1) + 1;
    
    for i = 2:n
        F(i) = F(i - 1) + sum(DiscretePDF(min_i:x(i), distribution_type, parameters));
        min_i = x(i) + 1;
    end
end
