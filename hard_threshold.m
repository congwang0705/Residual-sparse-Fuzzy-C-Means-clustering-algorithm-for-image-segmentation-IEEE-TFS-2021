function x = hard_threshold(b, m)
%  x = sign(b)  .* max( abs(b)-m, 0 );
[row col]=size(b);
for i=1:1:row
    for j=1:1:col
        if b(i,j)>=sqrt(m)
            x(i,j)=b(i,j);
        else
            x(i,j)=0;
        end
    end
end
%   if b>=sqrt(m)
%       x=b;
%   else
%       x=0;
% end
