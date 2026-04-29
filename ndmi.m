% NDMI a partir de bandas NIR y SWIR
% (Llevado a rango [1, 255])

function z = ndmi(x, y)

  [F, C] = size(x);
  x = double(x) / 255; % NIR
  y = double(y) / 255; % SWIR

  z = zeros(F, C);

  for f = 1:F
    for c = 1:C
      n = x(f, c);
      s = y(f, c);
      if n > 0 && s > 0
        ix = (n - s) / (n + s);
        ndp = (ix + 1) * 254 / 2 + 1;
        z(f, c) = ndp;
      end
    end
    f
  end
  
  z = uint8(z);

end