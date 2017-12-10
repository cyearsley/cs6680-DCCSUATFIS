exampleIm1 = imread('ConcreteCrackImages/DSCN1351.JPG');
exampleIm2 = imread('ConcreteCrackImages/DSCN1352.JPG');
exampleIm3 = imread('ConcreteCrackImages/DSCN1319.JPG');
exampleIm4 = imread('ConcreteCrackImages/DSCN1318.JPG');
exampleIm5 = imread('ConcreteCrackImages/DSCN1372.JPG');
exampleIm6 = imread('ConcreteCrackImages/DSCN1311.JPG');
riceIm = imread('Rice.jpg');

origRice = applyOriginalAdaptiveThresh(riceIm, 100);
newRice = applyImprovedAdaptiveThresh(riceIm, 110);
cannyRice = edge(riceIm,'Canny');

figure('Name', 'Rice Comparison');
subplot(1,4,1), imshow(riceIm);
title('Original Image');
subplot(1,4,2), imshow(origRice);
title('Original Proposed Method');
subplot(1,4,3), imshow(newRice);
title('Improved Proposed Method');
subplot(1,4,4), imshow(cannyRice);
title('Canny Edge Detection');

pause;

newConcrete = applyImprovedAdaptiveThresh(exampleIm1, 100);
cannyConcrete = applyOriginalAdaptiveThresh(exampleIm1, 100);

figure('Name', 'Concrete Comparison 1');
subplot(1,2,1), imshow(newConcrete);
title('Improved Proposed Method');
subplot(1,2,2), imshow(cannyConcrete);
title('Canny Edge Detection');

pause;

close all;
