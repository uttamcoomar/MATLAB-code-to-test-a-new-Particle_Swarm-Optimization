clc
mn=[];
fr1=[];
clear all;
p1=0;
p2=0;
prompt = {'Enter dimension:','Enter swarm size:','Enter maximum number of iterations','Enter tolerance','Enter inertia weight factor','Enter cognitive learning acceleration factor','Enter social learning acceleration factor','Enter constriction factor','Enter initial velocity range','Enter initial position range','Enter final swarm size','Enter reduction factor','Enter sorting frequency'};
dlg_title = 'We have to minimize inputted function';
num_lines = 1;
def = {'2','400','1000','4','.6','1','1','1','unifrnd(-5,10,1,p)','unifrnd(-5,10,1,p)','200','2','10'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
[D vald] = str2num(answer{1});
[p valp] = str2num(answer{2});
[it valit]=str2num(answer{3});
[T valT] = str2num(answer{4});
[w valw] = str2num(answer{5});
[rp valrp] = str2num(answer{6});
[rg valrg]= str2num(answer{7});
[rf valrf] = str2num(answer{8});
[pf valPf]=str2num(answer{11});
[r valr]=str2num(answer{12});
[fs valfs]=str2num(answer{13});
str={'Select a function'};
S={'rosenbrock';'sphere';'griewank';'rastrigin'};
choice=listdlg('PromptString',str,'ListSize',[100,100],'ListString',S,'SelectionMode','Single');
switch choice
case 1
str1=rosenbrock(D);
case 2
str1=sphere(D);
case 3
str1=griewank(D);
case 4
str1=rastrigin(D);
end
fev=0;
x=zeros(D,p,it);
v=zeros(D,p,it);
f=zeros(p,it);
fr=zeros(p,2);
df=zeros(1,(it-1));
mn=[];
tic
for d=1:D
x(d,:,1)=eval(answer{9});
v(d,:,1)=eval(answer{10});
end
for j=1:p
i=0;
f(j,1)=0;
f(j,1)=f(j,1)+ eval(str1);
end
[val gb1]=min(f(:,1));
gbest=gb1;
pbest=ones(1,p);
for i=1:it
%for inertia weight W
for j=1:p
for d=1:D
k2=0;
kstr='w*v(d,j,i) + (rp*(x(d,j,pbest(j))-x(d,j,i))) + (rg*(x(d,gbest,i)-x(d,j,i)))';
k2=k2+eval(kstr);
v(d,j,(i+1)) = (rf*k2);
x(d,j,(i+1)) = x(d,j,i) + v(d,j,(i+1));
end
end
for j=1:p
f(j,i+1)=0;
f(j,i+1)= f(j,i+1)+ eval(str1);
fr(j,1)=f(j,i+1);
fr(j,2)=j;
fev=fev+1;
end
choice1=2;
if mod(i,20000)==0
str23={'Exit ?'};
S1={'Yes';'No'};
choice1=listdlg('PromptString',str23,'ListSize',[100,100],'ListString',S1,'SelectionMode','Single');
end
if(p>pf && mod(i,fs)==0)
fr=sortrows(fr);
fr1=fr;
k1=1;
k2=0;
k3=((p/r));
k4=1;
for i1=(k3+1):p
mn(1,k1)=fr(i1,2);
k1=k1+1;
end
v(:,mn,:)=[];
x(:,mn,:)=[];
f(mn,:)=[];
fr(mn,:)=[];
p=p/r;
end
mn=[];
%stopping criterion
if i>1
% print = [x(d,:,i-1) x2(:,i-1) v1(:,i-1) v2(:,i-1) f(:,i-1)];
% disp(' x1 x2 v1 v2 f')
% disp(print)
[val gb1]=min(f(:,i+1));
if val<10^(-T) || choice1==1
break
end
end
gbest=gb1;
for i2=1:p
if f(i2,i+1)<= f(i2,i)
pbest(i2)=i+1;
end
end
end
toc
sprintf('the value of objective function is %d',(f(gb1,i+1)))
sprintf('the number of function evaluations is %d',fev)
for d=1:D
fprintf('the value of x %d is',d)
x(d,gb1,i+1)
end
