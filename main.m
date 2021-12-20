clear;
close all;
clc;

[m, fs] = audioread('eric.wav');
info = audioinfo('eric.wav');

[dsbsc,dsbtc] = AMmodulator(m,fs,info);

clc;
