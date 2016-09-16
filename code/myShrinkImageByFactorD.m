% myShrinkImageByFactorD.m
function myShrinkImageByFactorD( d )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
inpImg = 'data\circles_concentric.png';
f = imread(inpImg,'png');
sampled = f(1:d:end , 1:d:end); 
myNumOfColors = 200;
myColorScale = [[0:1/(myNumOfColors - 1):1]',[0:1/(myNumOfColors - 1):1]' , [0:1/(myNumOfColors - 1):1]' ];
%{
subplot(1,2,1);
imshow(f);
subplot(1,2,2);
imshow(sampled);
set(gcf,'Position',get(0,'ScreenSize'));%maximize figure
%}
subplot(1,2,1);
imagesc ((f)); % phantom is a popular test image
title('Original');
colormap (myColorScale);
colormap (jet);
daspect ([1 1 1]);
axis tight;
colorbar
subplot(1,2,2);
imagesc ((sampled)); % phantom is a popular test image
title('Sampled');
colormap (myColorScale);
colormap (jet);
daspect ([1 1 1]);
axis tight;
colorbar
set(gcf,'Position',get(0,'ScreenSize'));%maximize figure
imwrite(sampled,'images\circles_concentric_ShrinkedBy3.png')
end

