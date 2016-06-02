
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
    [folder, f] = fileparts(image_path);
    tmp_id = num2str(round(rand*1000*s(6)));
    tmppath = fullfile('/','tmp',[f,'_', tmp_id,'.nii.gz']);
    copyfile([image_path,'.nii.gz'], tmppath);
    gunzip(tmppath);
    nifti_out = load_untouch_nii(fullfile('/','tmp',[f,'_', tmp_id,'.nii']));
    delete(fullfile('/','tmp',[f,'_', tmp_id,'.nii.gz']));
    if exist(tmppath, 'file')
        delete(tmppath);
    end
end


