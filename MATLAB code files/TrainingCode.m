%Code for training:

clc
clear all
close all
warning off
net=alexnet;
layers=net.Layers;
layers(23)=fullyConnectedLayer(7);
layers(25)=classificationLayer;
allImages=imageDatastore('Hand Dataset','IncludeSubfolders',true, 'LabelSource','foldernames');
opts=trainingOptions('sgdm','InitialLearnRate',0.001,'MaxEpochs',20,'MiniBatchSize',64);
trainedNet=trainNetwork(allImages,layers,opts);
save trainedNet;

