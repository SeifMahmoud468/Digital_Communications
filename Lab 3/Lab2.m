% Generate random bits
N = 100; % number of bits
bits = randi([0 1], N, 1);

% Define time vector with Ts = 1
t = 0:N-1;
halfT = 0:0.5:N-0.5;

% Unipolar encoding
unipolar = bits;

% Polar encoding
polar = bits;
polar(polar==0) = -1;

% Bipolar encoding
bipolar = bits;
for i = 1:N
    if bipolar(i) == 0
        bipolar(i) = -1;
        if i > 1 && bipolar(i-1) == -1
            bipolar(i) = 1;
        end
    end
end

% Manchester encoding
manchester = [];
for i = 1:N
    if bits(i) == 0
        manchester = [manchester -1 1];
    else
        manchester = [manchester 1 -1];
    end
end

% Plotting the modulation signals
figure;
subplot(4,1,1);
plot(t, unipolar);
title('Unipolar Encoding');
subplot(4,1,2);
plot(t, polar);
title('Polar Encoding');
subplot(4,1,3);
plot(t, bipolar);
title('Bipolar Encoding');
subplot(4,1,4);
plot(halfT, manchester);
title('Manchester Encoding');

% Calculating the power spectrum density
figure;
subplot(4,1,1);
spectrum(unipolar);
title('Unipolar PSD');
subplot(4,1,2);
spectrum(polar);
title('Polar PSD');
subplot(4,1,3);
spectrum(bipolar);
title('Bipolar PSD');
subplot(4,1,4);
spectrum(manchester);
title('Manchester PSD');
