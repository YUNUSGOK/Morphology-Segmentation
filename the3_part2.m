%Author : Athi Narayanan S
%M.E, Embedded Systems,
%K.S.R College of Engineering
%Erode, Tamil Nadu, India.
%http://sites.google.com/site/athisnarayanan/
%s_athi1983@yahoo.co.in
%Clear Memory & Command Window
clc;
clear all;
close all;
%Parameters for the Segmentation
nBins=5;
winSize=7;
nClass=6;

%Read Input Image

i8049 = imread('./CENG466_THE3_Part2/8049.jpg');
i12003 = imread('./CENG466_THE3_Part2/12003.jpg');
i35058 = imread('./CENG466_THE3_Part2/35058.jpg');
i35070 = imread('./CENG466_THE3_Part2/35070.jpg');
i41004 = imread('./CENG466_THE3_Part2/41004.jpg');
i42044 = imread('./CENG466_THE3_Part2/42044.jpg');
i42078 = imread('./CENG466_THE3_Part2/42078.jpg');
i94079 = imread('./CENG466_THE3_Part2/94079.jpg');
i100075 = imread('./CENG466_THE3_Part2/100075.jpg');
i100080 = imread('./CENG466_THE3_Part2/100080.jpg');
i105019 = imread('./CENG466_THE3_Part2/105019.jpg');
i105053 = imread('./CENG466_THE3_Part2/105053.jpg');
i106025 = imread('./CENG466_THE3_Part2/106025.jpg');
i108041 = imread('./CENG466_THE3_Part2/108041.jpg');
i108073 = imread('./CENG466_THE3_Part2/108073.jpg');
i112082 = imread('./CENG466_THE3_Part2/112082.jpg');
i113009 = imread('./CENG466_THE3_Part2/113009.jpg');
i113044 = imread('./CENG466_THE3_Part2/113044.jpg');
i134052 = imread('./CENG466_THE3_Part2/134052.jpg');
i135069 = imread('./CENG466_THE3_Part2/135069.jpg');
i163014 = imread('./CENG466_THE3_Part2/163014.jpg');
i268002 = imread('./CENG466_THE3_Part2/268002.jpg');
i314016 = imread('./CENG466_THE3_Part2/314016.jpg');
i317080 = imread('./CENG466_THE3_Part2/317080.jpg');
i326038 = imread('./CENG466_THE3_Part2/326038.jpg');

images{1} = i8049;
images{2} = i12003;
images{3} = i35058;
images{4} = i35070;
images{5} = i41004;
images{6} = i42044;
images{7} = i42078;
images{8} = i94079;
images{9} = i100075;
images{10} = i100080;
images{11} = i105019;
images{12} = i105053;
images{13} = i106025;
images{14} = i108041;
images{15} = i108073;
images{16} = i112082;
images{17} = i113009;
images{18} = i113044;
images{19} = i134052;
images{20} = i135069;
images{21} = i163014;
images{22} = i268002;
images{23} = i314016;
images{24} = i317080;
images{25} = i326038;

image_names = [
string('i8049'),
string('i12003.png'),
string('i35058.png'),
string('i35070.png'),
string('i41004.png'),
string('i42044.png'),
string('i42078.png'),
string('i94079.png'),
string('i100075.png'),
string('i100080.png'),
string('i105019.png'),
string('i105053.png'),
string('i106025.png'),
string('i108041.png'),
string('i108073.png'),
string('i112082.png'),
string('i113009.png'),
string('i113044.png'),
string('i134052.png'),
string('i135069.png'),
string('i163014.png'),
string('i268002.png'),
string('i314016.png'),
string('i317080.png'),
string('i326038.png')
];

for c=1:25

    %display('./Segmentation_results_algo1/' + image_names(c));
    %kmeans segmentation
    outImg = part2_kmeans(cell2mat(images(c)), nBins, winSize, nClass);
    a0 = strcat('./','Segmentation_results_algo1/',num2str(c),'.png');


    display(a0);
    imwrite(outImg,a0);

    %region growing segmentation
    I = im2double(cell2mat(images(c)));
    img_size = size(I);
    x = round(img_size(1)/2);
    y = round(img_size(2)/2);
    J = region_growing(I,x,y,0.2);
    a0 = strcat('./','Segmentation_results_algo2/',num2str(c),'.png');
    imwrite(I+J,a0);
end 

