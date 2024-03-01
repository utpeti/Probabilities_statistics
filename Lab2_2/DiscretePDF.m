% -----------
% Description
% -----------
% The function calculates the values of different discrete probability density functions.
% -----
% Input
% -----
% $\Green{\mathbf{x} = \left[x_i\right]_{i=1}^n}$                   - an increasing sequence(*@\footnote{\textbf{sequence} \emph{sorozat}; \textbf{increasing $\sim$} \emph{növekv\H{o} sorozat}; \textbf{random $\sim$} \emph{véletlen sorozat}}@*) of $\text{\Red{\textbf{positive integers}}}$
% distribution_type  - a string that identifies the distribution (e.g., 'Bernoulli', 
%                      'binomial', 'Poisson', 'geometric', etc.)
% parameters         - an array of parameters which characterize the distribution 
%                      specified by distribution_type
% ------
% Output
% ------
% $\Green{\mathbf{f} = \left[f(x_i)\right]_{i=1}^n}$                   - values of the given probability density function
function f = DiscretePDF(x, distribution_type, parameters)

% for safety reasons
sort(x);
x = round(x);

% get the size of the input array
n = length(x);

% select the corresponding distribution
switch (distribution_type)
    
    case 'geometric'
        % the $\Green{\mathcal{G}eo\left(p\right)}$-distribution has a single parameter $\Green{p\in\left[0,1\right]}$
        p = parameters(1);
        
        % check the validity of the distribution parameter $\Green{p}$
        if (p < 0 || p > 1)
            error('Wrong parameter!');
        end
        
        % allocate memory and evaluate the probability density function $\Green{ f_{\mathcal{G}eo\left(p\right) }}$ 
        % for each element of the input array $\Green{\mathbf{x} = \left[x_i\right]_{i=1}^n}$
        f = zeros(1, n);

        q = 1 - p;
        for i = 1:n
            % check the validity of the current value $\Green{x_i}$
            if (x(i) < 1)
                error('Incorrect input data!');
            else
                f(i) = q^(x(i) - 1) * p; % i.e., $\Green{ f_{\mathcal{G}eo\left(p\right) } \left( x_i \right) = \left(1-p\right)^{x_i} \cdot p,\,i=1,2,\ldots,n}$
            end
        end
        
    % handle another discrete distribution type
    case 'uniform'
        
        m = parameters(1);
        
        if(m < 1)
            error('Wrong parameter!');
        end
        
        f = zeros(1, n);
        
        for i = 1:n
            if(x(i) < 1 || x(i) > m)
                f(i) = 0;
            else
                f(i) = 1 / m; 
            end
        end
        
        
    case 'bernoulli'
        
        p = parameters(1);

        if(p <= 0 || p >= 1)
            error('Wrong parameters!');
        end
        
        f = zeros(1, n);
        
        for i = 1:n
            if (x(i) == 0)
                f(i) = 1 - p;
            else
                f(i) = p;
            end
        end
        
    case 'hypergeometric'
        
        pN = parameters(1);
        pM = parameters(2);
        pn = parameters(3);
        
        if(pN < 1 || ((0 > pM) || (pM > pN)) || ((0 > pn) || (pn > pN)))
            error('Wrong parameters!');
        end
        
        f = zeros(1, n);
        l1 = max(0, (pn - pN + pM));
        l2 = min(pn, pM);
        
        for i = 1:n
            if (x(i) < l1 || x(i) > l2)
                error('Incorrect input data!');
            else
                f(i) = nchoosek(pM, x(i)) * nchoosek(pN - pM, pn - x(i)) / nchoosek(pN, pn);
            end
        end
        
    case 'pascal'
        
        pn = parameters(1);
        pp = parameters(2);
        
        if(pn < 1 || (pp <= 0) || (pp >= 1))
            error('Wrong parameters');
        end
        
        f = zeros(1, n);
        
        for i = 1:n
            if (x(i) < 0)
                error('Incorrect input data!');
            else
                f(i) = nchoosek(pn + x(i) - 1, x(i)) * pp^pn * (1 - pp)^x(i);
            end
        end
        
    case 'plus'
        
        rates = [9/108, 1/27, pi/54, 3/27, 2*pi/27, 1/3, 3/108, (8 - 2*pi)/27, (6 - pi)/54];
        f = zeros(1, n);
        
        for i = 1:n
            if (x(i) < 1 || x(i) > 9)
                error('Incorrect input data!');
            else
                f(i) = rates(x(i));
            end
        end
        
end