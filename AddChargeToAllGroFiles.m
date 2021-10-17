function AddChargeToAllGroFiles(GroFilePath,ItpFilePath,PathToWriteFile)
%Function by Anthony Owusu-Mensah (current as of 2020/02)
%Function creates a gro file with a charge column for all
%gro files in the specified path.
ListOfAllFiles = ls(GroFilePath); %List all files in that path 
FilesSplit = strsplit(ListOfAllFiles); % Split at white lines to get filenames
GroFileList = (FilesSplit(contains(FilesSplit,'.gro')))'; %List all 'new.gro files'
    parfor i = 1:length(GroFileList)
        GroFilename =  GroFileList{i}
        AddChargeToGroFile(GroFilePath,GroFilename,ItpFilePath,PathToWriteFile); %Add th e charge column
    end
end