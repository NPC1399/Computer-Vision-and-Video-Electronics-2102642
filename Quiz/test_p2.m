Im = im2double(imresize(rgb2gray(imread('test_circuit.jpg')),0.25));
Noise1 = imnoise(Im,'gaussian',0,0.05);
Noise2 = imnoise(Im,'gaussian',0,0.05);
Noise3 = imnoise(Im,'gaussian',0,0.05);
Noise4 = imnoise(Im,'gaussian',0,0.05);
Noise5 = imnoise(Im,'gaussian',0,0.05);
Noise6 = imnoise(Im,'gaussian',0,0.05);
Noise7 = imnoise(Im,'gaussian',0,0.05);
Noise8 = imnoise(Im,'gaussian',0,0.05);
Noise9 = imnoise(Im,'gaussian',0,0.05);
Noise10 = imnoise(Im,'gaussian',0,0.05);
[row col] = size(Im);
find_median = zeros(row,col);
for r = 1:row
    for c = 1:col
        findm = [Noise1(r,c) Noise2(r,c) Noise3(r,c) Noise4(r,c) Noise5(r,c) Noise6(r,c) Noise7(r,c) Noise8(r,c) Noise9(r,c) Noise10(r,c)];
        med = median(findm);
        find_median(r,c) = med;
    end
end
average = (Noise1+Noise2+Noise3+Noise4+Noise5+Noise6+Noise7+Noise8+Noise9+Noise10)/10;
subplot(121);imshow(average);title("image averaging");
subplot(122);imshow(find_median);title("find median");