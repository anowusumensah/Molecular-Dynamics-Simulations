
% Script by Anthony Owusu-Mensah, current 08/2020
% Script returns the potential, electric field and charge density
% of atoms in a pore region for each .gro file
% by running gmx potential a package in gromacs

%%% Algorithm 
% 1. Go to directory with .gro and .ind files
% 2. Get .gro file name and its corresponding index file
% 3. Run gmx potential command
% Output is automatically saved to the directory with .gro and .ind files 
% Number of slices chosen was 200

%% Start of program
clear;
pathmain='/media/tony/655a53c5-762b-4c01-bb94-eb0f80dd3b40/KCl_charmm_sustainingfield';% update this to be the folder where the simulation folders with gro files are located.
pathfield={'40MVm';'50MVm';'60MVm'};

t(1,:)='trial1';
t(2,:)='trial2';
t(3,:)='trial3';
%%
endofFields=length(pathfield);
foldertrial=[];
for i=1:endofFields
    for j=1:3
        foldertrial=[foldertrial; i j];
    end
end


%%
% % pathSimFolder=[pathmain '/' pathfield{1} '/' t(1,:)];
newornot=1; %if _new.gro=1, .gro=0
fileno = 0 : 1000;
for kk  = 1:length(fileno)
    for ii=1:size(foldertrial,1)
        i = foldertrial(ii,1);
        j = foldertrial(ii,2);
        GroFileName_new = generateGroFileName(newornot,fileno(kk)); % .gro file name
        IndexFileName = generateIndexFileName(newornot,fileno(kk),pathfield{i},t(j,:)); % Index file name
        pathSimFolder=[pathmain '/' pathfield{i} '/' t(j,:)];
        OldPath = cd( pathSimFolder); % get into the directory with .gro file and .ndx fil
        
% %         This section runs (gmx potential -s topol.tpr -n indexfilename -f grofilename -sl 200
% %         -o trajnamePotential -oc trajnameCharge -of TrajnameField) 
        trajname  =  erase(GroFileName_new,'_new.gro');
        trajnamePotential  = [trajname 'Potential_new' ];
        trajnameCharge = [trajname 'Charge_new' ];
        trajnameField = [trajname 'Field_new' ];
        command =['gmx potential -s topol.tpr -n ' IndexFileName ' -f ' GroFileName_new ' -sl 200 -o ' trajnamePotential ' -oc ' trajnameCharge  ' -of ' trajnameField '  > /dev/null 2>&1  ']; 
% %         disp(command)
      system(command);
        cd(OldPath); % go back to directory with matlab scripts
       if (kk == fileno(end))
              disp(command);
       end
    end
    
end
 cd(OldPath); % go back to directory with matlab scripts 






















