function [ filteredIm ] = applyImprovedAdaptiveThresh( origIm, thresh )
    % This function is an improved version of the
    % original adaptive thresholding technique

    % if needed, convert image to grayscale
    if numel(size(origIm)) > 2
        origIm = rgb2gray(origIm);
    end
    
    filteredIm = origIm;
    [rowSize,colSize] = size(origIm);
    
    for ii = 3:rowSize-2
        for jj = 3:colSize-2
            if origIm(ii,jj) >= thresh
                imRegion = origIm(ii-2:ii+2,jj-2:jj+2);
                capThreshCount = 0;
                
                for regionIndex =  1:numel(imRegion)
                    if imRegion(regionIndex) < thresh
                       capThreshCount = capThreshCount + 1; 
                    end
                end
                
                if abs(capThreshCount - numel(imRegion)) < numel(imRegion)
                    filteredIm(ii,jj) = 255;
                else
                    filteredIm(ii,jj) = 0;
                end
            else
                filteredIm(ii, jj) = 0;
            end
        end
    end
    
    filteredIm = imopen(filteredIm,ones(2));
    filteredIm = bwmorph(filteredIm, 'thin');
    filteredIm = bwmorph(filteredIm, 'clean');
end

