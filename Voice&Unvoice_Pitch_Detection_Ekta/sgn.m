%% Function for computing the Sign values
% Function Input:
%   Audio sample and window 
% Function Opr:
%   Computing the sgn values It is 2 level quantisation process 
% Function Output:
%   Sgn Values 1 or -1
% Start of File
function qunt_data_samples = sgn(data_samples)
qunt_data_samples = (data_samples>=0) + (-1)*(data_samples<0);
% End of File