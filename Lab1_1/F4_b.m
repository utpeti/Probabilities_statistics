hold on

maxteszt = 10000;
p = 0;
teljesulb = 0;

while p < maxteszt
    x = UMersenneTwisterRNG;
    y = UMersenneTwisterRNG;
    
    x = 16 * x - 8;
    y = 12 * y - 6;
    if ABe(x, y) && BCe(x, y) && CDe(x, y) && DEe(x, y) && EFe(x, y) && FAe(x, y)
        p = p + 1;
        if BEe(x, y) && Circle(x, y)
            teljesulb = teljesulb + 1;
            plot(x, y, 'g.');
        else
            plot(x, y, 'r.');
        end
    end
end

vszin = teljesulb / maxteszt;
disp(vszin);