function B = matrix_inversion(x) %h(r,c) -> h(-r,-c) 
    [r_max c_max] = size(x);
    B = zeros(r_max,c_max);
    for r = 1:r_max
        for c = 1:c_max
            B(r,c) = x(r_max+1-r,c_max+1-c);
        end
    end
end



                
                
                    