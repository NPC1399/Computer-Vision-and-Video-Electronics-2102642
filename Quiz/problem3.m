[chess map] = imread('chessboard.bmp');
I = ind2gray(chess,map);
c01 = imnoise(I,'gaussian',0,0.01);
c04 = imnoise(I,'gaussian',0,0.16);
average = (1/9)*[1 1 1;1 1 1;1 1 1];
sigma = 1; %standard deviation 
gaussian_kernel = zeros(3); %build 3*3 kernel
w = 0; %sum of element
for r = 1:3 
    for c = 1:3
        sq_dist = (r-2)^2 + (c-2)^2; %square of distance of any pixel from center
        gaussian_kernel(r,c) = exp(-1*(sq_dist)/(2*sigma));
        w = w + gaussian_kernel(r,c);
    end
end
gaussian_kernel = abs(gaussian_kernel/w);
chess_01_a = imfilter(c01,average);
chess_01_g = imfilter(c01,gaussian_kernel);
chess_04_a = imfilter(c04,average);
chess_04_g = imfilter(c04,gaussian_kernel);
figure;subplot(131);imshow(c01);title("std 0.1");
subplot(132);imshow(chess_01_a);title("average");
subplot(133);imshow(chess_01_g);title("gaussian");
figure;subplot(131);imshow(c04);title("std 0.4");
subplot(132);imshow(chess_04_a);title("average");
subplot(133);imshow(chess_04_g);title("gaussian");
