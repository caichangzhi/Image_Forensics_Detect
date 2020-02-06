clc;
close all;

im = 'Img_3.jpg';        % Read the image

im22 = imread(im);
[row,col] = size(im22);

OutputMap = analyze(im);

[m,n] = size(OutputMap);
img = OutputMap;
for i = 1:m
    for j = 1:n
        if(img(i,j) < 1)  % Set the thereshold
            img(i,j) = 0;
        else
            img(i,j) = 255;
        end
    end
end

im2 = uint8(img);
se1=strel('disk',1);       % Create a flat disc structure element with a radius of 1
A2=imerode(im2,se1);

A2 = imresize(A2,16);
figure;imshow(im22)
figure;imshow(A2)