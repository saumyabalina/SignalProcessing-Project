%% Function 3: Noise classification

function noiseType = classifyNoise(audio)
    % Load audio files for comparison
    [y1, ~] = audioread('music_ceiling-fan.wav');
    [y2, ~] = audioread('music_city-traffic.wav');
    [y3, ~] = audioread('music_pressure-cooker.wav');
    [y4, ~] = audioread('music_water-pump.wav');

    % Load separately for speech files
    % [y1, ~] = audioread('speech_ceiling-fan.wav');
    % [y2, ~] = audioread('speech_city-traffic.wav');
    % [y3, ~] = audioread('speech_pressure-cooker.wav');
    % [y4, ~] = audioread('speech_water-pump.wav');

    % Subtract each of the files from each other to remove background music
    % and only keep the noise
    y_12 = y1 - y2;
    y_13 = y1 - y3;
    y_14 = y1 - y4;
    y_23 = y2 - y3;
    y_24 = y2 - y4;
    y_34 = y3 - y4;
    
    % Perform cross-correlation of all six noise signals with the audio
    % file to find the peaks
    corr1 = xcorr(y_12, audio);
    corr2 = xcorr(y_13, audio);
    corr3 = xcorr(y_14, audio);
    corr4 = xcorr(y_23, audio);
    corr5 = xcorr(y_24, audio);
    corr6 = xcorr(y_34, audio);
    
    % Find the three results that give highest peaks
    max_arr = [max(corr1); max(corr2); max(corr3); max(corr4); max(corr5); max(corr6)];
    [~, index] = sort(max_arr,'descend');
    index = index(1:3);
    index = sort(index);

    if(index == [1; 2; 3])
        noiseType = 'Ceiling Fan';
    elseif(index == [1; 4; 5])
        noiseType = 'City Traffic';
    elseif(index == [2; 4; 6])
        noiseType = 'Pressure Cooker';
    elseif(index == [3; 5; 6])
        noiseType = 'Water Pump';
    else
        noiseType = 'Unknown';
    end

    % OPTIONAL: Plot the results of cross-correlation
    figure;
    subplot(3,2,1); plot(corr1);
    title('Ceiling Fan + City Traffic');
    xlabel('time (samples)');
    ylabel('Amplitude');
    subplot(3,2,2); plot(corr2);
    title('Ceiling Fan + Pressure Cooker');
    xlabel('time (samples)');
    ylabel('Amplitude');
    subplot(3,2,3); plot(corr3);
    title('Ceiling Fan + Water Pump');
    xlabel('time (samples)');
    ylabel('Amplitude');
    subplot(3,2,4); plot(corr4);
    title('City Traffic + Pressure Cooker');
    xlabel('time (samples)');
    ylabel('Amplitude');
    subplot(3,2,5); plot(corr5);
    title('City Traffic + Water Pump');
    xlabel('time (samples)');
    ylabel('Amplitude');
    subplot(3,2,6); plot(corr6);
    title('Pressure Cooker + Water Pump');
    xlabel('time (samples)');
    ylabel('Amplitude');

end