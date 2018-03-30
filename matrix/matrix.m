fileId = 'farm-ads.txt';
fid = fopen(fileId);
s = textscan(fid,'%s');
str=s{:};
[ii,jj,kk]=unique(str);
freq=hist(kk,(1:numel(jj))')';

newMap = containers.Map(ii,freq);

mat=zeros(numel(ii),numel(A));

for i = 1:numel(A)
X=A(i);
X=X{:};
X=strsplit(X);
for j = 1:numel(X);
Y = X(j);
Y = Y{:};
if newMap2.isKey(Y);
index = newMap2(Y);
mat(index,i) = mat(index,i)+1;
end
end


