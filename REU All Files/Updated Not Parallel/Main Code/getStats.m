function [results] = getStats(GroundTruth, PlotChange)
columns = length(PlotChange);
rows = size(PlotChange,1);
TP = 0; %True positives
FP = 0; %False positives
TN = 0; %True negatives
FN = 0; %False negatives

for x = 1:rows
    for y = 1:columns
    if GroundTruth(x,y)==1
       if PlotChange(x,y)==1
           TP = TP+1;
       else
           FP = FP+1;
       end
    elseif GroundTruth(x,y)==0
       if PlotChange(x,y)==0
           TN = TN+1;
       else
           FN = FN+1;
       end
    end
    end
end

PCC = (TP + TN) / (TP + FP + TN + FN);
OE = 1-PCC;
fprintf('PCC: %f OE: %f TP : %f TN : %f FP: %f FN: %f \n', PCC, OE, TP, TN, FP, FN);
results=[PCC, OE, TP, TN, FP, FN];
end