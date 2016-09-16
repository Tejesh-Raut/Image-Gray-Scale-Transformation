function myNearestNeighborInterpolation( )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
inpImg = 'data\barbaraSmall.png';
f = imread(inpImg,'png');
%sampled = f(1:d:end , 1:d:end); 
%# Initializations:
scale = [3 2];              %# The resolution scale factors: [rows columns]
oldSize = size(f);                   %# Get the size of your image
newSize = max(floor(scale.*oldSize(1:2)),1);  %# Compute the new image size

%# Compute an upsampled set of indices:

rowIndex = min(round(((1:newSize(1))-0.5)./scale(1)+0.5),oldSize(1));
colIndex = min(round(((1:newSize(2))-0.5)./scale(2)+0.5),oldSize(2));

%# Index old image to get new image:

outputI = f(rowIndex,colIndex,:);

myNumOfColors = 200;
myColorScale = [[0:1/(myNumOfColors - 1):1]',[0:1/(myNumOfColors - 1):1]' , [0:1/(myNumOfColors - 1):1]' ];

subplot(1,2,1);
imagesc ((f)); % phantom is a popular test image
title('Original');
colormap (myColorScale);
colormap (jet);
daspect ([1 1 1]);
axis tight;
colorbar
subplot(1,2,2);
imagesc ((outputI)); % phantom is a popular test image
title('Output');
colormap (myColorScale);
colormap (jet);
daspect ([1 1 1]);
axis tight;
colorbar
set(gcf,'Position',get(0,'ScreenSize'));%maximize figure
imwrite(outputI,'images\barbaraSmallNearestNeighborInterpolation.png')
end

