function ls = lexset(n)
% Returns the lexset of a positive integer number, made by all partitions
% from 1 to n.
%
% Usage
%   function ls = lexset(n)
% 
% Input argument: 
%	N = número inteiro positivo
%
% Output: 
%	A = Lista de partições de 1 até n.
%
% Example: 
%     lexset(4)
%
% Observations:
%   The lexset of a positive integer number is a set of textural
%   configurations for musical applications (mainly compositional), as it
%   represents the potential of use determined by the selection of a
%   instrumental, vocal or electronic medium (see Gentil-Nunes 2009)
%
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Join all partitions from 1 to n
tab = [];
    for f = 1:n
        temp = partitions(f);
        len = length(temp);
        lintemp = [temp zeros(len, n-f)];
        tab = [tab; lintemp];
    end
ls = tab;
end