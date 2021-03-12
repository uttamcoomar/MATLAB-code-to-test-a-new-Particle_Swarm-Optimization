function f = rosenbrock(D)
str2=' ';
str1='(100*( (x(d,j,(i+1)))^2 - x(d+1,j,(i+1)) )^2) +((1- x(d,j,(i+1)))^2)';
for d=1:D-1
str2=strcat(str2,'+',str1);
str2=strrep(str2,'d',num2str(d));
end
f=str2;
f(1)=[];
end
