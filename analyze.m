function OutputMap = analyze( imPath )
    % Define the block size
    BlockSize=8;
    % Converted to 3-channel uint8 images.
    % im = CleanUpImage(imPath);
    im = imread(imPath);
    OutputMap = NoiseMap(im, BlockSize);
end