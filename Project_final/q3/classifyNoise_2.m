%% Function 3: Noise classification

function classifyNoise_2(audio)
    % Extract part of signal from each audio file where maximum noise
    % is present to use as base signals for comparison
    % In given audio files, this is in the time interval (30, 40)
    startTime = 30;
    endTime = 40;
    
    [y1, fs1] = audioread('music_ceiling-fan.wav');
    startIndex = round(startTime * fs1) + 1;
    endIndex = round(endTime * fs1);
    extractedSignal1 = y1(startIndex:endIndex);
    
    [y2, fs2] = audioread('music_city-traffic.wav');
    startIndex = round(startTime * fs2) + 1;
    endIndex = round(endTime * fs2);
    extractedSignal2 = y2(startIndex:endIndex);
    
    [y3, fs3] = audioread('music_pressure-cooker.wav');
    startIndex = round(startTime * fs3) + 1;
    endIndex = round(endTime * fs3);
    extractedSignal3 = y3(startIndex:endIndex);
    
    [y4, fs4] = audioread('music_water-pump.wav');
    startIndex = round(startTime * fs4) + 1;
    endIndex = round(endTime * fs4);
    extractedSignal4 = y4(startIndex:endIndex);
    
    y_12 = extractedSignal1 - extractedSignal2;
    y_13 = extractedSignal1 - extractedSignal3;
    y_14 = extractedSignal1 - extractedSignal4;
    y_23 = extractedSignal2 - extractedSignal3;
    y_24 = extractedSignal2 - extractedSignal4;
    y_34 = extractedSignal3 - extractedSignal4;

    corr1 = xcorr(y_12, audio);
    corr2 = xcorr(y_13, audio);
    corr3 = xcorr(y_14, audio);
    corr4 = xcorr(y_23, audio);
    corr5 = xcorr(y_24, audio);
    corr6 = xcorr(y_34, audio);

    figure;
    subplot(3,2,1); plot(corr1); title('12');
    subplot(3,2,2); plot(corr2); title('13');
    subplot(3,2,3); plot(corr3); title('14');
    subplot(3,2,4); plot(corr4); title('23');
    subplot(3,2,5); plot(corr5); title('24');
    subplot(3,2,6); plot(corr6); title('34');

    max_arr = [max(corr1); max(corr2); max(corr3); max(corr4); max(corr5); max(corr6)];
    [~, index] = sort(max_arr,'descend');
    index = index(1:3);
    index = sort(index);
    % disp(index);
    
    if(index == [1; 2; 3])
        disp("Noise = Ceiling Fan");
    elseif(index == [1; 4; 5])
        disp("Noise = City Traffic");
    elseif(index == [2; 4; 6])
        disp("Noise = Pressure Cooker");
    elseif(index == [3; 5; 6])
        disp("Noise = Water Pump");
    else
        disp("Noise = Unknown");
    end

    % % Perform cross-correlation of all extracted signals with the audio
    % % file and find the highest peak for all the results
    % corr_result1 = xcorr(extractedSignal1, audio);
    % [max_corr1, max_index1] = max(corr_result1);
    % 
    % corr_result2 = xcorr(extractedSignal2, audio);
    % [max_corr2, max_index2] = max(corr_result2);
    % 
    % corr_result3 = xcorr(extractedSignal3, audio);
    % [max_corr3, max_index3] = max(corr_result3);
    % 
    % corr_result4 = xcorr(extractedSignal4, audio);
    % [max_corr4, max_index4] = max(corr_result4);
    % 
    % % Find the signal which gives highest peak among all four signal
    % corr_result = [max_corr1; max_corr2; max_corr3; max_corr4];
    % [~, index] = max(corr_result);
    % 
    % % Signal which gives the peak with maximum value is the noise present
    % % in audio file
    % if(index==1)
    %     noiseType = 'Ceiling Fan';
    % elseif(index==2)
    %     noiseType = 'City Traffic';
    % elseif(index==3)
    %     noiseType = 'Pressure Cooker';
    % elseif(index==4)
    %     noiseType = 'Water Pump';
    % end
    % 
    % % Define a time axis which has same length as correlation result
    % max_time = max(length(audio),length(extractedSignal4));
    % time_axis = -(max_time-1):max_time-1;
    % 
    % % OPTIONAL: Display the maximum value of cross-correlation and the
    % % sample at which it occurs
    % time_lag1 = time_axis(max_index1);
    % fprintf('Maximum cross-correlation for ceiling fan at time lag: %d samples \n     %f\n\n', time_lag1, max_corr1);
    % time_lag2 = time_axis(max_index2);
    % fprintf('Maximum cross-correlation for city traffic at time lag: %d samples \n     %f\n\n', time_lag2, max_corr2);
    % time_lag3 = time_axis(max_index3);
    % fprintf('Maximum cross-correlation for pressure cooker at time lag: %d samples \n     %f\n\n', time_lag3, max_corr3);
    % time_lag4 = time_axis(max_index4);
    % fprintf('Maximum cross-correlation for water pump at time lag: %d samples \n     %f\n\n', time_lag4, max_corr4);
    % 
    % % OPTIONAL: Plot the results of cross-correlation
    % figure;
    % subplot(2,2,1);
    % plot(time_axis, corr_result1);
    % xlabel('time(samples)');
    % ylabel('Amplitude');
    % title('Ceiling Fan');
    % xlim([-(max_time-1) max_time-1]);
    % subplot(2,2,2);
    % plot(time_axis, corr_result2);
    % xlabel('time(samples)');
    % ylabel('Amplitude');
    % title('City Traffic');
    % xlim([-(max_time-1) max_time-1]);
    % subplot(2,2,3);
    % plot(time_axis, corr_result3);
    % xlabel('time(samples)');
    % ylabel('Amplitude');
    % title('Pressure Cooker');
    % xlim([-(max_time-1) max_time-1]);
    % subplot(2,2,4);
    % plot(time_axis, corr_result4);
    % xlabel('time(samples)');
    % ylabel('Amplitude');
    % title('Water Pump');
    % xlim([-(max_time-1) max_time-1]);

end