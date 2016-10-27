function occDisks_onScene()

% HOMEIMAGES ='/home/zahra/Documents/ZahraDocuments/SUN2012/completed objects';

HOMEIMAGES='/media/zahra/New Volume/ZahraStimuli/occStim/occStim_inconst';
outputimages='/media/zahra/New Volume/ZahraStimuli/occStim/occStimout_inconst';

imgsubfold=strcat(HOMEIMAGES,'/');

% subfoldname='bed';
% imgfiles = dir([HOMEIMAGES '/' subfoldname '/*.jpg']);

imgfiles = dir([HOMEIMAGES '/*.jpg']);

for i=1:length(imgfiles)
    
    %     im=imread([HOMEIMAGES '/' subfoldname '/' imgfiles(i).name]);
    
    im=imread([HOMEIMAGES '/' imgfiles(i).name]);
    %--make white background
    
    im_gray=rgb2gray(im);
%     im_scale=imresize(im_gray,[128,128]);

%--Each object needs to be centered in a box with specified coordinates
%--the dsp and width should be calculated from the box
    dspx=122;dspy=290;
    widthx=220;widthy=100;
    fig=figure;imshow(im_gray);%truesize(fig,[128,128])
    szi=size(im_gray);
    for circ_rad=20:5:50
        for rep=1:2 %you need to find a relationship between the area of the bounding box and the number of repetition
            % you also need to define a measure for the amount of occlusion
            %  by calculating the number of un-occluded object parts and
            %  define a occlusion percentage
            locx=dspx+(widthx)*rand(1,1);%horizontal movement
            locy=dspy+(widthy)*rand(1,1);%vertical movement
            circle(locx,locy,circ_rad);
        end
    end
    F = getframe;
    [X,map] = frame2im(F);
    figure;imshow(X,'Border', 'tight');

    nm=imgfiles(i).name;
    WRITEFMT=strcat(outputimages,'/',sprintf('%s',nm(1:end-4)),'_occ','.jpg');
%     saveas(gcf,WRITEFMT,'jpg')
    imwrite(X,sprintf('%s',WRITEFMT),'jpg');

end