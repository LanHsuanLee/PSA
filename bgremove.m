function bgremoved=bgremove(img,order)
%% remove low frequency background
% img: target image
% order: the power of 2 for resize

order=fix(order);
if order<3
    order=3;
end

[m,n]=size(img);
bgimg=imresize(img,[2^order,2^order]);
bgimg=imresize(bgimg,[m,n]);
bgremoved=img-bgimg;
