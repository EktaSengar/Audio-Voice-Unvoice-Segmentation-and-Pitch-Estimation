
%% Function for computing the average energy w.r.t window
% Function Input:
%   Audio sample and window 
% Function Opr:
%   Computing the average energy  wrt window
% Function Output:
%   Average Energy  w.r.t window
% Start of File

%%function En = avgenergy(x,wintype,winamp,winlen)
function Avg_Energy = avgenergy(ip_samples,Win_Type,Win_Amp,Win_Len)
%%%%error(nargchk(1,4,nargin,'struct'));
% Defining The Window for Energy Computation
Win_Type=Win_Type;
Win_Amp=Win_Amp;
Win_Len=Win_Len;
% Generating Window for Energy Computation
win = (Win_Amp*(window(str2func(Win_Type),Win_Len))).';

% Squaring the Sample values to compute the Avg Energy
sqr_ip_samples = ip_samples.^2;
Energy = winconv(sqr_ip_samples,Win_Type,Win_Amp,Win_Len);
Avg_Energy=Energy;
Average_Energy=Avg_Energy;
% End of File