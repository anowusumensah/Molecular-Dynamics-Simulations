function [AllTraj,nAtoms, MolID, Resname, Atomtype, AllPositionsx,AllPositionsy,AllPositionsz,Charge,Box_dim,newLine1] = ReadGroFilePlusCharge(path, filename)
% Function by E. B. Sozer (current as of 2019/07) that 
% extracts information from gro files
% format string and import algorthm is taken from atom_import_gro file by
% Michael Holboe, found through MathWorks File Exchange. Can be found on his
% website http://moleculargeo.chem.umu.se/codes/atom-scripts/

readstartrow= 2;
% a=[path '/' filename]
% fileID=fopen([path '/' filename]); % Use this on linux
fileID=fopen([path '\' filename]); % Use this on Windows
format='%5s%5s%5s%5.0f%8.3f%8.3f%8.3f%8.4f%8.4f%8.4f%[^\n\r]';
Line1 = {fgets(fileID)};
newLine1 = char(Line1{1});
% indj=find(newLine1=='j');%find tranjcov
% indv=find(newLine1=='v');%find tranjcov
%newLine1(indj-2:indv)='Matlab ';
Line2 = {fgets(fileID)};
% Title=strsplit(char(Line2));
nAtoms=str2double(Line2);
Box_string = textscan(fileID, '%s',1,'delimiter', '\n','HeaderLines', nAtoms);
Box_dim=str2double(strsplit(char(Box_string{1,1})));
fclose(fileID);
%%
fileID=fopen([path '/' filename]);
%AllTraj=textscan(fileID,format,'HeaderLines',readstartrow);
AllTraj=textscan(fileID, format, nAtoms, 'Delimiter', '', 'WhiteSpace', '', 'EmptyValue' ,NaN,'HeaderLines', readstartrow, 'ReturnOnError', false);
fclose(fileID);
%%
nAtoms=size(AllTraj{:,5}(:),1);
MolID = str2double((AllTraj{:,1})); % Converts to double
Resname = strtrim(AllTraj{:,2});
Atomtype = strtrim(AllTraj{:,3});
% ind=find(AllTraj{:,4}(:)>99999);
% AllTraj{1,4}(ind)=AllTraj{1,4}(ind)-100000;
% AtomID = AllTraj{:,4}; % Converts to double
AllPositionsx = AllTraj{:,5};
AllPositionsy = AllTraj{:,6};
AllPositionsz = AllTraj{:,7};
Charge = AllTraj{:,8};
end