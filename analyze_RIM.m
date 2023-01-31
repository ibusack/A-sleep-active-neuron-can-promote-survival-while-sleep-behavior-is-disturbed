%analyze RIM data, script written by Dr. Inka Busack
close all; clear all; clc;

wildtype_files = dir('*560*.txt');
hbr2420_files = dir('*HBR2446*.txt');
hbr2421_files = dir('*HBR2447*.txt');
hbr2508_files = dir('*HBR2508*.txt');
hbr2544_files = dir('*HBR2544*.txt');
hbr2587_files = dir('*HBR2587*.txt');
hbr2628_files = dir('*HBR2628*.txt');

wt_gcamp_1 = [textread(wildtype_files(1).name), textread(wildtype_files(5).name),textread(wildtype_files(9).name),textread(wildtype_files(13).name),textread(wildtype_files(17).name)];
wt_mkate = [textread(wildtype_files(3).name), textread(wildtype_files(7).name),textread(wildtype_files(11).name),textread(wildtype_files(15).name),textread(wildtype_files(19).name)];
wt_speed = [textread(wildtype_files(8).name), textread(wildtype_files(8).name),textread(wildtype_files(12).name)];
wt_bouts = [textread(wildtype_files(2).name),textread(wildtype_files(6).name),textread(wildtype_files(10).name),textread(wildtype_files(14).name),textread(wildtype_files(18).name)];

hbr2420_gcamp_1 = [textread(hbr2420_files(1).name),textread(hbr2420_files(5).name),textread(hbr2420_files(9).name)];
hbr2420_mkate = [textread(hbr2420_files(3).name),textread(hbr2420_files(7).name),textread(hbr2420_files(11).name)];
hbr2420_speed = [textread(hbr2420_files(12).name),textread(hbr2420_files(8).name),textread(hbr2420_files(12).name)];
hbr2420_bouts = [textread(hbr2420_files(2).name),textread(hbr2420_files(6).name),textread(hbr2420_files(10).name)];

hbr2421_gcamp_1 = [textread(hbr2421_files(1).name),textread(hbr2421_files(5).name),textread(hbr2421_files(9).name)];
hbr2421_mkate = [textread(hbr2421_files(3).name),textread(hbr2421_files(7).name),textread(hbr2421_files(11).name)];
hbr2421_speed = [textread(hbr2421_files(12).name),textread(hbr2421_files(8).name),textread(hbr2421_files(12).name)];
hbr2421_bouts = [textread(hbr2421_files(2).name),textread(hbr2421_files(6).name),textread(hbr2421_files(10).name)];

hbr2508_gcamp_1 = [textread(hbr2508_files(1).name),textread(hbr2508_files(5).name)];
hbr2508_mkate = [textread(hbr2508_files(3).name),textread(hbr2508_files(7).name)];
hbr2508_speed = [textread(hbr2508_files(4).name),textread(hbr2508_files(8).name)];
hbr2508_bouts = [textread(hbr2508_files(2).name),textread(hbr2508_files(6).name)];

hbr2544_gcamp_1 = [textread(hbr2544_files(1).name),textread(hbr2544_files(5).name),textread(hbr2544_files(9).name),textread(hbr2544_files(13).name)];
hbr2544_mkate = [textread(hbr2544_files(3).name),textread(hbr2544_files(7).name),textread(hbr2544_files(11).name),textread(hbr2544_files(15).name)];
hbr2544_speed = [textread(hbr2544_files(4).name),textread(hbr2544_files(8).name),textread(hbr2544_files(12).name),textread(hbr2544_files(16).name)];
hbr2544_bouts = [textread(hbr2544_files(2).name),textread(hbr2544_files(6).name),textread(hbr2544_files(10).name),textread(hbr2544_files(14).name)];

hbr2587_gcamp_1 = [textread(hbr2587_files(3).name),textread(hbr2587_files(6).name),textread(hbr2587_files(9).name)];
hbr2587_mkate = [textread(hbr2587_files(1).name),textread(hbr2587_files(2).name),textread(hbr2587_files(11).name)];
hbr2587_speed = [textread(hbr2587_files(5).name),textread(hbr2587_files(8).name),textread(hbr2587_files(12).name)];
hbr2587_bouts = [textread(hbr2587_files(4).name),textread(hbr2587_files(7).name),textread(hbr2587_files(10).name)];


