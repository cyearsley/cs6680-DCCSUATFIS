
%Improved Adpative Thresh Benchmarks
testRiceIm = imread('Rice.jpg');
%profile on -timer 'performance' -timer 'processor' -timer 'real' -timer 'cpu'
tic
newRice = applyImprovedAdaptiveThresh(testRiceIm, 100);
toc

%p = profile('info')