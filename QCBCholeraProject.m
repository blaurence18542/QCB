%Cholera Model and Effects of Human Behavior

%initialize constants

%known constants from figure 1 description
N = 12347; %total population from figure 1 description
mu = (43.5*365)^-1; %natural death rate of humans from figure 1 description
a = [3E-5, 0.02, 15];%values from figure 1 description
%direct transmission rate
%indirect transmission rate
%shedding rate
K = 2^6;%half saturation rate from figure 1 description
gamma = 5^-1;%recovery rate from figure 1 description
sigma = (3*365)^-1;%rate of host immunity loss from figure 1 description
delta = 30^-1;%bacteria net death rate from figure 1 description

%varied constants which depend on situations
D = zeros(4,1);%diffusion coefficients
beta = zeros(3,1);%human interaction coefficients

%initial conditions
S_0 = 12346;
I_0 = 1;
B_0 = 0;
R_0 = 0;
