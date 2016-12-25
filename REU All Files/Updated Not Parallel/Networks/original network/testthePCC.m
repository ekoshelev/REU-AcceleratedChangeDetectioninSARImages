 GroundTruth = imread('groundTruth.png')/255;
  GroundTruth = GroundTruth(3:297,3:597);
columns = length(PlotChange);
rows = size(PlotChange,1);
GU=0;
PU=0;

for x = 1:rows
    for y = 1:columns
    if GroundTruth(x,y)==0
       GU=GU+1;
    end
    if PlotChange(x,y)==0
       PU=PU+1;
    end
    end
end
