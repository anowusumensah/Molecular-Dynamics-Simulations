function AddChargeToGroFile(GroFilePath,GroFilename,ItpFilePath,PathToWriteFile)
% Function by Anthony Owusu-Mensah (current as of 2020/02) 
% Function creates an array of charges for gro files and writes a gro file
% with a charge column to the specified path 
%export algorithm is taken from ConductanceCenteredPore_anyion_201908.m by E. B. Sozer.  
%Can be found on www.sozerlab.com
[AllTraj,nAtoms, MolID, Resname, Atomtype, AllPositionsx,AllPositionsy,AllPositionsz,~,Box_dim,newLine1] = ...
ReadGroFile(GroFilePath, GroFilename);
AtomID = AllTraj{4};
[~,ChargePOPC] = ReadItpFile(ItpFilePath,'POPC.itp'); %Read POPC
[~,ChargeTip3p] = ReadItpFile(ItpFilePath,'tip3p.itp'); % Tip3P
AllTraj3 = strtrim(AllTraj{3}); % Third column in gro file
ChargeColGro = zeros(nAtoms,1); %Charge Column of gro file
CountPOPC = find(strcmpi(strtrim(AllTraj{2}),'POP')); %Length of POPC in gro file
POPC_Charge = repmat(ChargePOPC,[(length(CountPOPC)/length(ChargePOPC))  1]);
OW_ind = strncmpi(AllTraj3,'OW',2); %Indices of OW water molecule 
HW_ind = strncmpi(AllTraj3,'HW',2); %Indices of HW1 and HW2 water molecule
K_ind = strncmpi(AllTraj3,'K',1); % Indices of Potassium ions
CL_ind = strncmpi(AllTraj3,'CL',2);% Indices of Chloride ions
%%Assign charges to all
ChargeColGro(CountPOPC) = POPC_Charge; %Assign charges to POPC
ChargeColGro(OW_ind ) = ChargeTip3p(1);
ChargeColGro(HW_ind) = ChargeTip3p(2);
ChargeColGro(K_ind) = 1;
ChargeColGro(CL_ind ) = -1;

%This section creates a gro file with a charge column
finemame_out = [GroFilename '+charge.txt'];
fileID = fopen([PathToWriteFile '/' finemame_out],'w');
fprintf(fileID,newLine1);
fprintf(fileID,'%-5i\n',nAtoms);

Atom_section=cell(nAtoms,10);
    for i = 1:nAtoms
        Atom_section{i,1} = MolID(i);
        Atom_section{i,2} = Resname{i};
        Atom_section{i,3} = Atomtype{i};
        Atom_section{i,4} = AtomID(i);
        Atom_section{i,5} = AllPositionsx(i);
        Atom_section{i,6} = AllPositionsy(i);
        Atom_section{i,7} = AllPositionsz(i);
        Atom_section{i,8} = ChargeColGro(i);
        fprintf( fileID,'%5d%-5s%5s%5d%8.3f%8.3f%8.3f%8.3f\n', Atom_section{i,1:8});
    end
    %%
fprintf(fileID, '%10.5f%10.5f%10.5f\n',Box_dim(1:3));
%%
fclose(fileID);
 end

