clear; clc;

input1='Please select (1) to enter data manually, or (2) for data exported from sss_encoder.m: ';
switchprompt=input(input1);

if switchprompt==1
        for i=1:2
            inputx=['Please enter the value of x',num2str(i),': '];
            inputy=['Please enter the value of y',num2str(i),': '];
            x(i)=input(inputx);
            y(i)=input(inputy);
        end
elseif switchprompt==2        
        input2='Please enter data from sss_encoder.m: ';
        xy=input(input2);
        for i=1:2
            x(i)=xy(i,1);
            y(i)=xy(i,2);
        end
else
    disp('Not a valid option')
end

p=polyfit(x,y,1);
a=num2str(p(2));

for i=1:length(a)/2
    g=(i*2)-1;
    h=g+1;
    b{i}=a(g:h);
end

c=convertCharsToStrings(char(str2num(char(b))'));

format='Your decoded input is:\n%s\n';
fprintf(format,c)