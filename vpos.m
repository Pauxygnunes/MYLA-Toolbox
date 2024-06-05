function vp = vpos(part)
% Function vpos returns a partitions table that are in relation of
% revariance in relation to a given partition or partitions table.
% Usage
%   vpos (partition or partitions table)
% Example
%   vpos([1 2])
% 
%       ans =
% 
%           1     1     2
% Created in 2014 under MATLAB 2012 (Windows)
% © Part of Musical Partitional Young Lattice Analysis Toolbox - MPYLA Toolbox,
% Copyright © 2024 Pauxy Gentil Nunes Filho, Daniel Moreira
% PArtiMus, and MusMat Research Groups - PPGM-UFRJ
% See License.txt
% ==========Initialize
vp = [];
    for f = 1:size(part,1)
        templine = part(f,:);
        % Add a unitary part
        tempv = [templine 1];
        tempv = sort (tempv);
        vp = [vp; tempv];
    end
end
