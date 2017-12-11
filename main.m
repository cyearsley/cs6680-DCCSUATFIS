exampleIm1 = imread('ConcreteCrackImages/DSCN1351.JPG');
exampleIm2 = imread('ConcreteCrackImages/DSCN1352.JPG');
exampleIm3 = imread('ConcreteCrackImages/DSCN1319.JPG');
exampleIm4 = imread('ConcreteCrackImages/DSCN1318.JPG');
exampleIm5 = imread('ConcreteCrackImages/DSCN1372.JPG');
exampleIm7 = imread('ConcreteCrackImages/DSCN1324.JPG');
riceIm = imread('Rice.jpg');
cameraIm = imread('camera.png');

origRice = applyOriginalAdaptiveThresh(riceIm, 100);
newRice = applyImprovedAdaptiveThresh(riceIm, 110);
cannyRice = edge(riceIm,'Canny');

figure('Name', 'Rice Comparison 1');
subplot(1,4,1), imshow(riceIm);
title('Original Image');
subplot(1,4,2), imshow(origRice);
title('Original Proposed Method');
subplot(1,4,3), imshow(newRice);
title('Improved Proposed Method');
subplot(1,4,4), imshow(cannyRice);
title('Canny Edge Detection');

pause;

newConcrete = applyOriginalAdaptiveThresh(riceIm, 100);
cannyConcrete = edge(riceIm,'Canny');

figure('Name', 'Rice Comparison 2');
subplot(1,3,1), imshow(riceIm);
title('Original Image');
subplot(1,3,2), imshow(newConcrete);
title('Proposed Method');
subplot(1,3,3), imshow(cannyConcrete);
title('Canny Edge Detection');

pause;

origConcIm1 = applyOriginalAdaptiveThresh(exampleIm1, 100);

figure('Name', 'Concrete Comparison 1');
subplot(1,2,1), imshow(exampleIm1);
title('Original Image');
subplot(1,2,2), imshow(origConcIm1);
title('Proposed Method');

pause;

origConcIm2 = applyOriginalAdaptiveThresh(exampleIm5, 100);

figure('Name', 'Concrete Comparison 2');
subplot(1,2,1), imshow(exampleIm5);
title('Original Image');
subplot(1,2,2), imshow(origConcIm2);
title('Proposed Method');

pause;

cameraIm1 = applyOriginalAdaptiveThresh(cameraIm, 100);

figure('Name', 'Camera Comparison 1');
subplot(1,2,1), imshow(cameraIm);
title('Original Image');
subplot(1,2,2), imshow(cameraIm1);
title('Proposed Method');

pause;

origConcIm3 = applyOriginalAdaptiveThresh(exampleIm1, 80);
improvedConcIm3 = detectConcreteCracks(exampleIm1);

figure('Name', 'Concrete Comparison 3');
subplot(1,2,1), imshow(origConcIm3);
title('Proposed Method');
subplot(1,2,2), imshow(improvedConcIm3);
title('Improved Proposed Method');

pause;

origConcIm4 = applyOriginalAdaptiveThresh(exampleIm3, 80);
improvedConcIm4 = detectConcreteCracks(exampleIm3);

figure('Name', 'Concrete Comparison 4');
subplot(1,2,1), imshow(origConcIm4);
title('Proposed Method');
subplot(1,2,2), imshow(improvedConcIm4);
title('Improved Proposed Method');

pause;

cannyConcrete = edge(rgb2gray(cameraIm),'Canny', 0.3);
improvedConcIm5 = applyImprovedAdaptiveThresh(cameraIm, 90);

figure('Name', 'Concrete Comparison 5');
subplot(1,2,1), imshow(improvedConcIm5);
title('Improved Proposed Method');
subplot(1,2,2), imshow(cannyConcrete);
title('Canny Method');

pause;

close all;
