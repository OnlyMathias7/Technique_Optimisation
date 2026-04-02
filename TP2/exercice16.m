clc, clear, close all

A = [a c; c d];
B = [-2 ; 1];


J_u = @(u) 0.5*u'*A*u-B'*u+c;
GJ_u = @(u) A*u-B;

nI