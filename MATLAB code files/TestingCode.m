%Code for testing:

clc;
close all;
clear all
warning off
cam=webcam;
load trainedNet;
pX=0;
pY=0;
pHeight=250;
pWidth=250;
pArea=[pX pY pHeight pWidth];
while true
    full_img=cam.snapshot;
    iFaces = insertObjectAnnotation(full_img,'rectangle',pArea,'Processing Area');   
		final_img=imcrop(full_img,pArea);
    final_img=imresize(final_img,[227 227]);
    label=classify(trainedNet,final_img);
    imshow(iFaces);
    title(char(label));
    drawnow;
end