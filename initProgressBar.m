function initProgressBar(str)
global progress_bar;
progress_bar.handle=waitbar(0,str);
progress_bar.initTime=tic;
end