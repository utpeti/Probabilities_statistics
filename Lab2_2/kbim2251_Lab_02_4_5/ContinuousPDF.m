% -----------
% Description
% -----------
% The function evaluates different continuous probability density functions.
%
% -----
% Input
% -----
% $\Green{\mathbf{x} = \left[x_i\right]_{i=1}^n}$                   - an increasing sequence of $\text{\Red{\textbf{real}}}$ numbers
% distribution_type  - a string that identifies the distribution (e.g., 'exponential', 
%                      'normal', 'chi2', 'gamma', 'beta', 'Student', etc.)
% parameters         - an array of parameters which characterize the distribution 
%                      specified by distribution_type
%
% ------
% Output
% ------
% $\Green{\mathbf{f} = \left[f_i\right]_{i=1}^n  = \left[f(x_i)\right]_{i=1}^n}$                   - values of the given probability density function
%
function f = ContinuousPDF(x, distribution_type, parameters)

% for safety reasons
x = sort(x);

% get the size of the input array
n = length(x);
% select the corresponding distribution
switch (distribution_type)
    
    case 'normal'
        % the $\Green{\mathcal{N}\left(\mu,\sigma\right)}$-distribution has two parameters, where $\Green{\mu\in\mathbb{R}}$ and $\Green{\sigma>0}$
        mu    = parameters(1);
        sigma = parameters(2);
        
        % check the validity of the distribution parameters 
        if (sigma <= 0)
            error('The standard deviation must be a strictly positive number!');
        end

        % Allocate memory and evaluate the probability density function $\Green{f_{\mathcal{N}\left(\mu,\sigma\right)}}$ 
        % for each element of the input array $\Green{\mathbf{x} = \left[x_i\right]_{i=1}^n}$.
        %
        % Note that, in this special case, this can be done in a single line of code,
        % provided that one uses the dotted arithmetical operators of $\GMatlab{}$.
        
        % use the formula $\Green{f_{\mathcal{N}\left(\mu,\sigma\right)}\left(x_i\right) = \displaystyle\frac{1}{\sqrt{2\pi}\,\sigma} e^{-\frac{\left(x_i-\mu\right)^2}{2\sigma^2}},\,x_i \in \mathbb{R} }$
        f = (1.0 / sqrt(2.0 * pi) / sigma) * exp(-(x - mu).^ 2 / 2.0 / sigma^2); 
        
    % handle another continuous distribution type
    case 'uniform'
        
        pa = parameters(1);
        pb = parameters(2);
        
        f = zeros(1, n);
        
        if(pa >= pb)
            error('Incorrect parameters: a must be less than b!');
        end
        
        for i = 1:n
            if(x(i) >= pa && x(i) <= pb)
                f(i) = 1 / (pb - pa);
            else
                f(i) = 0;
            end
        end
        
    case 'gamma'
        
        pa = parameters(1);
        pb = parameters(2);
        
        f = zeros(1, n);
        
        if(pa <= 0 || pb <= 0)
            error('Incorrect parameters!');
        end
        
        for i = 1:n
            if(x(i) > 0)
                f(i) = 1 / (pb^pa * gamma(pa)) * x(i)^(pa - 1) * exp(-(x(i)));
            else
                f(i) = 0;
            end
        end
        
    case 'beta'
        
        pa = parameters(1);
        pb = parameters(2);
        
        f = zeros(1, n);
        
        if(pa <= 0 || pb <= 0)
            error('Incorrect parameters!');
        end
        
        for i = 1:n
            if(x(i) > 0 && x(i) < 1)
                f(i) = 1 / beta(pa, pb) * x(i)^(pa - 1) * (1 - x(i))^(pb - 1);
            else
                f(i) = 0;
            end
        end
        
    case 'snedecor-fisher'
        
        pm = parameters(1);
        pn = parameters(2);
        
        f = zeros(1, n);
        
        if(pm <= 0 || pn <= 0)
            error('Incorrect parameters!');
        end
        
        for i = 1:n
            if(x(i) >= 0)
                f(i) = 1 / beta(pm / 2, pn / 2) * (pm / pn)^(pm / 2) * (x(i)^(pm / 2 - 1)) / ((1 + pm / pn * x(i)))^((pm + pn) / 2);
            else
                f(i) = 0;
            end
        end
        
    case 'plus'
        
        f = zeros(1, n);
        
        for i = 1:n
            if(x(i) <= -1)
                f(i) = 0;
            elseif(x(i) <= 1)
                f(i) = (x(i) + 3) / 9;
            elseif(x(i) <= 2)
                f(i) = (x(i) / 18) * (1 / 6 + x(i)^2);
            else
                f(i) = exp(2 - x(i)) / 9;
            end
        end
end