hbr2628_gcamp_1 = [textread(hbr2628_files(1).name),textread(hbr2628_files(5).name)];
hbr2628_mkate = [textread(hbr2628_files(3).name),textread(hbr2628_files(7).name)];
hbr2628_speed = [textread(hbr2628_files(4).name),textread(hbr2628_files(8).name)];
hbr2628_bouts = [textread(hbr2628_files(2).name),textread(hbr2628_files(6).name)];


%normalize RIM signal for all strains 

wt_gcamp_2 = wt_gcamp_1./wt_mkate;
hbr2420_gcamp_2 = hbr2420_gcamp_1./hbr2420_mkate;
hbr2421_gcamp_2 = hbr2421_gcamp_1./hbr2421_mkate;
hbr2508_gcamp_2 = hbr2508_gcamp_1./hbr2508_mkate;
hbr2544_gcamp_2 = hbr2544_gcamp_1./hbr2544_mkate;
hbr2587_gcamp_2 = hbr2587_gcamp_1./hbr2587_mkate;
hbr2628_gcamp_2 = hbr2628_gcamp_1./hbr2628_mkate;

wt_sort = sort(wt_gcamp_2);
wt_base = mean(wt_sort(21:41,:));
wt_gcamp = (wt_gcamp_2-wt_base)./wt_base;


hbr2420_sort = sort(hbr2420_gcamp_2);
hbr2420_base = mean(hbr2420_sort(21:41,:));
hbr2420_gcamp = (hbr2420_gcamp_2-hbr2420_base)./hbr2420_base;

hbr2421_sort = sort(hbr2421_gcamp_2);
hbr2421_base = mean(hbr2421_sort(21:41,:));
hbr2421_gcamp = (hbr2421_gcamp_2-hbr2421_base)./hbr2421_base;

hbr2508_sort = sort(hbr2508_gcamp_2);
hbr2508_base = mean(hbr2508_sort(21:41,:));
hbr2508_gcamp = (hbr2508_gcamp_2-hbr2508_base)./hbr2508_base;

hbr2544_sort = sort(hbr2544_gcamp_2);
hbr2544_base = mean(hbr2544_sort(21:41,:));
hbr2544_gcamp = (hbr2544_gcamp_2-hbr2544_base)./hbr2544_base;

hbr2587_sort = sort(hbr2587_gcamp_2);
hbr2587_base = mean(hbr2587_sort(21:41,:));
hbr2587_gcamp = (hbr2587_gcamp_2-hbr2587_base)./hbr2587_base;

hbr2628_sort = sort(hbr2628_gcamp_2);
hbr2628_base = mean(hbr2628_sort(21:41,:));
hbr2628_gcamp = (hbr2628_gcamp_2-hbr2628_base)./hbr2628_base;

%first fraction of sleep for each strain
wt_sum_sleep = nansum(wt_bouts);
wt_fraction_sleep = 1- wt_sum_sleep/length(wt_bouts);

hbr2420_sum_sleep = nansum(hbr2420_bouts);
hbr2420_fraction_sleep = 1- hbr2420_sum_sleep/length(hbr2420_bouts);

hbr2421_sum_sleep = nansum(hbr2421_bouts);
hbr2421_fraction_sleep = 1- hbr2421_sum_sleep/length(hbr2421_bouts);

hbr2508_sum_sleep = nansum(hbr2508_bouts);
hbr2508_fraction_sleep = 1- hbr2508_sum_sleep/length(hbr2508_bouts);

hbr2544_sum_sleep = nansum(hbr2544_bouts);
hbr2544_fraction_sleep = 1- hbr2544_sum_sleep/length(hbr2544_bouts);

hbr2587_sum_sleep = nansum(hbr2587_bouts);
hbr2587_fraction_sleep = 1- hbr2587_sum_sleep/length(hbr2587_bouts);

hbr2628_sum_sleep = nansum(hbr2628_bouts);
hbr2628_fraction_sleep = 1- hbr2628_sum_sleep/length(hbr2628_bouts);

%find rim peaks 

for n=1:size(wt_gcamp,2)
wt_gcamp_smooth(:,n) = smooth(wt_gcamp(:,n),5);
[RIM_peaks_wt(:,n),pro_wt(:,n)] = islocalmax(wt_gcamp_smooth(:,n),'MinProminence',1);
end

for l=1:size(hbr2421_gcamp,2)
hbr2421_gcamp_smooth(:,l) = smooth(hbr2421_gcamp(:,l),5);
[RIM_peaks_hbr2421(:,l),pro_hbr2421(:,l)] = islocalmax(hbr2421_gcamp_smooth(:,l),'MinProminence',1);
end

