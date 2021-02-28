function B = myconv2(image,filter) %same size 2d convolution 
   adzero = zero_padding(image,filter); %image zero padding
   [zrow_max zcol_max] = size(adzero);
   Bdouble = zeros(size(image));
   inversed = matrix_inversion(filter); %h(r,c) -> h(-r,-c)
   [frow_max fcol_max] = size(inversed);
   for c = 2:zcol_max-1
       for r = 2:zrow_max-1
           for fc = 1:fcol_max
               for fr = 1:frow_max
                   Bdouble(r-1,c-1) = Bdouble(r-1,c-1) + inversed(fr,fc)*adzero(r-(frow_max-1)+fr,c-(fcol_max-1)+fc);
               end
           end
       end
   end
   B = uint8(Bdouble);
end