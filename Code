% Ver 1.7.2
% Reference file: Ver 1.7
% Purpose: Adding color area to code, before that selecting correct block
            % area
% Conclusion: Successfully remove noise blocks, 

clear;clc;

[img0 sx units]=ReadDMFile('test.dm3');
img=imadjust(mat2gray(img0));

img1=medfilt2(img); % apply noise filter to image

idx1=1000; % Disc radius of fcn strel
background=imopen(img1,strel('disk',idx1));
img2=img1-background; % img1: background-removed image
img3=imadjust(img2);  % image enhancement
img4=1-img3;  % convert white and black

level=graythresh(img4); % compute the global threshold
bw=im2bw(img4,level);

[labeled,numObjects]=bwlabel(bw,4);
color_labeled=label2rgb(labeled,@hsv,'c','shuffle');

%{
psa_data including area, centroid and boundingbox.
You can get parameter for each particle by:
psa_data(1).area
psa_data(1).centroid
psa_data(1).BoundingBox
%}
psa_data=regionprops(labeled,'Area','Centroid','BoundingBox',...
    'MajorAxisLength','MinorAxisLength');

psa_celldata=struct2cell(psa_data);
psa_area=cell2mat(psa_celldata(1,:));

block_area=500; % remove blocks with area < 500
index_block=find(psa_area>=block_area); % find out useless blocks
num_block=length(index_block); % total number of useless blocks

% get rid of useless blocks
labeled_new=zeros(size(labeled));
for i=1:num_block
    labeled_new(logical(labeled==index_block(i)))=index_block(i);
    %labeled_new(find(labeled==index_block(i)))=index_block(i);
    %index_indiv=find(labeled==index_block(i));
end

%% Compare to previous version
color_labeled_new=label2rgb(labeled_new,@hsv,'c','shuffle');
subplot(1,2,1)
imshow(color_labeled),title('Origin')
subplot(1,2,2)
imshow(color_labeled_new),title('Removing noise blocks')
        
