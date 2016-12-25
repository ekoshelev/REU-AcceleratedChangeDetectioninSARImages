

function [Lsim, sample] = preclassify(in1, in2);

preI = in1;
postI = in2;
[maxX,maxY]=size(preI);
[maxX2,maxY2]=size(postI);
assert(maxX == maxX2 && maxY == maxY2);


[sim, var1, var2] = Simvar(preI, postI);
[Lsim, simcc1, simcc2] = FCM(sim);
[Lpre, precc1, precc2] = FCM(preI);
[Lpost, postcc1, postcc2] = FCM(postI);

Tsim = (simcc1 + simcc2) / 2;

for i = 1:maxX
    for j = 1:maxY
        if sim(i, j) < Tsim
            if var1(i, j) > var2(i, j)
                Lpost(i, j) = Lpre(i, j);
            else
                Lpre(i, j) = Lpost(i, j);
            end
        end
    end
end

sample = neigh(preI);
end

