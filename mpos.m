function mp = mpos(part)
% Description
%   The function mpos returns the partition(s) with resizing (m) relation
%   to the input partition.
% Usage:
%       mpos (partition in vector format)
% Example:
%       mpos([2 3])
%           ans =
%                   2     4
%                   3     3
% Info:
%   Created in 2014 under MATLAB 2012 (Windows)
%   © Part of Partitional Young Lattice Analysis Toolbox - PYLA Toolbox,
%   Copyright © 2024 Pauxy Gentil Nunes Filho, Daniel Moreira
%   PArtiMus, and MusMat Research Groups - PPGM-UFRJ
%   See License.txt
% ========== Inicialization
tab = [];
part(part==0) = [];
% ========== Number of lines and columns
ncols = size(part,2);
nlin = size(part,1);
% ========== Computation of lines and columns
for lin = 1:nlin
    partemp = part(lin,:);
    for col = 1:ncols
            linresult = partemp;
            % incrementa parte
            linresult (1, col) = part(lin, col)+1;
            % junta na tabela
            tab = [tab; linresult];
    end
end
% sort lines
mpr = sortrows(tab);
% order columns
mps = sort(mpr,2);
% Closing
mp = unique(mps,'rows');
end
