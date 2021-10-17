
function [AllColumns,Charge] = ReadItpFile(Path,filename)
% Function by Anthony Owusu-Mensah (current as of 2020/02)
% Function extracts the charge column from POPC and tip3p itp files
% import algorithm is taken from ReadGroFile.m by
% E. B. Sozer  Can be found on www.sozerlab.com

if contains(filename,'.itp')
    fileloc =[Path '/' filename];
    fileID = fopen(fileloc);  %openFile for reading
    if strncmpi(filename,'POPC',4)
        readstartrow = 16;  %skip the first 16 rows
        natoms = 134; % number of atoms in POPC file
        format = '%10d%15s%8d%8s%8s%8d%8.2f%8.3f%10s%4.4f%*[^\n]';
        AllColumns = textscan(fileID, format, natoms, 'Delimiter', '',... 
        'WhiteSpace', '', 'EmptyValue' ,NaN,'HeaderLines', readstartrow, 'ReturnOnError', false); %Reads all columns of POPC.itp file
        Charge = AllColumns{7}; %Returns all charges= AllColumns{7}; %Returns all charges

    elseif strncmpi(filename,'tip3p',3)
%         fileID = fopen(fileloc);  %openFile for reading
        readstartrow = 8;  %skip the first 8 rows
        natoms = 3; % number of atoms in tip3p file
        format = '%2d%10s%10d%10s%20s%10d%8.3f%[^\n]';
        AllColumns = textscan(fileID, format, natoms, 'Delimiter', '',... 
        'WhiteSpace', '', 'EmptyValue' ,NaN,'HeaderLines', readstartrow, 'ReturnOnError', false); %Reads all columns of POPC.itp file
         Charge = AllColumns{7}; %Returns all charges= AllColumns{7}; %Returns all charges
    end
      fclose(fileID);
else
    disp('File is not an .itp format and is neither POPC or tip3p or tip4p ')
end