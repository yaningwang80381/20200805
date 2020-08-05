%% An example using one phantom. If testing multiple phantoms,please repeat the procedure
clear all
close all
clc
load('channel_data');%load corresponding channeldata
load('multi8.mat');%load corresponding groundtruth 
 for i = 1:75 %75 is the number of single plane wave
 temp1 = channel_data.data(:,:,i);
 temp2 = temp1(1:1527,1:size(temp1,2));
 temp4 = imresize(temp2,[256 256],'bilinear');
 temp4 = rescale(temp4,-60,0);
 temp5 = [multi,temp4];temp5 = rescale(temp5,0,1);
 imwrite(temp5, strcat(num2str(i),'.jpg'));
 end
%the .jpg file will be used in next step 'saved_model'.ipynb