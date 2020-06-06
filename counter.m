function  counter(img ,l1,l2, r1,r2,name)

%filename 'part1_AX.png'
filename = strcat('part1_',name,'.png');

%Binarizing image with specified tresholds.
InputImage= threshold(img,l1,l2);


%complement of the image
img_coplement = imcomplement(InputImage);

%Structruing elements
se1 = strel('sphere',r1); % Erosion
se2 = strel('sphere',r2); %Dilation
se3 = strel('sphere',2); %Dilation

%Dilation to fill the holes and bays
img_coplement = imdilate(img_coplement,se3);

%Erosion to seperate planes and get ride of the noise
erodedI = imerode(img_coplement,se1);

% Dilation to connect parts of the planes
dilate = imdilate(erodedI,se2);


%connoected componenets of the image
cc = bwconncomp(dilate); 
number  = cc.NumObjects; %number of the connected components

disp(strcat('The number of flying jets in image ',{' '}, name ,{' '}, ' is ',{' '},num2str(number)));

%binary image that show groups of pixel
imwrite(dilate,filename);
end

