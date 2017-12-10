function [ filteredIm ] = detectConcreteCracks( origIm )
    % Function attempts to detect cracks in concrete structures.

    concreteRegion = detectConcreteCrackRegion(origIm,20);
    initialImageEdge = applyImprovedAdaptiveThresh(origIm, 100);
    
    filteredIm = logical(concreteRegion) & logical(initialImageEdge);
end

