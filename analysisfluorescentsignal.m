

function [bgsubtraction1, speed] = highestinensitysingleworm(cutoutlength, thresh, pixelsignal, time)
%input parameters are the length of the cutout square that includes the
%signal and background, the threshold for what is recognized as signal vs.
%background, the number of pixel from the square that are taken as signal,
%the time between frames
%% code written by Dr. Inka Busack


%mosaic analysis cutoulength is 10, thresh is 1000
if ~mode(cutoutlength,2) 
    error('first input argument needs to be even')
end
%first read in files for strain to be analyzed
name = '*2446.tif';
    tifffiles = dir(name);
    
     switch length(tifffiles)
        case 0
            error('No matching file found')
       otherwise
            for kf = 1:length(tifffiles)
                images = imread(tifffiles(kf).name, 1); %read in images
      halfwidth = cutoutlength/2;
      square2 = [];
      
      %use threshold to create binary from image
      %devide in 3x3 field for the worms
      length_worm = length(images)/3;
      num_worms = 3;
      for k =1:3
        for p = 1:3
      worm = images((k*length_worm-length_worm+1):k*length_worm, (p*length_worm-length_worm+1):p*length_worm);
      mask(:,:) = worm < thresh;
      imagestack = worm;
      imagestack(mask) = 0;
      bw = (imagestack > 0);
      % find largest centroid and center of mass which is the neuron
      L = bwlabel(bw);
      s = regionprops(L, 'area', 'centroid');
      area_vector1 = [s.Area];
      [tmp, idx] = max(area_vector1);
      if ~isempty(idx)
centroids(kf, :,num_worms*k-num_worms+p) = s(idx(1)).Centroid; %position of the center of mass of the neuron
      
    if ~mod(kf,300) %show worm and found neuron for control
 figure; imagesc(worm)
hold on;
plot(centroids(kf,1,num_worms*k-num_worms+p),centroids(kf,2,num_worms*k-num_worms+p),'*','color','r')
title('found intensity')
end

%see if cut out frame is in image, otherwise shift
xmaxpix = size(worm,1)-1;
ymaxpix = size(worm,2)-1;

if round(centroids(kf,1,num_worms*k-num_worms+p)) < halfwidth+1
    centroids(kf,1,num_worms*k-num_worms+p) = halfwidth+1;
end
if round(centroids(kf,1,num_worms*k-num_worms+p))+halfwidth > xmaxpix
    centroids(kf,1,num_worms*k-num_worms+p) = xmaxpix-halfwidth;
end

if round(centroids(kf,2,num_worms*k-num_worms+p)) < halfwidth+1
    centroids(kf,2,num_worms*k-num_worms+p) = halfwidth+1;
end
if round(centroids(kf,2,num_worms*k-num_worms+p))+halfwidth > ymaxpix
    centroids(kf,2,num_worms*k-num_worms+p) = ymaxpix-halfwidth;
end

%cut out square around signal
square = worm(((round(centroids(kf,2,num_worms*k-num_worms+p))-halfwidth):(round(centroids(kf,2,num_worms*k-num_worms+p))+halfwidth)),((round(centroids(kf,1,num_worms*k-num_worms+p))-halfwidth):(round(centroids(kf,1,num_worms*k-num_worms+p))+halfwidth)));

%rearrange matrix into array

num = size(square,1);
allvalues = [];


for l= 1:num
    allvalues = [allvalues, square(l,:)];
end

%sort for highest intensities - defined in input how many intensities are the signal 
%the other intensities are the background
%do background subtraction

sortint = sort(allvalues); 
signal1val = sortint(end:-1:(end-pixelsignal));
signal1mean = mean(signal1val);
background1val = sortint(1:(end-(pixelsignal+1)));
background1mean = mean(background1val);
bgsubtraction1(kf,num_worms*k-num_worms+p) = signal1mean-background1mean;  
      
      
      
      
      
      else 
          centroids(kf, :,num_worms*k-num_worms+p) = [nan nan];
          bgsubtraction1(kf,num_worms*k-num_worms+p) = nan;
      end
      

            
          
          end
     end
     
            end          
           %calculate speed from the position of the highest intensity value
deltay = zeros(kf-1,1);
deltax = zeros(kf-1,1); 
speed = zeros(kf-1,1);

for u=1:9
    for l = 1:(length(centroids)-1)
     deltay(l,u) = centroids((l+1),2,u)-centroids(l,2,u);
     deltax(l,u) = centroids((l+1),1,u)-centroids(l,1,u);
     speed(l,u) = 1.6*sqrt(deltax(l,u)^2+deltay(l,u)^2)/time; %already included camera pixel conversion
    
    end 
 bouts(:,u) = boutdetection(speed(:,u),18,0.1);%extract sleep bouts calling the boutdetection function
end
     end
     
     %take out positions without worms
      pos_withoutworm(:) = 0;
pos_withoutworm([1]) = 1;
     speed(:,pos_withoutworm) = [];
     bgsubtraction1(:,pos_withoutworm) =[];
     bouts(:,pos_withoutworm)=[];
%save results in textfiles
   save('200616_HBR2446_GCaMP_intensity.txt', 'bgsubtraction1','-ascii');
   save('200616_HBR2446_speed.txt', 'speed','-ascii');
   save('200616_HBR2446_bouts.txt', 'bouts','-ascii')
   

       
end


      