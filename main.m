exampleIm1 = imread('ConcreteCrackImages/DSCN1351.JPG');
exampleIm2 = imread('ConcreteCrackImages/DSCN1352.JPG');
exampleIm3 = imread('ConcreteCrackImages/DSCN1319.JPG');
exampleIm4 = imread('ConcreteCrackImages/DSCN1318.JPG');
riceIm = imread('Rice.jpg');

origRice = applyOriginalAdaptiveThresh(riceIm, 100);
newRice = applyImprovedAdaptiveThresh(riceIm, 100);

figure('Name', 'Rice Comparison');
subplot(1,2,1), imshow(origRice);
title('Original Rice');
subplot(1,2,2), imshow(newRice);
title('New Rice');
