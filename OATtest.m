%Original Adpative Thresh Benchmarks
testRiceIm = imread('Rice.jpg');
%profile on -timer 'performance' -timer 'processor' -timer 'real' -timer 'cpu'
tic
origRice = applyOriginalAdaptiveThresh(testRiceIm, 100);
toc
%newRice = applyImprovedAdaptiveThresh(riceIm, 110);
%p = profile('info')