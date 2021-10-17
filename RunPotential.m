%Script by E.B. Sozer 2020/06 version
% This script can be obtain transport two ions (one cation and one anion)
% in a simulation. Gro files are assumed to be in respective folders
% Recommended use is by running it section by section with run and advance
% button on the MATLAB editor
% This script calls for GROMACS commands and functions
% by E.B. Sozer:
% Needs matlab functions ReadGroFile, generateGroFileName and
% ConductanceCenteredPore_anyion_StepsTrans

clear

%% define folder names

pathmain='/media/tony/655a53c5-762b-4c01-bb94-eb0f80dd3b40/KCl_charmm_sustainingfield';% update this to be the folder where the simulation folders with gro files are located.
pathfield={'40MVm';'50MVm';'60MVm'};
savedatafolder='/home/tony/Desktop/TransportAnalysis'; % update this to be the folder where the results will be saved. Generate a folder for it if none exists in the pathway.

%%

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
newornot=1; %if _new.gro=1, .gro=0
fileno = 0:1000;
%%
for ii=1:size(foldertrial,1)
    i = foldertrial(ii,1);
    j = foldertrial(ii,2);
    pathSimFolder=[pathmain '/' pathfield{i} '/' t(j,:)];
    GroFileName = generateGroFileName(newornot,fileno);
    %% calculate transport
    newornot = 1; %files have _new in their centered gro file names.
    GroFileName_new = generateGroFileName(newornot,fileno);
    cation = 'K';
    anion = 'CL';
    [countK, GroFileIndexK,countCL,GroFileIndexCL] = ConductanceCenteredPore_anyion_StepsTrans_202006(GroFileName_new, cation,anion,pathSimFolder);       
    save([savedatafolder '/Transport_' pathfield{i} '_' t(j,:) '_zshift.mat'],'countK','GroFileIndexK','countCL','GroFileIndexCL');   
 end
%%




