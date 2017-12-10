function [ filteredIm ] = detectConcreteCracks( origIm )
    % Function attempts to detect cracks in concrete structures.
    %   This function uses the following:
    %       1) concreteRegion - finds concrete regions
    %       2) applyImprovedAdaptiveThresh - improved research method
    
    %@param origIm - the original concrete image
    %@return filteredIm - the filtered concrete image

    % query the concrete regions
    concreteRegion = detectConcreteCrackRegion(origIm,20);
    
    % query the edges of the image
    initialImageEdge = applyImprovedAdaptiveThresh(origIm, 100);
    
    % Find the intersection between the concrete regions and the detected
    % edges.
    filteredIm = logical(concreteRegion) & logical(initialImageEdge);
end

