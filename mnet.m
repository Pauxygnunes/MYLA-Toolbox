function mnet = mnet(n)
% mnet summary of this function goes here
% Detailed explanation goes here
tabx = [];
taby = [];
for f = 1:n
    lista1 = partitions(f);
    for g = 1:size(lista1,1)
        part1 = lista1(g,:)
        part1(part1==0)=[];
        % cálculo do operador
        lista2 = mpos(part1);
        for h = 1:size(lista2,1)
            part2 = lista2(h,:)
            x = [(aglom([1 part1])) (aglom([1 part2]))];
            y = [(dispers([1 part1])) (dispers([1 part2]))];
            tabx = [tabx; x];
            taby = [taby; y];
        end
    end
end
plotlexsetpoints(n+1)
grid on
hold on
for f = 1:size(tabx,1)
    line(tabx(f,:), taby(f,:),...
        'Color', 'b',...
        'LineWidth',.5)
end
end


