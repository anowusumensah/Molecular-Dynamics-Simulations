function  ChargeFileName=generateChargeFileName(newornot,fileno)

if newornot==1
% for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '_new.gro'];
% %   GroFileName =['traj' num2str(fileno) '_new.gro+Charge.txt'];
    ChargeFileName =['traj' num2str(fileno) 'Charge.xvg'];
% end
else
%     for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '.gro'];
     ChargeFileName =['traj' num2str(fileno) 'Charge.xvg'];
%     end
% end
end
    