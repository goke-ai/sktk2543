clear
clc
format long
dp=4;

g=9.81;
v=5;
t=2.5;
L=4;

f = @(H) sqrt(2*g*H) * tanh(sqrt(2*g*H/2/L*t)) - v;

xl=0;
xu=4;
es=5;
maxIt=50;

[root, ea, iter, T] = false_position(f,xl,xu,es,[],dp);

writetable(T, 'A1Q1T1.xlsx');
fprintf('A1Q1\n\n');

i=1;
fprintf('iteration  = %d\n\n', i);
fprintf('Hl  = %.4f\n', T.Xl(i));
fprintf('Hu  = %.4f\n', T.Xu(i));
fprintf('fHl = %.4f\n', T.fXl(i));
fprintf('fHu = %.4f\n', T.fXu(i));
fprintf('Hr  = %.4f\n', T.Xr(i));
fprintf('fHr = %.4f\n', T.fXr(i));
if T.fXlxfXr(i)<0, fprintf('sign = -\n');else, fprintf('sign = +\n'); end
fprintf('ea  = %.4f\n', T.Ea(i));

fprintf('\n');

i=2;
fprintf('iteration  = %d\n\n', i);
fprintf('Hl  = %.4f\n', T.Xl(i));
fprintf('Hu  = %.4f\n', T.Xu(i));
fprintf('fHl = %.4f\n', T.fXl(i));
fprintf('fHu = %.4f\n', T.fXu(i));
fprintf('Hr  = %.4f\n', T.Xr(i));
fprintf('fHr = %.4f\n', T.fXr(i));
if T.fXlxfXr(i)<0, fprintf('sign = -\n');else, fprintf('sign = +\n'); end
fprintf('ea  = %.4f\n', T.Ea(i));


T


% fm = @(xl,xu,fl,fu) xu - (fu*(xl-xu)/(fl-fu));
% [root, ea, iter, T1] = root_open_bracket(fm,f,xl,xu,es,[],dp)

