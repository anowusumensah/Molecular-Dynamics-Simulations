function [Count] = preventOverwrite(Savedatafolder,Ionindex,Efield,tr)
% Function written by Anthony Owusu-Mensah, current 10/2020
% Function prevents  overwriting an existing file in the
% Transport_Location folder
% During transport a particular ion can be involved in several transport
% events
Count = 0;
Transport_Location_Files = strsplit(ls(Savedatafolder));
a = ['_TransportXYZ_' Efield '_' tr '.mat'];
b1 = 'IndexK_'; b2 = 'IndexCl_' ;
Ionindex = num2str(Ionindex);
for list = 1 :  length(Transport_Location_Files)
    if  length(Transport_Location_Files) > 1 % if directory not empty
        file =  Transport_Location_Files{list}; % Pick a filename
        lenFile = length(file); % Check how long is the name
        if lenFile < 1 % If the selected cell has no filename
            Count =  Count; % Dont count
        else
            if contains(file, b1)
                b = b1;
            else
             
                b = b2;
            end
            file = erase(erase(file,a),b); % Erase all other strings to leave just the index or (index_[int])
            if length(file)> length(Ionindex) % Check length to see if its greater than index number length 
                file = file(1, 1:length(Ionindex)); % Select part that only corresponds to an index number
            end
            if mean(file == Ionindex) == 1
                Count = Count + 1;
            else
                Count =  Count; % Don't alter count
            end
        end
        
    else
        Count = 0; %Initial instance; when there are no files in the directory
        
    end
end