for l=1:size(hbr2420_gcamp,2)
hbr2420_gcamp_smooth(:,l) = smooth(hbr2420_gcamp(:,l),5);
[RIM_peaks_hbr2420(:,l),pro_hbr2140(:,l)] = islocalmax(hbr2420_gcamp_smooth(:,l),'MinProminence',1);
end

for l=1:size(hbr2508_gcamp,2)
hbr2508_gcamp_smooth(:,l) = smooth(hbr2508_gcamp(:,l),5);
[RIM_peaks_hbr2508(:,l),pro_hbr2508(:,l)] = islocalmax(hbr2508_gcamp_smooth(:,l),'MinProminence',1);
end

for l=1:size(hbr2544_gcamp,2)
hbr2544_gcamp_smooth(:,l) = smooth(hbr2544_gcamp(:,l),5);
[RIM_peaks_hbr2544(:,l),pro_hbr2544(:,l)] = islocalmax(hbr2544_gcamp_smooth(:,l),'MinProminence',1);
end

for l=1:size(hbr2587_gcamp,2)
hbr2587_gcamp_smooth(:,l) = smooth(hbr2587_gcamp(:,l),5);
[RIM_peaks_hbr2587(:,l),pro_hbr2587(:,l)] = islocalmax(hbr2587_gcamp_smooth(:,l),'MinProminence',1);
end

for l=1:size(hbr2628_gcamp,2)
hbr2628_gcamp_smooth(:,l) = smooth(hbr2628_gcamp(:,l),5);
[RIM_peaks_hbr2628(:,l),pro_hbr2628(:,l)] = islocalmax(hbr2628_gcamp_smooth(:,l),'MinProminence',1);
end

%get peak amplitudes 
for p =1:size(RIM_peaks_wt,2)
peak_amp_wt(p) = mean(wt_gcamp_smooth(RIM_peaks_wt(:,p)==1,p));
end

for p =1:size(RIM_peaks_hbr2420,2)
peak_amp_hbr2420(p) = mean(hbr2420_gcamp_smooth(RIM_peaks_hbr2420(:,p)==1,p));
end

for p =1:size(RIM_peaks_hbr2421,2)
peak_amp_hbr2421(p) = mean(hbr2421_gcamp_smooth(RIM_peaks_hbr2421(:,p)==1,p));
end

for p =1:size(RIM_peaks_hbr2508,2)
peak_amp_hbr2508(p) = mean(hbr2508_gcamp_smooth(RIM_peaks_hbr2508(:,p)==1,p));
end

for p =1:size(RIM_peaks_hbr2544,2)
peak_amp_hbr2544(p) = mean(hbr2544_gcamp_smooth(RIM_peaks_hbr2544(:,p)==1,p));
end

for p =1:size(RIM_peaks_hbr2587,2)
peak_amp_hbr2587(p) = mean(hbr2587_gcamp_smooth(RIM_peaks_hbr2587(:,p)==1,p));
end

for p =1:size(RIM_peaks_hbr2628,2)
peak_amp_hbr2628(p) = mean(hbr2628_gcamp_smooth(RIM_peaks_hbr2628(:,p)==1,p));
end
%now speed mean for each strain during wake and sleep
%also gcamp mean for each strain during wake and sleep

for i =1:size(wt_speed,2)
wt_speed_wake(i) = nanmean(wt_speed(wt_bouts(:,i)==1,i));
wt_speed_sleep(i) = nanmean(wt_speed(wt_bouts(:,i)==0,i));

wt_gcamp_wake(i) = nanmean(wt_gcamp(wt_bouts(:,i)==1,i));
wt_gcamp_sleep(i) = nanmean(wt_gcamp(wt_bouts(:,i)==0,i));

wt_peaks_wake(i)= nansum(RIM_peaks_wt(wt_bouts(:,i)==1,i));
wt_peaks_sleep(i) = nansum(RIM_peaks_wt(wt_bouts(:,i)==0,i));
end

for j =1:size(hbr2420_speed,2)
hbr2420_speed_wake(j) = nanmean(hbr2420_speed(hbr2420_bouts(:,j)==1,j));
hbr2420_speed_sleep(j) = nanmean(hbr2420_speed(hbr2420_bouts(:,j)==0,j));

hbr2420_gcamp_wake(j) = nanmean(hbr2420_gcamp(hbr2420_bouts(:,j)==1,j));
hbr2420_gcamp_sleep(j) = nanmean(hbr2420_gcamp(hbr2420_bouts(:,j)==0,j));

hbr2420_peaks_wake(j)= nansum(RIM_peaks_hbr2420(hbr2420_bouts(:,j)==1,j));
hbr2420_peaks_sleep(j) = nansum(RIM_peaks_hbr2420(hbr2420_bouts(:,j)==0,j));
end

