Im = imresize(im2double(imread('test_circuit.jpg')),0.25);
[row col] = size(Im);
col = col/3;
grayscale = zeros(row,col);
for r = 1:row
    for c = 1:col
        grayscale(r,c) = Im(r,c,1)*0.3 + Im(r,c,2)*0.59 + Im(r,c,3)*0.11;
    end
end
figure;imshow(Im);
figure;imshow(grayscale);title("own grayscale");
figure;imshow(rgb2gray(Im));