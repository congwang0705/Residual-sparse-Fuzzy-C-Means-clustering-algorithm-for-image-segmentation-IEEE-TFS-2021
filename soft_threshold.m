function x = soft_threshold(b, m)
  x = sign(b)  .* max( abs(b)-m, 0 );
end
