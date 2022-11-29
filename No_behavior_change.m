%% Clear 
clc;
clear all;
%% Initial

syms t y

So = 12346;
Io = 1;
Ro = 0;
Bo = 0;
t_final = 2000;


%% Set global 

global S I R B;



%%
ics = [So, Io, Ro, Bo];
tspan = [0:0.02:t_final];

[time,output] = ode45(@EQ1, tspan, ics);
plot(time,output(:,2),'r')
set(gca,'ycolor','k');

function[D] = EQ1(t,y)

D = zeros(4,1);
K = 2*10^6;
gamma = 1./5;
sigma = 1./(3*365);
mu = 1./(43.5*365);
delta = 1./30;
global S I R B;

S = y(1);
I = y(2);
R = y(3);
B = y(4);
N = S+I+R;

a = [3E-5 0.02 15];

for i = 1:3
    ki = 500;
    bi = 0;
    beta(i) = a(i) - bi*(I/(I+ki));
end
    

D(1) = mu*N-beta(1)*S*I-beta(2)*S*B./(B+K)-mu*S+sigma*R;
D(2) = beta(1)*S*I+beta(2)*S*B./(B+K)-(gamma+mu)*I;
D(3) = gamma*I-(mu+sigma)*R;
D(4) = beta(3)*I-delta*B;

end