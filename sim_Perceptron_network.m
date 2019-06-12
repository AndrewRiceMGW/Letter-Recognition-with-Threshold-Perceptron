%% Simulator - Letter recognition with threshold perceptron
%% D. Bernal-Casas
%% Version 10: 2019 - Adapted from the literature
%% Main Sources:
%% [1] Trappenberg 
%% [2] Dayan and Abbot
%% [3] Churchland and Sejnowski
%% [4] Rolls and Deco
%% [5] Izhikevich
%% [6] Wilson
%% [7] Gerstner

clear all;
close all;
hold off; 
clc;
nIn=12*13; nOut=26;
wOut=rand(nOut,nIn)-0.5; 
 
% training vectors 
load pattern1;
% pattern1 = rand(312,13);
% imshow(pattern1)

% Adding noise 
pattern1 = imnoise(pattern1,'salt & pepper',0.5);

imshow(pattern1)
rIn=reshape(pattern1', nIn, 26); 
rDes=diag(ones(1,26));

% Updating and training network 
 for training_step=1:80;
     
     % test all pattern
      rOut=(wOut*rIn)>0.5;
      distH=sum(sum((rDes-rOut).^2))/26; % hamming distance length between strings
      error(training_step)=distH;
     % training with delta rule
      wOut=wOut+0.1*(rDes-rOut)*rIn';  
 end

 plot(1:80,error)
 xlabel('Training step')
 ylabel('Average Hamming distance')
 