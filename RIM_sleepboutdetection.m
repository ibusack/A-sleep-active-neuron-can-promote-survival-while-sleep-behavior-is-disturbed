%RIM peaks for sleep detection
%script written by Dr. Inka Busack
function q = RIM_sleepboutdetection(RIM_peaks, timethresh)

q = nan(size(RIM_peaks));
for n = 1:(size(RIM_peaks,1)-timethresh)
sum_peaks = sum(RIM_peaks(n:(n+timethresh)));
if sum_peaks == 0
    q(n:(n+timethresh)) = 1;
else
    q(n:(n+timethresh)) = 0;
end
end
