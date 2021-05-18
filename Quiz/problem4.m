Im = imresize(rgb2gray(imread('test_circuit.jpg')),0.25);
Im = im2double(Im);
[row col] = size(Im);
horizontal = [-1 -2 -1;0 0 0;1 2 1];
vertical = [-1 0 1;-2 0 2;-1 0 1];
Imx = imfilter(Im,horizontal);
Imy = imfilter(Im,vertical);
figure;imshow(Imx);title("gradient x");
figure;imshow(Imy);title("gradient y");
gradient_mag = zeros(row,col);
for r = 1:row
    for c = 1:col
        gradient_mag(r,c) = sqrt(Imx(r,c)^2 + Imy(r,c)^2);
    end
end
figure;imshow(gradient_mag);title("gradient magnitude");

