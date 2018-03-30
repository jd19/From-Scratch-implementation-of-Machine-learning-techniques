function [xnew] = normalization(x)

[r c ] = size(x);
mX = mean(x,1); 
mX=repmat(mX,r,1);
sX = std(x,[],1); 
sX=repmat(sX,r,1);
xnew= (x- mX) ./ sX;
end
