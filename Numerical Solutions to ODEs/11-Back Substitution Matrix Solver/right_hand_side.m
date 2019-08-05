function f = right_hand_side(t,m)

if m==1 || m==-1 % requires special handling
    f=((3/2)-(cos(1))^2)*cos(t);
else
    f = cos(m*t)-.5*cos(t)*( (cos(m+1)-1)/(m+1) - (cos(m-1)-1)/(m-1));
end

end