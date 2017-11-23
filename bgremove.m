function bgremoved=bgremove(img)

%% remove low frequency background

[m,n]=size(img);
bgimg=imresize(img,[8,8]);
bgimg=imresize(bgimg,[m,n]);
bgremoved=img-bgimg;

