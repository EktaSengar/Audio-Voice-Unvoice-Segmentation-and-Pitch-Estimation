%% Function for computing the zero crossing rate w.r.t window
% Function Input:
%   Audio sample and window 
% Function Opr:
%   Computing the ZeroCrossingRate wrt window
% Function Output:
%   ZeroCrossingrate w.r.t window
% Start of File

%%%%function zc = zerocross(x,wintype,winamp,winlen)
function ZeroCrossing_Rate = ratezerocross(ip_samples,win_type,win_amp,win_len)
error(nargchk(1,4,nargin,'struct'));

% Defining The Low pass Filter wrt incoming parameter
LP_Filter_Type=win_type;
LP_Filter_Amp=win_amp;
LP_Filter_Len=win_len;

% For computing the first order
% Generating x[n] and 1 Delay sequence x[n-1]
IP_Sequence_1Delay= [0, ip_samples(1:end-1)];
IP_Sequence=ip_samples;

% Generating the Frist Order Difference 
FristOrderDiff= sgn(IP_Sequence)-sgn(IP_Sequence_1Delay);

% Computing the only maginutde part ignoring the sign
MagFristOrderDiff = abs(FristOrderDiff);

% Filtering from Low Pass Filter wrt Window
ZCR_Win = winconv(MagFristOrderDiff,LP_Filter_Type,LP_Filter_Amp,LP_Filter_Len);


ZeroCrossing_Rate=ZCR_Win;
%End of File 