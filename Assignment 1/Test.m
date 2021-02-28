Building = imread('Building.6201.1424058713.jpg'); %problem 3
Human = imread('Human.6201.1424058686.jpg'); %problem 3
Lenna = imread('Lenna.6201.1424058502.png'); %problem 2 and 4
Traffic = imread('Traffic.6201.1424058661.jpg'); %problem 2 and 4

%Problem 1 2D Convoluion
%2D Convolution in myconv2.m
%Matrix inversion in matrix_inversion.m
%Zero padding in zero_padding.m

%Problem 2
box_filter_a = (1/9)*[1 1 1;1 1 1;1 1 1];
box_filter_b = (1/16)*[1 2 1;2 4 2;1 2 1];
box_filter_c = (1/25)*[1 1 1 1 1;1 1 1 1 1;1 1 1 1 1;1 1 1 1 1;1 1 1 1 1];
%filter a
Lenna_a = myconv2(Lenna,box_filter_a);
Traffic_a = myconv2(Traffic,box_filter_a);
%filter b
Lenna_b = myconv2(Lenna,box_filter_b);
Traffic_b = myconv2(Traffic,box_filter_b);
%filter c
Lenna_c = myconv2(Lenna,box_filter_c);
Traffic_c = myconv2(Traffic,box_filter_c);

