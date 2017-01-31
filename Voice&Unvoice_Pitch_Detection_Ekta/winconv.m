%% Function for convolution w.r.t window
% Function Input:
%   Audio sample and window details 
% Function Opr:
%   Computing the convolution
% Function Output:
%   Convolve Vaule
% Start of File

%%%%%function y = win_conv(x,varargin)
function conv_value = winconv(ip_samples,Win_Type,Win_Amp,Win_Len)
%%%%En = winconv(ip_samples,Win_Type,Win_Amp,Win_Len);
%% Function for computing the average energy w.r.t window
% Function Input:
%   	Audio sample and window 
% Function Opr:
%   	Computing the average energy  wrt window
% Function Output:
%   	Avergae Energy  w.r.t window
% Start of File

% generate the window
w1 = (window(str2func(Win_Type),Win_Len)).'; Win_Amp = Win_Amp(:).';
w = Win_Amp.*w1;

% perform the convolution using FFT
NFFT = 2^(nextpow2(length(ip_samples)+Win_Len));
X = fft(ip_samples,NFFT); W = fft(w,NFFT);
Y = X.*W;
y = ifft(Y,NFFT);

conv_value=y;

% End of the File
    