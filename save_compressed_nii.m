function save_compressed_nii(nii_image, image_path)
%*****************************************************************
% SAVE NIFTI compressed nifti
%    
% Simple function to save a nifti volume in compressed mode.
%
% This library makes use of the wonderful toolbox provided by Jimmy Shen. 
% https://www.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image    
% 
% ****************************************************************  
    
    save_untouch_nii(nii_image, [image_path,'_tmp_.nii']); 
    gzip([image_path,'_tmp_.nii']);
    movefile([image_path,'_tmp_.nii.gz'], [image_path,'.nii.gz']);
    % if current image exists delete it
    if exist([image_path,'.nii'],'file')
        delete([image_path,'.nii']);
    end
end