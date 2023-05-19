% Step 1: Set the simulation parameters
num_bits = 1e6;
SNR_range = 0:2:30;
num_iterations = 5;
BER = zeros(1, length(SNR_range));

for snr_idx = 1:length(SNR_range)
    % Step 2: Generate random binary data vector
    data = randi([0 1], 1, num_bits);
    
    % Step 3: Apply noise to bits
    SNR = 10^(SNR_range(snr_idx)/10);
    P = 1; % average power of transmitted signal
    noise_power = P/SNR;
    noise = sqrt(noise_power) * randn(1, num_bits);
    received_signal = data + noise;
    
    % Step 4: Decide whether the received signal is '1' or '0'
    detected_data = (received_signal >= 0.5);
    
    % Step 5: Calculate the number of errors
    num_errors = 0;
    for i = 1:num_iterations
        errors = biterr(data, detected_data);
        num_errors = num_errors + errors;
        detected_data = (received_signal >= 0.5);
    end
    
    % Calculate bit error rate (BER)
    BER(snr_idx) = num_errors / ( num_iterations * num_bits);
end
% Step 7: Plot the BER vs SNR curve
semilogy(SNR_range, BER,'-o','LineWidth',2,'MarkerSize',8);
grid on;
title('Bit Error Rate (BER) vs Signal to Noise Ratio (SNR)');
xlabel('Signal to Noise Ratio (SNR) (dB)');
ylabel('Bit Error?Rate?(BER)');