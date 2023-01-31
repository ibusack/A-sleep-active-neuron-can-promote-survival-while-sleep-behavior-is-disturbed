%%this function complements analysisfluorescentsignal
%it detects the sleepbouts based on an input speed
%%code written by Dr. Inka Busack
%input is speed array, a thershold for a minimum length of the sleep bout
%and a threshold for the fraction of speed which is a maximum during the
%sleep bout
function q = boutdetection(speed, timethresh, speedthresh)
%smooth the speed
normspeed = smooth(speed,30);
normspeed(1) = normspeed(2);
normspeed(end) = normspeed(end-1);
%normalize speed
normspeed = (normspeed-min(normspeed))./(max(normspeed)-min(normspeed));

for u = 1:length(normspeed)
    %apply seedthreshold
if normspeed(u) < speedthresh
q(u) = 0;
else
q(u)=1;
end
end

boutstarts = [];
boutends = [];
%detect boutstarts and ends
for n = 1:size(speed,1)-1
    if q(n) == 1 & q(n+1) == 0
        boutstarts = [boutstarts, n+1];
    end
    if q(n) == 0 & q(n+1) == 1;
        boutends = [boutends, n];
    end
end
%apply bout length threshold
if length(boutstarts) < length(boutends)
    boutstarts = [1, boutstarts];
else if length(boutstarts) > length(boutends)
        boutends = [boutends, length(normspeed)];
    end
end


for k = 1:size(boutstarts,2)
    boutlength(k) = boutends(k)-boutstarts(k);
    if boutlength(k) < timethresh
        q(boutstarts(k):boutends(k)) = 1;
    end
  

end
%plot the speeds and detected bouts as control
figure; plot(normspeed)
hold on
plot(q./2)
end



