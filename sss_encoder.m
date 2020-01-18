clear all; clc;

s=input('Please input the data you would like to encode: ');

s=double(s);

for i=1:length(s)
    if ge(s(i),65) && le(s(i),90) == 1
        
    elseif ge(s(i),97) && le(s(i),122) == 1
        s(i)=s(i)-32;
    else
        s(i)=0;
    end
end

[r,c]=find(~s);
r=length(r);

for j=1:r
    s((c(j))-(j-1))=[];
end

a=num2str(s(1));
k=2;

while (numel(a))/2<length(s)
    a=strcat(a,num2str(s(k)));
    k=k+1;
end

intercept=str2num(a);
mag=ceil(ceil(log10(intercept))/2);
ul=10^mag;

m=randi(ul);

x=[randi(ul);randi(ul)];

y=[m*x(1)+intercept;m*x(2)+intercept];

format='Point 1: (%i,%i)\nPoint 2:(%i,%i)\nThe data you have encoded is %s, encoded as %i\nYou can enter this as raw data into sss_decoder\n[%i %i;%i %i]\n';
fprintf(format,x(1),y(1),x(2),y(2),s,intercept,x(1),y(1),x(2),y(2))