function [ filteredIm ] = applyImprovedAdaptiveThresh( origIm, thresh )
    % This function is an improved version of the
    % original adaptive thresholding technique

    % if needed, convert image to grayscale
    if numel(size(origIm)) > 2
        origIm = rgb2gray(origIm);
    end
    
    filteredIm = origIm;
    [rowSize,colSize] = size(origIm);
    
    % using a 5x5 region, iterate over the image and find the edges...
    for ii = 3:rowSize-2
        for jj = 3:colSize-2
            
            if origIm(ii,jj) >= thresh
                imRegion = origIm(ii-2:ii+2,jj-2:jj+2);
                capThreshCount = 0;
                
                % find the number of pixels in the selected region that
                % meet the threshold requirement
                for regionIndex =  1:numel(imRegion)
                    if imRegion(regionIndex) < thresh
                       capThreshCount = capThreshCount + 1; 
                    end
                end
                
                % if the number of elements that met the threshold
                %   requirement were low, then this pixel is probably an
                %   edge.
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
    
    % Perform an open operation, and attempt to clean up some noise.
    %   NOTE: doing this in the original (proposed) method does NOT work!
    filteredIm = imopen(filteredIm,ones(2));
    filteredIm = bwmorph(filteredIm, 'thin');
    filteredIm = bwmorph(filteredIm, 'clean');
    filteredIm = bwareaopen(filteredIm, 50);
end

