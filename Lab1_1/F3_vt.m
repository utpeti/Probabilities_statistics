maxtest = 10000;
teljesula = 0;
teljesulb = 0;

for test = 0:maxtest
    vkamion = 0;
    vvauto = 0;
    vtauto = 0;
    for i = 0:11
        x = UMersenneTwisterRNG;
        if x <= ((5 - vkamion) / (20 - i))
            vkamion = vkamion + 1;
        elseif x <= (((8 - vvauto) + (5 - vkamion)) / (20 - i))
            vvauto = vvauto + 1;
        else
            vtauto = vtauto + 1;
        end
    end
    if vkamion == 3
        if vvauto == 5
            teljesula = teljesula + 1;
        end
    end
    if vvauto >= 1
        if vtauto == 3
            teljesulb = teljesulb + 1;
        end
    end
end

disp(teljesula / maxtest);
disp(teljesulb / maxtest);
