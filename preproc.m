function y = preproc (x, Fe_, Fe, Ft)
    N = 200;
    
    %b) 
    %Schimbarea frecventei de esantionare
    % x_rs -> x resampled
    x_rs = resample(x, Fe, Fe_);

    %normarea amplitudinii la cea mai mare amplitudine din semnal (in modul) in [-1;1]
    min_or_max = max(max(x_rs), abs(min(x_rs)));      %gasirea amplitudinii
    %min_or_max = max(abs(x_rs))                   %alta posibilitate de gasire a maximului
    x_scaled = x_rs/min_or_max;                         %normarea efectiva
    
    %conceperea unui filtru FTS cu F-3db = Fe (80Hz)
    b = fir1(N,Ft/(Fe/2),'high');
                
    %Filtrarea folosind parametri b 
    y = filter(b,1,x_scaled);    
    
    %sound(y_filt,Fe);
    %sound(y,Fe);
end