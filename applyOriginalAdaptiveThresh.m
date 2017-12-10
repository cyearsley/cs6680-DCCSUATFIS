function [ filteredIm ] = applyOriginalAdaptiveThresh( origIm, thresh )
    %This function applies the adaptive threshholding technique
    %   described in the research paper provided (Research Paper.pdf)

    % if needed, convert image to grayscale
    if numel(size(origIm)) > 2
        origIm = rgb2gray(origIm);
    end
    
    filteredIm = origIm;
    [rowSize,colSize] = size(origIm);
    
    for ii = 2:rowSize-1
        for jj = 2:colSize-1
            
            % branch 1
            if origIm(ii,jj) >= thresh
                
                %branch 2
                if origIm(ii-1,jj) < thresh
                    filteredIm(ii-1,jj-1) = 255;
                else
                    
                    %branch 3
                    if origIm(ii-1,jj+1) < thresh
                        filteredIm(ii-1,jj-1) = 255;
                    else
                        %branch 4
                        if origIm(ii-1,jj-1) < thresh
                            filteredIm(ii-1,jj-1) = 255;
                        else
                            
                            %branch 5
                            if origIm(ii,jj-1) < thresh
                                filteredIm(ii-1,jj-1) = 255;
                            else
                                
                                %branch 6
                                if origIm(ii,jj+1) < thresh
                                    filteredIm(ii-1,jj-1) = 255;
                                else
                                    
                                    %branch 7
                                    if origIm(ii+1,jj-1) < thresh
                                        filteredIm(ii-1,jj-1) = 255;
                                    else
                                        %branch 8
                                        if origIm(ii+1,jj+1) < thresh
                                            filteredIm(ii-1,jj-1) = 255;
                                        else
                                            
                                            %branch 9
                                            if origIm(ii+1,jj) < thresh
                                                filteredIm(ii-1,jj-1) = 255;
                                            else
                                                filteredIm(ii-1,jj-1) = 0;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            else
                filteredIm(ii-1,jj-1) = 0;
            end
        end
    end

    filteredIm = bwmorph(filteredIm, 'thin');
end
