%close all; 
clear; clc

FileLoc = 'C:\Users\Tony\Desktop\Grofile\TrajPotential';
Filename = 'traj0_All_atoms.xvg';
 
Data = plot_xvg([FileLoc '\' Filename]);
title('40 MVm Trial1: Traj0 __new.gro')