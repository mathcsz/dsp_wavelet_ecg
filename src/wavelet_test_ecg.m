% ECG signal denoising with Wavelet Daubechies 4

% Load the Signal package 
pkg load signal

% ECG signal with 60HZ noise
noiseMV = 0;
fs = 512;
[ecg, p] = ecgsyn(fs, 3, noiseMV);
ecg = ecg';
t = [0:1/fs:100](1:length(ecg));
n = sin(2 * pi * 60 * t);
ecgN = ecg + n;

% Decomposition filters from 'db4' (http://wavelets.pybytes.com/wavelet/db4/)
db4Lp = [-0.0105974, 0.03288301, 0.03084138, -0.1870348, -0.0279837, 0.63088076, 0.71484657, 0.23037781];
db4Hp = [-0.2303778, 0.71484657, -0.6308807, -0.0279837, 0.18703481, 0.03084138, -0.0328830, -0.0105974];

printWfilters(db4Hp, db4Lp);

[i, c] = fwtNlevel(ecgN, db4Hp, db4Lp, 3);
[a3, d3, d2, d1] = getWcoef(c, i);

figure;
grid on;
subplot(5, 1, 1);
plot(t, ecg); 
xlabel("ECG");

subplot(5, 1, 2);
plot(t, ecgN); 
xlabel("ECG + NOISE");

subplot(5, 1, 3);
plot(a3); 
xlabel("A");

subplot(5, 1, 4);
plot(d3); 
xlabel("D3");

subplot(5, 1, 5);
plot(d2); 
xlabel("D2");