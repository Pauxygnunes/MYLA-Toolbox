function pyl = pyl(dn)
% 
% The function pyl renders the Partitional Young Lattice, a variation of
% the Young Lattice with information about the agglomeration and dispersion
% indices.
% 
% Usage
%   pyl(density-number)
% 
% Example
%   pyl(4)
% 
% Observation
%   The Partitional Young Lattice (PYL) serves as a visualization of the
%   relations between musical partitions - resizing, revariance, and
%   transference, among others.
% 
% Created in April 2024 under MATLAB R2021b (Windows)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, 2024, Pauxy Gentil Nunes Filho
% pauxy.contact@gmail.com
% See License.txt
% ========== Initialization
P = ptab(dn);
% Relations
R = [mrel(dn); vrel(dn); trel(dn)];
R = sortrows(R,[1 2]);
s = R.p1n;
t = R.p2n;
e = P.partitions;
% Produces graph
G = graph(s,t,1,e);
pairs = G.Edges.EndNodes;
starts = pairs(:,1);
targets = pairs(:,2);
starts = p2order(P,starts);
targets = p2order(P,targets);
rels = [R.p1n R.p2n];
type = cell2mat(R.rel);
styles = [];
% Classifying relations
for f = 1:size(starts,1)
    lintemp = [starts(f) targets(f)];
    tempinds = find(ismember(rels,lintemp,'rows'));
    t = type(tempinds,:);
    switch t
        case 'm'
            styles = [styles; 1];
        case 'v'
            styles = [styles; 2];
        case 't'
            styles = [styles; 3];
        case 'c'
            styles = [styles; 4];
        otherwise
            styles = [styles; 5];
    end
end
% ========== 3. Subgraph colors
linestyles = [{'-'} {':'} {'--'} {'-.'} {'-'}];
colors = [0.5 0.5 1; 1 0 1; 0.8500 0.3250 0.0980; 1 1 0 ; 0 0 0];
% ==========Initialize subspace plot
LS = lexset(dn);
porders = (1:size(LS,1))';
tab = [porders LS];
agg = aglom(tab)';
dps = dispers(tab)';
% ========== Do plotting
GH = plot(G, 'LineStyle', linestyles(styles),...
            'EdgeColor', colors(styles,:),...
            'LineWidth', 2,...
            'layout', 'subspace',...
            'Dimension', dn+1);
% set(gca, 'ydir','reverse');
set(GH, 'Xdata', agg);
set(GH, 'Ydata', dps)
% plota o grafo force
% GH = plot(G, 'LineStyle', linestyles(styles),...
%             'EdgeColor', colors(styles,:),...
%             'LineWidth', 2,...
%             'layout', 'force')
% set(gca, 'ydir','reverse');
% ========== Detection of relations and filling the table
lines = [];
rels = R.rel;
for f = 1:size(rels,1)
    trelation = rels(f);
    if contains(trelation, 'm')
            tline = 1;
    elseif contains(trelation, 'v')
            tline = 2;
    elseif contains(trelation, 't')
            tline = 3;
    end
    lines = [lines; tline];
end
lines = lines;
% ========== Add text with info
text(GH.XData+.4, GH.YData, ...
    GH.NodeLabel,...
    'HorizontalAlignment', 'center',...
    'VerticalAlignment', 'middle',...
    'Color', 'k',...
    'FontSize', 11,...
    'Margin', 0.02,...
    'BackgroundColor', 'w')
GH.NodeLabel = {};
tab = {};
for f = 1:size(agg,1)
    templine = ['(', num2str(agg(f,:)), ',', num2str(dps(f,:)), ')'];
    templine(templine == ' ') = [];
    tab{f} = templine;
end
tab = tab';
text(GH.XData+.4, GH.YData-0.4, ...
    tab,...
    'HorizontalAlignment', 'center',...
    'VerticalAlignment', 'middle',...
    'Color', 'k',...
    'FontSize', 8,...
    'Margin', 0.02,...
    'BackgroundColor', 'w')
end
% ========== function p2order
function p2order = p2order(tab1,tab2)
inds = [];
    for f = 1:size(tab2,1)
        lintemp = cell2mat(tab2(f,:));
        tempind = find(ismember(tab1.partitions, lintemp));
        inds(f) = tempind;
    end
p2order = inds';
end