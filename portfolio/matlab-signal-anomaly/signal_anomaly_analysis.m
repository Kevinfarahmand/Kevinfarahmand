%% MATLAB Signal Analysis and Anomaly Detection Portfolio Project
% Author: Hadi Farahmandi
% Purpose: Demonstrate MATLAB skills for engineering signal analysis,
% denoising, frequency-domain inspection, and anomaly detection.
clear; clc; close all;
rng(42);
fs = 200; duration = 20; t = (0:1/fs:duration-1/fs)';
cleanSignal = 1.2*sin(2*pi*2.2*t) + 0.35*sin(2*pi*11*t);
x = cleanSignal + 0.18*randn(size(t));
events = [4.2 2.8 0.12; 9.7 -3.2 0.16; 14.8 2.5 0.10; 17.3 -2.7 0.14];
for k = 1:size(events,1)
    center=events(k,1); amp=events(k,2); width=events(k,3);
    mask=abs(t-center)<width;
    x(mask)=x(mask)+amp*exp(-((t(mask)-center)/(width/3)).^2);
end
windowSamples=101;
baseline=movmedian(x,windowSamples);
residual=x-baseline;
localMAD=movmedian(abs(residual),windowSamples);
robustSigma=1.4826*max(localMAD,eps);
robustZ=abs(residual)./robustSigma;
threshold=5.0; isAnomaly=robustZ>threshold;
N=length(x); X=fft(x-mean(x));
f=(0:floor(N/2))'*fs/N; mag=abs(X(1:floor(N/2)+1))/N;
fprintf('Samples: %d\n',N);
fprintf('Detected anomaly samples: %d\n',nnz(isAnomaly));
figure('Color','w');
plot(t,x,'DisplayName','Noisy signal'); hold on;
plot(t,baseline,'LineWidth',1.3,'DisplayName','Rolling median');
plot(t(isAnomaly),x(isAnomaly),'r.','MarkerSize',10,'DisplayName','Detected anomalies');
xlabel('Time (s)'); ylabel('Amplitude'); title('Signal Analysis and Anomaly Detection'); legend('Location','best'); grid on;
figure('Color','w'); plot(f,mag,'LineWidth',1.1); xlim([0 30]);
xlabel('Frequency (Hz)'); ylabel('Magnitude'); title('Frequency Spectrum'); grid on;
results=table(t,x,baseline,robustZ,isAnomaly,'VariableNames',{'Time_s','Signal','RollingMedian','RobustZ','IsAnomaly'});
writetable(results,'signal_analysis_results.csv');
fprintf('Analysis complete. Results saved to signal_analysis_results.csv\n');
