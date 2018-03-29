%% Training of set 
allImages = imageDatastore('E:\Trails and Tribunals\DummyData', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
[trainingImages, testImages] = splitEachLabel(allImages, 0.8, 'randomize');
alex = alexnet;
layers = alex.Layers;
layers(23) = fullyConnectedLayer(3);
layers(25) = classificationLayer;
opts = trainingOptions('sgdm', 'InitialLearnRate', 0.001, 'MaxEpochs', 20, 'MiniBatchSize', 64);
trainingImages.ReadFcn = @readFunctionTrain;
dummyNet = trainNetwork(trainingImages, layers, opts);
testImages.ReadFcn = @readFunctionTrain;
predictedLabels = classify(dummyNet, testImages);
accuracy = mean(predictedLabels == testImages.Labels)
save dummyNet;

close all;

% Copyright 2017 The MathWorks, Inc.

 

function I = readFunctionTrain(filename)
% Resize the flowers images to the size required by the network.
I = imread(filename);

I = imresize(I, [227 227]);
end

