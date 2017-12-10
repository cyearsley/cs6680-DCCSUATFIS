function [ borderedIm ] = addImageBorder( origIm, borderSize )
    % Adds a border to the image of size <borderSize>

    %@param origIm - the original grayscale OR rgb image
    %@param borderSize - the size of the border around the image
    %@return borderedIm - the origIm will border size of <borderSize>
    
    [rowSize,colSize] = size(origIm);
    rowSize = rowSize+(borderSize*2);
    colSize = colSize+(borderSize*2);
    
    borderedIm = zeros(rowSize,colSize);
    borderedIm(borderSize+1:rowSize-borderSize,borderSize+1:colSize-borderSize) = origIm(:,:);
    borderedIm = uint8(borderedIm);
end

