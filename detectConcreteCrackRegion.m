function [ filteredIm ] = detectConcreteCrackRegion( origIm, regionThresh )
    % This function applies the improved adaptive thresholding technique in
    %   along with other methods to detect cracks in concrete strcutures.
    
    % if needed, convert image to grayscale
    if numel(size(origIm)) > 2
        origIm = rgb2gray(origIm);
    end

    % Calculate histogram and get probability density function
    [numPixels] = imhist(origIm);
    probabilityFunction = numPixels/numel(origIm);
    probGrayLevel = find(probabilityFunction == max(probabilityFunction));
    
    [rowSize,colSize] = size(origIm);

    for ii = 1:rowSize
        for jj = 1:colSize

            if origIm(ii,jj) > probGrayLevel - regionThresh && origIm(ii,jj) < probGrayLevel + regionThresh
                origIm(ii,jj) = 255;
            else
                origIm(ii,jj) = 0;
            end

        end
    end

    filteredIm = origIm;
    filteredIm = imopen(filteredIm,strel('square',4));
    filteredIm = imdilate(filteredIm,strel('square',50));
    
end
