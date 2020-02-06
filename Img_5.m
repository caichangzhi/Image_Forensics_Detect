clc;
close all;

im = 'Img_5.jpg';          % Read the image

im22 = imread(im);
[row,col] = size(im22);

OutputMap = analyze(im);

[m,n] = size(OutputMap);
img = OutputMap;
for i = 1:m
    for j = 1:n
        if(img(i,j) < 3.5)  % Set the threshold
            img(i,j) = 0;
        else
            img(i,j) = 255;
        end
    end
end

im2 = uint8(img);

A2 = imresize(im2,32);
se1 = strel('disk',16);       % Create a flat disc structure element with a radius of 16
A3 = imerode(A2,se1);
figure;imshow(im22)
figure;imshow(A3)