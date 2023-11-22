function y = smMix(x1, x2, m_mix)
    %d) Mixarea a doua piste
    
    %Determinarea lungimilor
    L_x1 = length(x1);
    L_x2 = length(x2);
    
    %ponderarea amplitudinilor semnalelor
    x1_scaled = m_mix * x1;
    x2_scaled = (1 - m_mix) * x2;
    
    %vectori folositi pentru pentru a face 2 vectori egali in lungime
    %cel mai mic o sa fie inmultit de n ori si decupat la lungimea celuilalt
   	x11 = x1_scaled;
    x22 = x2_scaled;
        
    if (L_x1 < L_x2)    %%ferific ce vector e mai lung si
        while length(x11) < length(x22)   %%Daca x1 mai scurt deact x2,
           x11 = [x11; x1_scaled];      %%fac un vector care se repeta iar si iar
        end
        x11 = x11(1:L_x2);              %%si decupez partea de care nu am nevoie (restul dintr-un intreg)
    else
        while length(x22) < length(x11)   %%Daca x2 mai scurt decat x1,
           x22 = [x22; x2_scaled];      %%fac un vector care se repeta iar si iar
        end
        x22 = x22(1:L_x1);               %%si decupez partea de care nu am nevoie (restul dintr-un intreg)
    end
    
    y = x11 + x22;
end