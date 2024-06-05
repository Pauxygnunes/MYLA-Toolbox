function mrel = mrel(dn)
% The function mrel returns a table with partitions and its order numbers
% that are in resizing relations. This table is aiming the rendering of a
% graph correspondent to the Partitional Young Lattice.
% Input argument:
%	dn = density-number
% Output: 
%	Table of sizing relations between partitions of the lexset.
% Example: 
%     mrel(4)
% ans =
%   7×3 table
%     p1n    p2n     rel 
%     ___    ___    _____
% 
%      1      3     {'m'}
%      2      5     {'m'}
%      3      6     {'m'}
%      4      8     {'m'}
%      5      9     {'m'}
%      5     10     {'m'}
%      6     11     {'m'}
% Observations:
% Resizing is one of the relations inside the Partitional Young Lattice
% (see Gentil-Nunes, 2009 for more information)
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, 2024, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Initialization
P1 = ptab(dn);
tab = [];
for f = 1:dn
    lista1 = partitions(f);
    for g = 1:size(lista1,1)
        part1 = lista1(g,:);
        % Get rid of zero parts
        part1(part1==0)=[];
        % Translate p1 to LaTeX
        rotp1 = translatep(part1);
        % Find start index.
        ind1 = find(ismember(P1.partitions, rotp1));
        % Do the resizing operation
        lista2 = vpos(part1);
        for h = 1:size(lista2,1)
            % Select p2
            part2 = lista2(h,:);
            % Translate p2
            rotp2 = translatep(part2);
            % Find target index.
            ind2 = find(ismember(P1.partitions, rotp2));
            if ind2
                % mount the block of indices
                tab = [tab; ind1 ind2];
            end
        end
    end
end
% Mount the table
p1n = tab(:,1);
p2n = tab(:,2);
rel = repmat({'v'},size(tab,1),1);
mrel = table(p1n, p2n, rel);
end
