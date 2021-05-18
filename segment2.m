y = [0;1;1;3];
W = [0 0; 1 1; 2 4; 3 9];
Wt = W.';
invw = inv(Wt*W);
B  = invw*Wt;
B  = B*y