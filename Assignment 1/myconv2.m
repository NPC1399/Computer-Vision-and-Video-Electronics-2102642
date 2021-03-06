function B = myconv2(image,filter) %same size 2d convolution 
   adZero = zero_padding(image,filter);
   inFilter = matrix_inversion(filter);
   [zerow zecol] = size(adZero);
   [firow ficol] = size(inFilter);
   [imrow imcol] = size(image);
   B = zeros(imrow,imcol);
   for zc = (ficol+1)/2:(ficol+1)/2+imcol-1
       for zr = (firow+1)/2:(firow+1)/2+imrow-1
           for fc = 1:ficol
               for fr = 1:firow
                   B(zr-(firow+1)/2+1,zc-(ficol+1)/2+1) = B(zr-(firow+1)/2+1,zc-(ficol+1)/2+1) + inFilter(fr,fc)*adZero(zr-(firow+1)/2+fr,zc-(ficol+1)/2+fc);
               end
           end
       end
   end
   B = uint8(B);
end