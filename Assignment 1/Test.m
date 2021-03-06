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
%imwrite(Lenna_a,'Lenna_a.png');
%imwrite(Traffic_a,'Traffic_a.png');
Lenna_a_test = imfilter(Lenna,box_filter_a);
Traffic_a_test = imfilter(Traffic,box_filter_a);
%filter b
Lenna_b = myconv2(Lenna,box_filter_b);
Traffic_b = myconv2(Traffic,box_filter_b);
%imwrite(Lenna_b,'Lenna_b.png');
%imwrite(Traffic_b,'Traffic_b.png');
Lenna_b_test = imfilter(Lenna,box_filter_b);
Traffic_b_test = imfilter(Traffic,box_filter_b);
%filter c
Lenna_c = myconv2(Lenna,box_filter_c);
Traffic_c = myconv2(Traffic,box_filter_c);
%imwrite(Lenna_c,'Lenna_c.png');
%imwrite(Traffic_c,'Traffic_c.png');
Lenna_c_test = imfilter(Lenna,box_filter_c);
Traffic_c_test = imfilter(Traffic,box_filter_c);
%imwrite(Lenna_c_test,'Lenna_c_test.png');
%imwrite(Traffic_c_test,'Traffic_c_test.png');

%Prblem 3
laplacian_44 = [0 1 0;1 -4 1;0 1 0];
laplacian_88 = [1 1 1;1 -8 1;1 1 1];
prewitt_x = [1 0 -1;1 0 -1;1 0 -1];
prewitt_y = [1 1 1;0 0 0;-1 -1 -1];
sobel_x = [1 0 -1;2 0 -2;1 0 -1];
sobel_y = [1 2 1;0 0 0;-1 -2 -1];
%laplac 4 by 4
human_l_44 = myconv2(Human,laplacian_44);
building_l_44 = myconv2(Building,laplacian_44);
%imwrite(human_l_44,'human_l_44.png');
%imwrite(building_l_44,'building_l_44.png');
human_l_44_test = imfilter(Human,laplacian_44);
building_l_44_test = imfilter(Building,laplacian_44);
%laplac 8 by 8
human_l_88 = myconv2(Human,laplacian_88);
building_l_88 = myconv2(Building,laplacian_88);
%imwrite(human_l_88,'human_l_88.png');
%imwrite(building_l_88,'building_l_88.png');
human_l_88_test = imfilter(Human,laplacian_88);
building_l_88_test = imfilter(Building,laplacian_88);
%prewitt x
human_p_x = myconv2(Human,prewitt_x);
building_p_x = myconv2(Building,prewitt_x);
%imwrite(human_p_x,'human_p_x.png');
%imwrite(building_p_x,'building_p_x.png');
human_p_x_test = imfilter(Human,prewitt_x);
building_p_x_test = imfilter(Building,prewitt_x);
%imwrite(human_p_x_test,'human_p_x_test.png');
%imwrite(building_p_x_test,'building_p_x_test.png');
%prewitt_y
human_p_y = myconv2(Human,prewitt_y);
building_p_y = myconv2(Building,prewitt_y);
%imwrite(human_p_y,'human_p_y.png');
%imwrite(building_p_y,'building_p_y.png');
human_p_y_test = imfilter(Human,prewitt_y);
building_p_y_test = imfilter(Building,prewitt_y);
%imwrite(human_p_y_test,'human_p_y_test.png');
%imwrite(building_p_y_test,'building_p_y_test.png');
%sobel x
human_s_x = myconv2(Human,sobel_x);
building_s_x = myconv2(Building,sobel_x);
%imwrite(human_s_x,'human_s_x.png');
%imwrite(building_s_x,'building_s_x.png');
human_s_x_test = imfilter(Human,sobel_x);
building_s_x_test = imfilter(Building,sobel_x);
%imwrite(human_s_x_test,'human_s_x_test.png');
%imwrite(building_s_x_test,'building_s_x_test.png');
%sobel_y
human_s_y = myconv2(Human,sobel_y);
building_s_y = myconv2(Building,sobel_y);
%imwrite(human_s_y,'human_s_y.png');
%imwrite(building_s_y,'building_s_y.png');
human_s_y_test = imfilter(Human,sobel_y);
building_s_y_test = imfilter(Building,sobel_y);
%imwrite(human_s_y_test,'human_s_y_test.png');
%imwrite(building_s_y_test,'building_s_y_test.png');

