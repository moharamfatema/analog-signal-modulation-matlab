function [] = plotNineTimeFrequency(m1,m2,m3,info,groupName,name1,name2,name3)
%PLOTNINETIMEFREQUENCY Summary of this function goes here
%   Detailed explanation goes here
    
    f = figure('Name',groupName);
    f.WindowState = 'fullscreen';
    subplot(3,3,1);
    
    plotTimeFrequency(m1,name1,3,3,1,info);
    
    plotTimeFrequency(m2,name2,3,3,2);
    
    plotTimeFrequency(m3,name3,3,3,3);
end

