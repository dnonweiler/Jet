function output = isoentropic_P_T_CALC(p1, t1, p2, t2, k)

if isempty(p1)
  output = p2*(t1/t2)^(k/k-1);
elseif isempty(p2)
  output = p1*(t2/t1)^(k/k-1);
elseif isempty(t1)
  output = t2*(p1/p2)^(k-1/k);
elseif isempty(t2)
  output = t1*(p2/p1)^(k-1/k);
else
  output = 'isentropic calculator error';
end