for k =1:size(hbr2421_speed,2)
hbr2421_speed_wake(k) = nanmean(hbr2421_speed(hbr2421_bouts(:,k)==1,k));
hbr2421_speed_sleep(k) = nanmean(hbr2421_speed(hbr2421_bouts(:,k)==0,k));

hbr2421_gcamp_wake(k) = nanmean(hbr2421_gcamp(hbr2421_bouts(:,k)==1,k));
hbr2421_gcamp_sleep(k) = nanmean(hbr2421_gcamp(hbr2421_bouts(:,k)==0,k));

hbr2421_peaks_wake(k)= nansum(RIM_peaks_hbr2421(hbr2421_bouts(:,k)==1,k));
hbr2421_peaks_sleep(k) = nansum(RIM_peaks_hbr2421(hbr2421_bouts(:,k)==0,k));
end
for b =1:size(hbr2508_speed,2)
hbr2508_speed_wake(b) = nanmean(hbr2508_speed(hbr2508_bouts(:,b)==1,b));
hbr2508_speed_sleep(b) = nanmean(hbr2508_speed(hbr2508_bouts(:,b)==0,b));

hbr2508_gcamp_wake(b) = nanmean(hbr2508_gcamp(hbr2508_bouts(:,b)==1,b));
hbr2508_gcamp_sleep(b) = nanmean(hbr2508_gcamp(hbr2508_bouts(:,b)==0,b));

hbr2508_peaks_wake(b)= nansum(RIM_peaks_hbr2508(hbr2508_bouts(:,b)==1,b));
hbr2508_peaks_sleep(b) = nansum(RIM_peaks_hbr2508(hbr2508_bouts(:,b)==0,b));
end

for b =1:size(hbr2544_speed,2)
hbr2544_speed_wake(b) = nanmean(hbr2544_speed(hbr2544_bouts(:,b)==1,b));
hbr2544_speed_sleep(b) = nanmean(hbr2544_speed(hbr2544_bouts(:,b)==0,b));

hbr2544_gcamp_wake(b) = nanmean(hbr2544_gcamp(hbr2544_bouts(:,b)==1,b));
hbr2544_gcamp_sleep(b) = nanmean(hbr2544_gcamp(hbr2544_bouts(:,b)==0,b));

hbr2544_peaks_wake(b)= nansum(RIM_peaks_hbr2544(hbr2544_bouts(:,b)==1,b));
hbr2544_peaks_sleep(b) = nansum(RIM_peaks_hbr2544(hbr2544_bouts(:,b)==0,b));
end

for b =1:size(hbr2587_speed,2)
hbr2587_speed_wake(b) = nanmean(hbr2587_speed(hbr2587_bouts(:,b)==1,b));
hbr2587_speed_sleep(b) = nanmean(hbr2587_speed(hbr2587_bouts(:,b)==0,b));

hbr2587_gcamp_wake(b) = nanmean(hbr2587_gcamp(hbr2587_bouts(:,b)==1,b));
hbr2587_gcamp_sleep(b) = nanmean(hbr2587_gcamp(hbr2587_bouts(:,b)==0,b));

hbr2587_peaks_wake(b)= nansum(RIM_peaks_hbr2587(hbr2587_bouts(:,b)==1,b));
hbr2587_peaks_sleep(b) = nansum(RIM_peaks_hbr2587(hbr2587_bouts(:,b)==0,b));
end

for b =1:size(hbr2628_speed,2)
hbr2628_speed_wake(b) = nanmean(hbr2628_speed(hbr2628_bouts(:,b)==1,b));
hbr2628_speed_sleep(b) = nanmean(hbr2628_speed(hbr2628_bouts(:,b)==0,b));

hbr2628_gcamp_wake(b) = nanmean(hbr2628_gcamp(hbr2628_bouts(:,b)==1,b));
hbr2628_gcamp_sleep(b) = nanmean(hbr2628_gcamp(hbr2628_bouts(:,b)==0,b));

hbr2628_peaks_wake(b)= nansum(RIM_peaks_hbr2628(hbr2628_bouts(:,b)==1,b));
hbr2628_peaks_sleep(b) = nansum(RIM_peaks_hbr2628(hbr2628_bouts(:,b)==0,b));
end

