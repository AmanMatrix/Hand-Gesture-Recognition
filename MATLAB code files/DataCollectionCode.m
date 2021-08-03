%Code for Data Collection%

clc
clear all
close all
warning off
cam=webcam;
pX=0;
pY=0;
pHeight=250;
pWidth=250;
pArea=[pX pY pHeight pWidth];
counter=0;
while counter<=300
    full_img=cam.snapshot;
    iFaces = insertObjectAnnotation(full_img,'rectangle',pArea,'Processing Area');   
imshow(iFaces);
filename=strcat(num2str(counter),'.bmp');
final_img=imcrop(full_img,pArea);
final_img=imresize(final_img,[227 227]);
    imwrite(final_img,filename);
    counter=counter+1;
    drawnow;
end
clear c;