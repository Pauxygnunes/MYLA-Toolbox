function tr = translatep(tab)
% The function translatep gives LaTeX labels for the table of partitions.
% Input argument: 
%	tab = partitions table
% Output: 
%	tr = string vectors in LaTeX format.
% Example: 
%     translatex(tab)
% Observations:
% LaTeX labels are formatted to provide abbreviated notation of
% partitions with multiplicity indices.
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox Software Package, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% calcula os parsemas de cada canal (eventos)
% 'onset' is a function of MIDI Toolbox Software Package,
% by Tuomas Eerola & Petri Toiviainen, Department of Music,
% ptee@cc.jyu.fi, ptoiviai@cc.jyu.fi 
% Copyright © 2004, University of Jyvaskyla, Finland
% ========== Main function
leg = {};
for f = 1 : size(tab,1)
    leg{f} = converte(tab(f,:));
end
tr = leg';
end
% ========== function converte
function c = converte(vec)
% Conversion module to LaTeX code.
% Returns LaTeX code for each partition in matrix format.
% Input argument: 
%	vec = partition in vector format.
% Output: 
%	c = LaTeX code correspondent to numeric partition.
% Created in 2004, january, under MATLAB 6.0 (PC)
% © Part of PARSEMAT - Parseme Toolbox, 
% Copyright © 2003, 2005, 2007, 2009, Pauxy Gentil Nunes Filho
% See License.txt
% ========== Conversion routine
leg = [];
abs = unique(vec);
% Check if vector is empty, fills when necessary
if sum(abs) > 0
    abs(abs == 0) = [];
else
    abs = 0;
end
% Conversion
    for f = 1:size(abs,2)
        comp = abs(f);
        compstr = num2str(comp);
        if sum(abs) > 0
            ind = size((find(vec==comp)),2);
        else
            ind = 1;
        end
        sps = num2str(ind);
        if comp<=9 && ind>1 && ind<9
            leg = [leg compstr '^' sps];
        elseif comp<=9 && ind>9
            leg = [leg compstr '^' (sps)];
        elseif comp>9 && ind>1 && ind<9
            leg = [leg ' ' compstr '^' sps];
        elseif comp>9 && ind>9 && ind>1
            leg = [leg ' ' compstr '^' (sps)];
        else
            leg = [leg  compstr];
        end
        if f < size(abs,2) && ind==1
            leg = [leg '.'];
        end
        c = leg;
    end
end