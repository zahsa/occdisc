function occDisks()

% HOMEIMAGES ='/home/zahra/Documents/ZahraDocuments/SUN2012/completed objects';

HOMEIMAGES='/media/zahra/New Volume/ZahraStimuli/stimuli_oxford/Zahra/ZStimSet';
% HOMEIMAGES='/media/zahra/New Volume/ZahraStimuli/stimuli_oxford/Zahra/vv_pics_orig_WB';
outputimages='/media/zahra/New Volume/ZahraStimuli/stimuli_oxford/Zahra/zstimsetOccDiscGB';

imgsubfold=strcat(HOMEIMAGES,'/');

% subfoldname='bed';
% imgfiles = dir([HOMEIMAGES '/' subfoldname '/*.jpg']);

imgfiles = dir([HOMEIMAGES '/*.jpg']);

for i=1:length(imgfiles)
    
    %     im=imread([HOMEIMAGES '/' subfoldname '/' imgfiles(i).name]);
    
    im=imread([HOMEIMAGES '/' imgfiles(i).name]);
    %--make white background
    
    im_gray=rgb2gray(im);
    im_scale=imresize(im_gray,[128,128]);

    dsp=30;
    fig=figure;imshow(im_scale);truesize(fig,[128,128])
    szi=size(im_scale);
    for circ_rad=10:5:20
        for rep=1:2
            locx=dsp+(szi(1)-2*dsp)*rand(1,1);
            locy=dsp+(szi(2)-2*dsp)*rand(1,1);
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