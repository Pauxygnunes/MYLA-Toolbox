function mnet = mnet(n)
% Description
%   The function mnet generates the mnet network (based on the relation of
%   resizing) for a given density-number. Plots the network on the partitiogram.
% Usage:
%   mnet(density-number)
% Example:
%   mnet(4)
% Observation:
%   Nets of partition relations are formed in the partitiogram and can be
%   used to assess the trajectories of a musical piece. The resizing
%   relation exists between two partitions that have the same number of
%   parts but a unitary difference between the cardinality of one of the
%   parts. For instance, (1,1,2) and (1,1,3).
% Info:
%   Created in April 2024 under MATLAB R2021b (Windows)
%   © Part of MPYL - Musical Partitional Young Lattice Toolbox, 
%   Copyright ©2024, Pauxy Gentil Nunes Filho (pauxy.contact@gmail.com)
%   See License.txt
% ========== Initialization
tabx = [];
taby = [];
for f = 1:n
    lista1 = partitions(f);
    for g = 1:size(lista1,1)
        part1 = lista1(g,:);
        part1(part1==0)=[];
        % Relation calculus
        lista2 = mpos(part1);
        for h = 1:size(lista2,1)
            part2 = lista2(h,:);
            x = [(aglom([1 part1])) (aglom([1 part2]))];
            y = [(dispers([1 part1])) (dispers([1 part2]))];
            tabx = [tabx; x];
            taby = [taby; y];
        end
    end
end
% ========== mnet plotting
plotlexsetpoints(n+1)
grid on
hold on
for f = 1:size(tabx,1)
    line(tabx(f,:), taby(f,:),...
        'Color', 'b',...
        'LineWidth',.5)
end
end
