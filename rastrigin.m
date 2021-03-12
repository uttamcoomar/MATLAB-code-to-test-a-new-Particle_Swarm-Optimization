function f = rastrigin(D)
str2=' ';
str1='((x(d,j,(i+1)))^2)';
str3='(10*(cos(2*pi*(x(d,j,(i+1))))))';
for d=1:D
str2=strcat(str2,'+',str1);
str2=strrep(str2,'d',num2str(d));
end
str4='(10*(cos(2*pi*(x(1,j,(i+1))))))';
for d=2:D
str4=strcat(str4,'+',str3);
str4=strrep(str4,'d',num2str(d));
end
f=strcat(num2str(10*D),str2,'-','(',str4,')');
end
