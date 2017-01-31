% Function to estimate the Voice and Unvoice part in a given audio sample
%
%The voice and unvoice part estimate with the help of Zero Crossing rate and Signal Energy
% Both factor utilize Zero Crossing rate and  Signal Energy for the same and Threshold is set to fragment in Voice and Unvoice part

clc
clear all
% Reading the audio samples file 
[audio_sample,Sampling_Rate,Bits_Per_Sample] = wavread('test10.wav');

audio_sample=audio_sample.';

% Computing the audio sample length
Sample_Length=length(audio_sample);

n = 0:Sample_Length-1;
time_duration = n*(1/Sampling_Rate); 

% Window creation for computation of Zero Crossing rate and Energy
%%wintype = 'triang'; % Check with Traingular Window also.
Win_Type = 'rectwin';
Win_Len = 201;
Win_Amp = [0.5,1]*(1/Win_Len);

%Zero crossing rate
%Computation of Zero Crossing rate w.r.t signal passing 0 axis
ZeroCrossing_Rate = ratezerocross(audio_sample,Win_Type,Win_Amp(1),Win_Len);

% Computation Average Energy  rate w.r.t analysing the Energy of Signal 
Average_Energy = avgenergy(audio_sample,Win_Type,Win_Amp(2),Win_Len);

% Time Compensation
out = (Win_Len-1)/2:(Sample_Length+Win_Len-1)-(Win_Len-1)/2;
t = (out-(Win_Len-1)/2)*(1/Sampling_Rate);

figure;
plot(time_duration,audio_sample); hold on;
plot(t,ZeroCrossing_Rate(out),'r','Linewidth',2); xlabel('t, seconds');
title('Short-time Zero Crossing Rate');
legend('signal','STZCR');

figure;
plot(time_duration,audio_sample); hold on;
plot(t,Average_Energy(out),'r','Linewidth',2); xlabel('t, seconds');
title('Short-time Energy');
legend('signal','STE');

%Merging ZCR and average energy
m1= winconv(ZeroCrossing_Rate(out),Win_Type,Win_Amp(1),Win_Len);
m2= winconv(Average_Energy(out),Win_Type,Win_Amp(2),Win_Len);
merg= m1.*m2;
merg= abs(merg);
figure;
plot(t,merg(out),'r','Linewidth',2);


T1= 2e-05;
T2= 5e-04;

for i= 1:1:length(merg)
    
if merg(1,i) < T1
    disp('silence');
    
elseif merg(1,i) < T2
    disp('unvoice');
    
else
    disp('voice');
  
end
end

%end of file



 

 

 
 
 









