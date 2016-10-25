% HOMEIMAGES ='/home/zahra/Documents/ZahraDocuments/SUN2012/completed objects';

HOMEIMAGES='/media/zahra/New Volume/ZahraStimuli/stimuli_oxford/Zahra/ZStimSet';
outputimages='/media/zahra/New Volume/ZahraStimuli/stimuli_oxford/Zahra/zstimsetOccDisc';

imgsubfold=strcat(HOMEIMAGES,'/');

% subfoldname='bed';
% imgfiles = dir([HOMEIMAGES '/' subfoldname '/*.jpg']);

imgfiles = dir([HOMEIMAGES '/*.jpg']);

for i=1:length(imgfiles)
    
    %     im=imread([HOMEIMAGES '/' subfoldname '/' imgfiles(i).name]);
    
    im=imread([HOMEIMAGES '/' imgfiles(i).name]);
    im_gray=rgb2gray(im);
    im_scale=imresize(im_gray,[128,128]);
    
    f = figure('visible','off'), imshow(im_scale, 'Border', 'tight');
    rectangle('Position', [100, 100, 10, 10]);
    print(f, '-r80', '-dtiff', 'image2.tif');
set(f,'visible','on')

    dsp=30;
    fig=figure;imshow(im_scale);truesize(fig,[128,128])
    szi=size(im_scale);
    for circ_rad=10:5:20
        for rep=1:2
            locx=dsp+(szi(1)-2*dsp)*rand(1,1);
            locy=dsp+(szi(2)-2*dsp)*rand(1,1);
            c=circle(locx,locy,circ_rad);
        end
    end
    nm=imgfiles(i).name;
    WRITEFMT=strcat(outputimages,'/',sprintf('%s',nm(1:end-4)),'_occ','.jpg');
    saveas(gcf,WRITEFMT,'jpg')
    
    f=getframe(gcf);
    new=f.cdata;
figure;imagesc(new)
    set(gcf, 'PaperPositionMode','auto')     
    set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3])
print -djpeg WRITEFMT.jpg -r100

tightInset = get(gca, 'TightInset');
position(1) = tightInset(1);
position(2) = tightInset(2);
position(3) = 1 - tightInset(1) - tightInset(3);
position(4) = 1 - tightInset(2) - tightInset(4);
set(gca, 'Position', position);%%, 'PaperSize',[128 128],...
       'PaperPositionMode','auto',...
       'InvertHardcopy', 'off',...
       'Renderer','painters'...     %recommended if there are no alphamaps
       );

saveas(gca, 'WithoutMargins.jpg');

screen2jpeg(WRITEFMT)
% imwrite(obj_scale,sprintf('%s',WRITEFMT),'jpg');

figure;
%# create some plot, and make axis fill entire figure
plot([0 5 0 5], [0 10 10 0]), axis tight
set(gca, 'Position',[0 0 1 1])

%# set size of figure's "drawing" area on screen
set(gcf, 'Units','centimeters', 'Position',[0 0 5 10])

%# set size on printed paper
%#set(gcf, 'PaperUnits','centimeters', 'PaperPosition',[0 0 5 10])
%# WYSIWYG mode: you need to adjust your screen's DPI (*)
set(gcf, 'PaperPositionMode','auto')

%# save as TIFF
print -dtiff -r0 out.tiff

[r,c,d] = size(im);
x0 = 100;
y0 = 100;
w = 10;
h = 10;
x = [x0:x0+w x0*ones(1,h+1) x0:x0+w (x0+w)*ones(1,h+1)];
y = [y0*ones(1,w+1) y0:y0+h (y0+h)*ones(1,w+1) y0:y0+h];
index = sub2ind([r c],y,x);
im(index) = 0;
im(index+r*c) = 0;
im(index+2*r*c) = 0;
imwrite(im,'image2.tif','tif');

im_white=im_gray;   
for i=1:size(im_gray,1)
    for j=1:size(im_gray,2)
        if im_gray(i,j)==128
            im_white(i,j)=255;
        end
    end
end
figure;imshow(im_white)