%Problem 4
H3_05 = fspecial('gaussian',3,0.5);
H3_1 = fspecial('gaussian',3,1);
H3_2 = fspecial('gaussian',3,2);
H5_05 = fspecial('gaussian',5,0.5);
H5_1 = fspecial('gaussian',5,1);
H5_2 = fspecial('gaussian',5,2);
H7_05 = fspecial('gaussian',7,0.5);
H7_1 = fspecial('gaussian',7,1);
H7_2 = fspecial('gaussian',7,2);
%size = 3
Lenna_3_05 = myconv2(Lenna,H3_05);
Lenna_3_1 = myconv2(Lenna,H3_1);
Lenna_3_2 = myconv2(Lenna,H3_2);
%imwrite(Lenna_3_05,'Lenna_3_05.png');
%imwrite(Lenna_3_1,'Lenna_3_1.png');
%imwrite(Lenna_3_2,'Lenna_3_2.png');
Traffic_3_05 = myconv2(Traffic,H3_05);
Traffic_3_1 = myconv2(Traffic,H3_1);
Traffic_3_2 = myconv2(Traffic,H3_2);
%imwrite(Traffic_3_05,'Traffic_3_05.png');
%imwrite(Traffic_3_1,'Traffic_3_1.png');
%imwrite(Traffic_3_2,'Traffic_3_2.png');
Lenna_3_05_test = imfilter(Lenna,H3_05);
Lenna_3_1_test = imfilter(Lenna,H3_1);
Lenna_3_2_test = imfilter(Lenna,H3_2);
Traffic_3_05_test = imfilter(Traffic,H3_05);
Traffic_3_1_test = imfilter(Traffic,H3_1);
Traffic_3_2_test = imfilter(Traffic,H3_2);
%size = 5
Lenna_5_05 = myconv2(Lenna,H5_05);
Lenna_5_1 = myconv2(Lenna,H5_1);
Lenna_5_2 = myconv2(Lenna,H5_2);
%imwrite(Lenna_5_05,'Lenna_5_05.png');
%imwrite(Lenna_5_1,'Lenna_5_1.png');
%imwrite(Lenna_5_2,'Lenna_5_2.png');
Traffic_5_05 = myconv2(Traffic,H5_05);
Traffic_5_1 = myconv2(Traffic,H5_1);
Traffic_5_2 = myconv2(Traffic,H5_2);
%imwrite(Traffic_5_05,'Traffic_5_05.png');
%imwrite(Traffic_5_1,'Traffic_5_1.png');
%imwrite(Traffic_5_2,'Traffic_5_2.png');
Lenna_5_05_test = imfilter(Lenna,H5_05);
Lenna_5_1_test = imfilter(Lenna,H5_1);
Lenna_5_2_test = imfilter(Lenna,H5_2);
Traffic_5_05_test = imfilter(Traffic,H5_05);
Traffic_5_1_test = imfilter(Traffic,H5_1);
Traffic_5_2_test = imfilter(Traffic,H5_2);
%size = 7
Lenna_7_05 = myconv2(Lenna,H7_05);
Lenna_7_1 = myconv2(Lenna,H7_1);
Lenna_7_2 = myconv2(Lenna,H7_2);
%imwrite(Lenna_7_05,'Lenna_7_05.png');
%imwrite(Lenna_7_1,'Lenna_7_1.png');
%imwrite(Lenna_7_2,'Lenna_7_2.png');
Traffic_7_05 = myconv2(Traffic,H7_05);
Traffic_7_1 = myconv2(Traffic,H7_1);
Traffic_7_2 = myconv2(Traffic,H7_2);
%imwrite(Traffic_7_05,'Traffic_7_05.png');
%imwrite(Traffic_7_1,'Traffic_7_1.png');
%imwrite(Traffic_7_2,'Traffic_7_2.png');
Lenna_7_05_test = imfilter(Lenna,H7_05);
Lenna_7_1_test = imfilter(Lenna,H7_1);
Lenna_7_2_test = imfilter(Lenna,H7_2);
Traffic_7_05_test = imfilter(Traffic,H7_05);
Traffic_7_1_test = imfilter(Traffic,H7_1);
Traffic_7_2_test = imfilter(Traffic,H7_2);
