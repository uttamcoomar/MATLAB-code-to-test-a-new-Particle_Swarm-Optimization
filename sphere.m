function f = sphere(D)
str2=' ';
str1='(x(d,j,(i+1)))^2';
for d=1:D
str2=strcat(str2,'+',str1);
str2=strrep(str2,'d',num2str(d));
end
f=str2;
f(1)=[];
end
