img = im2double(imresize(imread('coin_1.jpg'),1));
gray = rgb2gray(img);
[row col] = size(gray);

gaussian_f = fspecial('gaussian',5,3);
blurred = imfilter(gray,gaussian_f);
max = max(blurred)
for c = 1:col
    for r = 1:row
        blurred(r,c) = blurred(r,c)/max(blurred)
    end
end

imtool(blurred)

