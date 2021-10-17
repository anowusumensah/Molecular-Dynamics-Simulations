function GroFileName=generateGroPlusChargeFileName(newornot,fileno)
% Function by Anthony Owusu-Mensah current 2020/08
% Function generates names for gro files with a charge column

if newornot==1
% for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '_new.gro'];
% %   GroFileName =['traj' num2str(fileno) '_new.gro+Charge.txt'];
  GroFileName =['traj' num2str(fileno) '_new.gro+Charge.txt'];
% end
else
%     for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '.gro'];
    GroFileName =['traj' num2str(fileno) '.gro+Charge.txt'];
%     end
% end
end
    
    
    