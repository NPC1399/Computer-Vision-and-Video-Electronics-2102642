function B = zero_padding(image,filter)
    [imrow imcol] = size(image);
    [firow ficol] = size(filter);
    B = zeros(imrow+firow-1,imcol+ficol-1);
    for c = (ficol+1)/2:(ficol+1)/2+imcol-1
        for r = (firow+1)/2:(firow+1)/2+imrow-1
            B(r,c) = image(r-(firow+1)/2+1,c-(ficol+1)/2+1);
        end
    end
end
