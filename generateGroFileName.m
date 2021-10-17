function GroFileName=generateGroFileName(newornot,fileno)

if newornot==1
% for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '_new.gro'];
% %   GroFileName =['traj' num2str(fileno) '_new.gro+Charge.txt'];
  GroFileName =['traj' num2str(fileno) '_new.gro'];
% end
else
%     for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '.gro'];
    GroFileName =['traj' num2str(fileno) '.gro'];
%     end
% end
end
    