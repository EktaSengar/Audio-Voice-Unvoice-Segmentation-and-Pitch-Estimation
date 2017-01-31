  
 %Function to estimate Pitch
 clc
 clear all

 % Reading the first audio samples file
 [audio_sample_1,Sampling_Rate_1,Bits_Per_Sample_1] = wavread('test10.wav');
 fs=10125;
 audio_sample_1=audio_sample_1.';

 % Computing the audio sample length
 Sample_Length_1=length(audio_sample_1);

 n = 0:Sample_Length_1-1;
 time_duration_1 = n*(1/Sampling_Rate_1); 
 
 figure;
 plot(time_duration_1,audio_sample_1)
 
 %Computation of time frame, pitch contour and average pitch frequency
 [tf_1, f0_1, avgF0_1] = pitch(audio_sample_1,fs);
 figure;
 plot(time_duration_1,audio_sample_1); hold on;
 plot(tf_1,f0_1,'r','Linewidth',2); xlabel('time frame');
 title('Short-time Pitch1');
 legend('signal','Pitch contour');
 
 % Reading the second audio samples file
 [audio_sample_2,Sampling_Rate_2,Bits_Per_Sample_2] = wavread('test7.wav');
 
 audio_sample_2=audio_sample_2.';

 % Computing the audio sample length
 Sample_Length_2=length(audio_sample_2);

 n = 0:Sample_Length_2-1;
 time_duration_2 = n*(1/Sampling_Rate_2); 
 
 figure;
 plot(time_duration_2,audio_sample_2)
 
 
 [tf_2, f0_2, avgF0_2] = pitch(audio_sample_2,fs);
 figure;
 plot(time_duration_2,audio_sample_2); hold on;
 plot(tf_2,f0_2,'r','Linewidth',2); xlabel('time frame');
 title('Short-time Pitch2');
 legend('signal','Pitch contour');
  
  
%Differentiate male and female voice
T1= 60;
T2= 170;
T3= 430;
  
  
%threshold Male (Pitch range:60-170)
%Female (Pitch range:170-430)
%Higher Pitch (>400)
%Lower Pitch (<60)

X= [avgF0_1 avgF0_2];

for i= 1:1:length(X)

if X(1,i) < T1
    disp(sprintf('audio_sample_%d is Lower Pitch',i));
    
elseif X(1,i) < T2
    disp(sprintf('audio_sample_%d is Male Voice',i));
    
elseif X(1,i) < T3
    disp(sprintf('audio_sample_%d is Female Voice',i));

else
    disp(sprintf('audio_sample_%d is Higher Pitch',i));
  
end
end
%end of file
  
 