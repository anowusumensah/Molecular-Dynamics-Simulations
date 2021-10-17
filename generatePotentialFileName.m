function  PotentialFileName=generatePotentialFileName(newornot,fileno)

if newornot==1
% for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '_new.gro'];
% %   GroFileName =['traj' num2str(fileno) '_new.gro+Charge.txt'];
%   PotentialFileName =['traj' num2str(fileno) 'Potential.xvg'];
% %     PotentialFileName =['traj' num2str(fileno) 'Charge.xvg'];
  PotentialFileName =['traj' num2str(fileno) 'Potential_new.xvg'];
% end
else
%     for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '.gro'];
%      PotentialFileName =['traj' num2str(fileno) 'Potential.xvg'];
     PotentialFileName =['traj' num2str(fileno) 'Potential_new.xvg'];
%     end
% end
end
    