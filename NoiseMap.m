function [ Map ] = NoiseMap(im ,BlockSize)
    YCbCr = double(rgb2ycbcr(im));
    Y = YCbCr(:,:,1);
    % cA is approximate component 
    % cH is horizontal detail component 
    % cV is vertical detail component 
    % cD is diagonal detail component
    [cA1,cH,cV,cD] = dwt2(Y,'db8');
    
    cD = cD(1:floor(size(cD,1)/BlockSize)*BlockSize,1:floor(size(cD,2)/BlockSize)*BlockSize);
    Block = zeros(floor(size(cD,1)/BlockSize),floor(size(cD,2)/BlockSize),BlockSize.^2);
    
    for ii = 1:BlockSize:size(cD,1)-1
        for jj = 1:BlockSize:size(cD,2)-1
            blockElements = cD(ii:ii+BlockSize-1,jj:jj+BlockSize-1);
            Block((ii-1)/BlockSize+1,(jj-1)/BlockSize+1,:) = reshape(blockElements,[1 1 numel(blockElements)]);
        end
    end
    
    Map = median(abs(Block),3)./0.6745;    
end