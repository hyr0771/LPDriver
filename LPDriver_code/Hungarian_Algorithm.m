function cnt = Hungarian_Algorithm()
global M
global N
global Map
global p
global vis

%graph_num = 1;
cnt = 0;
for i = 1: M
    vis = zeros(N, 1);
    if match(i)
        cnt = cnt + 1;
    end
    
end


