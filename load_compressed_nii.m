
function [nifti_out] = load_compressed_nii(image_path)
%*****************************************************************
% LOAD NIFTI compressed nifti
%    
% Simple function to decompress and load a nifti volume.
%
% This library makes use of the wonderful toolbox provided by Jimmy Shen. 
% https://www.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image    
% 
% ****************************************************************  
    s = clock;
    % assign a new tmp_id to each volume is useful when the same images are used in parallel
    tmp_id = num2str(round(rand*1000*s(6)));
    copyfile([image_path,'.nii.gz'], [image_path,'_',tmp_id,'.nii.gz']);
    gunzip([image_path,'_',tmp_id,'.nii.gz']);
    nifti_out = load_untouch_nii([image_path,'_',tmp_id,'.nii']);
    delete([image_path,'_',tmp_id,'.nii']);
    if exist([image_path,'_',tmp_id,'.nii.gz'],'file')
        delete([image_path,'_',tmp_id,'.nii.gz']);
    end
end


