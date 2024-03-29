function Hd = lowpassfilter
%LOWPASSFILTER 返回离散时间滤波器对象。

% MATLAB Code
% Generated by MATLAB(R) 9.9 and Signal Processing Toolbox 8.5.
% Generated on: 26-Jan-2021 11:47:11

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 600;  % Sampling Frequency

Fpass = 100;             % Passband Frequency
Fstop = 150;             % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
