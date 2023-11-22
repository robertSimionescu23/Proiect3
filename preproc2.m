function  y = preproc2 (x, Fe_, Fe)
    %c) 
    %Schimbarea frecventei de esantionare
    % x_rs -> x resampled
    x_rs = resample(x, Fe, Fe_);

    %normarea amplitudinii la cea mai mare amplitudine din semnal (in modul) in [-1;1]
    min_or_max = max(max(x_rs), abs(min(x_rs)));   %gasirea amplitudinii
    %min_or_max = max(abs(x_rs))               %alta posibilitate de gasire a maximului
    y = x_rs/min_or_max;                       %normarea efectiva
   
end