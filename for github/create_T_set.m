save_directory = 'E:\Trails and Tribunals\DummyData\pappu';  %the folder
nametemplate = 'image_%04d.tif';  %name pattern
imnum = 0;        %starting image number
camera = webcam;
for K = 1 : 100   %if you want to do this 50 times
   queryFace = camera.snapshot; %capture the image
   faceDetector = vision.CascadeObjectDetector();
   bbox = step(faceDetector, queryFace);
   if bbox
    queryFace = imcrop(queryFace,[bbox(1)-50 bbox(2)-50 bbox(3)+50 bbox(4)+50]);
    scaleFactor = 150/size(queryFace,1);
    queryFace = imresize(queryFace, scaleFactor);
    image(queryFace);
    title(imnum);
    imnum = imnum + 1;
    thisfile = sprintf(nametemplate, imnum);  %create filename
    fullname = fullfile(save_directory, thisfile);  %folder and all
    imwrite( queryFace, fullname);  %write the image there as tif
   end
end
close all;
clear all;