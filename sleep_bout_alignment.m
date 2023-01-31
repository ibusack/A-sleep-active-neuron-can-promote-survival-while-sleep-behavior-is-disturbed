% % a script for the sleep bout alignment analysis written by Dr. Inka Busack 
% 

clear gcamp bouts speed
%assign values from strain to be aligned
gcamp = hbr2628_gcamp; 
speed = hbr2628_speed; 
bouts = ~hbr2628_bouts;
time_between_frames =10; %hpw many seconds between 2 frames

%sleep fraction and sleep time in minutes for each animal

for u=1:size(bouts,2)
nonan_len = length((bouts(~isnan(bouts(:,u)),u)));
sum_animal = nansum(bouts(:,u));
sleep_fraction(u) = sum_animal/nonan_len;
sleep_time(u) = sum_animal*time_between_frames/60;
lethargus_time(u) = nonan_len*time_between_frames/60;
end

%bout alignment 
framesperminute = 6;
timebeforesleep = 5;%in min
timeaftersleep = 10;%in min
boutstart = [];

%find boutstarts for alignment
 for i=1:size(bouts,2)
    for j=(timebeforesleep*framesperminute):(size(bouts,1)-(timeaftersleep*framesperminute))
if bouts(j,i) == 0 & bouts(j+1,i) == 1 & ~isnan(bouts(j+1+(timeaftersleep*framesperminute),i)) & bouts((j-12):(j-1),i) == 0 & sum(bouts((j+1):(j+6),i))==6
    boutstart = [boutstart; [i , j+1]];
end
    end
  end
   
signal = zeros(size(boutstart,1),framesperminute*(timebeforesleep+timeaftersleep)+1);
   for k=1:size(boutstart,1)
animal = (boutstart(k,1));
datapoint = boutstart(k,2);
%combine all bouts
signal(k,:) = gcamp((datapoint-(timebeforesleep*framesperminute)):(datapoint+(timeaftersleep*framesperminute)),animal);
speed_aligned(k,:) = speed((datapoint-(timebeforesleep*framesperminute)):(datapoint+(timeaftersleep*framesperminute)),animal);
sleep(k,:)= bouts((datapoint-(timebeforesleep*framesperminute)):(datapoint+(timeaftersleep*framesperminute)),animal);
   end
   
bout_base = mean(signal(:,1:18),2);
normalized_signal = (signal-bout_base)./bout_base;
meansignal = nanmean(signal);
meanspeed = nanmean(speed_aligned);
errorspeed = nanstd(speed_aligned)/sqrt(length(boutstart))
errorsignal = nanstd(signal)/sqrt(length(boutstart));
%plot signal and speed alignment
figure; errorbar(meansignal,errorsignal); figure; errorbar(meanspeed, errorspeed);


%statistics to compare before sleepbout and onset of sleepbout
before_gcamp = nanmean(signal(:,1:6)');
sleeponsetgcamp = nanmean(signal(:,25:30)');
[p h] = signrank(before_gcamp, sleeponsetgcamp)

before_speed = nanmean(speed_aligned(:,1:6)');
sleeponsetspeed = nanmean(speed_aligned(:,25:30)');
[p h] = signrank(before_speed, sleeponsetspeed)

