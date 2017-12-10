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
                if min(imRegion(:)) < thresh
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

