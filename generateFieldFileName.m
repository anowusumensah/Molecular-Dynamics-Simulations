function   FieldFileName=generateFieldFileName(newornot,fileno)

if newornot==1
% for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '_new.gro'];
% %   GroFileName =['traj' num2str(fileno) '_new.gro+Charge.txt'];
%     FieldFileName =['traj' num2str(fileno) 'Field.xvg'];
    FieldFileName =['traj' num2str(fileno) 'Field_new.xvg'];
% end
else
%     for i=1:length(fileno)
%   GroFileName{i}=['traj' num2str(fileno(i)) '.gro'];
%       FieldFileName =['traj' num2str(fileno) 'Field.xvg'];
 FieldFileName =['traj' num2str(fileno) 'Field_new.xvg'];
%     end
% end
end
    