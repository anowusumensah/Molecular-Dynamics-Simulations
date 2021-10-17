function  IndexFileName=generateIndexFileName(newornot,fileno,Efield,trial)

if newornot==1
% for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '_new.gro'];
% %   GroFileName =['traj' num2str(fileno) '_new.gro+Charge.txt'];
  IndexFileName =['traj' num2str(fileno) '_new_' Efield '_' trial '_index_new.ndx'];
% end
else
%     for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '.gro'];
     IndexFileName =['traj' num2str(fileno) '_' Efield '_' trial '_index_new.ndx'];
%     end
% end
end
    