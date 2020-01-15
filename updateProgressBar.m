function updateProgressBar(per)
global progress_bar
nt=toc(progress_bar.initTime);
totalTime=nt/per*(1-per);
timeStr=sec2time(totalTime);
waitbar(per,progress_bar.handle,[timeStr,' left']);
% if per==1
%     close(progress_bar.handle);
% end
end