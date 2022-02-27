function result = match(i)
global M
global N
global Map
global p
global vis
for j = 1: N
    if Map(i, j) && ~vis(j)
        vis(j) = 1;
        if p(j) == 0 || match(p(j))
            p(j) = i;
            result = true;
            return;
        end
    end
end
result = false;
return;
end
