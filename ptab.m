function ptab = ptab(n)
% The ptab function returns a table with order numbers and the lexset of a
% given density-number.
% Usage:
%       ptab (density-number)
% Example:
%       ptab(3)
% ans =
%   6×2 table
%     ord      pt   
%     ___    _______
% 
%      1     {'1'  }
%      2     {'1^2'}
%      3     {'2'  }
%      4     {'1^3'}
%      5     {'1.2'}
%      6     {'3'  }
% 
% Created in 2024 under MATLAB 2021b (Windows)
% © Part of Musical Partitional Young Lattice Analysis Toolbox - MPYLA Toolbox,
% Copyright © 2024 Pauxy Gentil Nunes Filho and Daniel Moreira
% PArtiMus, and MusMat Research Groups - PPGM-UFRJ
% See License.txt
% ========== Join lexset with order numbers.
ls = lexset(n);
partitions = translatep(ls);
norder = (1:size(partitions,1))';
ptab = table(norder, partitions);
end
