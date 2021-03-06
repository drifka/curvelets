function [ outpt ] = GetFirstNeighbor( mask, idx, visitedList )
% GetFirstNeighbor.m - Find the first contiguous neighbor in the mask file
%
% Inputs
%   mask = list [row,col] of foreground pixels in the binary mask created in FIJI
%   idx = index of the point around which we will search for a contiguous white pixel
%   visitedList = list of pixels we've already checked
%
% Optional Inputs
%
% Outputs
%   outpt = first neighbor pixel (row,col)
%
% By Jeremy Bredfeldt Laboratory for Optical and
% Computational Instrumentation 2013


pt = mask(idx,:);
npt = [pt(1) pt(2)+1; pt(1)-1 pt(2); pt(1) pt(2)-1; pt(1)+1 pt(2)]; %search points
outpt = idx;
rows = mask(:,1);
cols = mask(:,2);

%check east, north, west, then south
for i = 1:length(npt)
    %find a position in the list that is next to the current one, that we haven't found yet
    chkIdx = find(rows == npt(i,1) & cols == npt(i,2),1,'first');
    if (~isempty(chkIdx) && visitedList(chkIdx)==0)
        outpt = chkIdx;
        return;
    end
end

end

