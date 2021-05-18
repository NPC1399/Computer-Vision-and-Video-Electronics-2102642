image = [0 0 2 4;4 3 3 2;4 3 3 3];
[row col] = size(image);
horizontal = [-1 -2 -1;0 0 0;1 2 1];
vertical = [-1 0 1;-2 0 2;-1 0 1];
Ix = conv2(image,horizontal,'same');
Iy = conv2(image,vertical,'same');
gradient_mag = zeros(row,col);
for r = 1:row
    for c = 1:col
        gradient_mag(r,c) = sqrt(Ix(r,c)^2 + Iy(r,c)^2);
    end
end