%frequencies of peak in wake 
frequency_wt = wt_peaks_wake./(sum(wt_bouts)*10);
frequency_hbr2420 = hbr2420_peaks_wake./(sum(hbr2420_bouts)*10);
frequency_hbr2421 = hbr2421_peaks_wake./(sum(hbr2421_bouts)*10);
frequency_hbr2508 = hbr2508_peaks_wake./(sum(hbr2508_bouts)*10);
frequency_hbr2544 = hbr2544_peaks_wake./(sum(hbr2544_bouts)*10);
frequency_hbr2587 = hbr2587_peaks_wake./(sum(hbr2587_bouts)*10);
frequency_hbr2628 = hbr2628_peaks_wake./(sum(hbr2628_bouts)*10);

%frequencies of peak in sleep
frequency_wt_wake = wt_peaks_sleep./((length(wt_bouts)-sum(wt_bouts))*10);
frequency_hbr2420_wake = hbr2420_peaks_sleep./((length(hbr2420_bouts)-sum(hbr2420_bouts))*10);
frequency_hbr2421_wake = hbr2421_peaks_sleep./((length(hbr2421_bouts)-sum(hbr2421_bouts))*10);
frequency_hbr2508_wake = hbr2508_peaks_sleep./((length(hbr2508_bouts)-sum(hbr2508_bouts))*10);
frequency_hbr2544_wake = hbr2544_peaks_sleep./((length(hbr2544_bouts)-sum(hbr2544_bouts))*10);
frequency_hbr2587_wake = hbr2587_peaks_sleep./((length(hbr2587_bouts)-sum(hbr2587_bouts))*10);
frequency_hbr2628_wake = hbr2628_peaks_sleep./((length(hbr2628_bouts)-sum(hbr2628_bouts))*10);
%multiply frequency and amplitude

multi_wt = frequency_wt.*peak_amp_wt;
multi_hbr2420 = frequency_hbr2420.*peak_amp_hbr2420;
multi_hbr2421 = frequency_hbr2421.*peak_amp_hbr2421;

%sum of all RIM peaks 

peak_sum_hbr2421 = sum(RIM_peaks_hbr2421);
peak_sum_hbr2508 = sum(RIM_peaks_hbr2508);
peak_sum_hbr2544 = sum(RIM_peaks_hbr2544);
peak_sum_hbr2587 = sum(RIM_peaks_hbr2587);
peak_sum_wt = sum(RIM_peaks_wt);
peak_sum_hbr2628 = sum(RIM_peaks_hbr2628);

%% calculate sleep based on RIM peaks, if no peak for 5min (60frames)

timethresh = 90;
for i=1:size(RIM_peaks_wt,2)
    sleep_RIMdetected_wt(:,i) = RIM_sleepboutdetection(RIM_peaks_wt(:,i),timethresh);
end
RIM_sleepfraction_wt = sum(sleep_RIMdetected_wt)/length(sleep_RIMdetected_wt);

for i=1:size(RIM_peaks_hbr2420,2)
    sleep_RIMdetected_hbr2420(:,i) = RIM_sleepboutdetection(RIM_peaks_hbr2420(:,i),timethresh);
end

RIM_sleepfraction_hbr2420 = sum(sleep_RIMdetected_hbr2420)/length(sleep_RIMdetected_hbr2420);

for i=1:size(RIM_peaks_hbr2508,2)
    sleep_RIMdetected_hbr2508(:,i) = RIM_sleepboutdetection(RIM_peaks_hbr2508(:,i),timethresh);
end

RIM_sleepfraction_hbr2508 = sum(sleep_RIMdetected_hbr2508)/length(sleep_RIMdetected_hbr2508);


for i=1:size(RIM_peaks_hbr2544,2)
    sleep_RIMdetected_hbr2544(:,i) = RIM_sleepboutdetection(RIM_peaks_hbr2544(:,i),timethresh);
end

RIM_sleepfraction_hbr2544 = sum(sleep_RIMdetected_hbr2544)/length(sleep_RIMdetected_hbr2544);

for i=1:size(RIM_peaks_hbr2587,2)
    sleep_RIMdetected_hbr2587(:,i) = RIM_sleepboutdetection(RIM_peaks_hbr2587(:,i),timethresh);
end

RIM_sleepfraction_hbr2587 = sum(sleep_RIMdetected_hbr2587)/length(sleep_RIMdetected_hbr2587);

for i=1:size(RIM_peaks_hbr2628,2)
    sleep_RIMdetected_hbr2628(:,i) = RIM_sleepboutdetection(RIM_peaks_hbr2628(:,i),timethresh);
end

RIM_sleepfraction_hbr2628 = sum(sleep_RIMdetected_hbr2628)/length(sleep_RIMdetected_hbr2628);