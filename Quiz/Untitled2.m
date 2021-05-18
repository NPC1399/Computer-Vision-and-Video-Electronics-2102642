Im = imresize(im2double(imread('test_circuit.jpg')),0.25);
[row col] = size(Im);
col = col/3;
gray = rgb2gray(Im);
color = zeros(row,col);
color = cat(3,gray,gray,gray);
imshow(color);