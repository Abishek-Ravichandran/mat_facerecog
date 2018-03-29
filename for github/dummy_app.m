 clear
 camera = webcam;
 load dummyNet;
 nnet = dummyNet;
 while true
     flag=0;
 picture = camera.snapshot;
 image(picture);
 faceDetector = vision.CascadeObjectDetector();
 bbox = step(faceDetector, picture);
 if bbox   
    picture = imcrop(picture,[bbox(1)-50 bbox(2)-50 bbox(3)+50 bbox(4)+50]);
    scaleFactor = 150/size(picture,1);
    picture = imresize(picture, scaleFactor);
    picture = imresize(picture,[227,227]);
    label = classify(nnet, picture);
    flag=1;
 end
 image(picture);
 if flag
 title(char(label));
 end
 drawnow;
 end
 