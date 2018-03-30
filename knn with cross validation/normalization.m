function [xnew] = normalization(x)

[r c ] = size(x);
mX = mean(x,2); 
mX=repmat(mX,1,c);
sX = std(x,[],2); 
sX=repmat(sX,1,c);
xnew= (x- mX) ./ sX;
end
