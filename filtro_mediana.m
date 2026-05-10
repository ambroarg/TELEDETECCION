function z = filtro_mediana(x, tam_ventana)

  [F, C] = size(x);

  % Crear la matriz de salida (del mismo tipo que la entrada)
  z = zeros(F, C, class(x));

  % Calcular el "radio" o borde de la ventana
  r = floor(tam_ventana / 2);

  % Creamos una matriz ampliada con ceros alrededor para que no dé error
  % al procesar los píxeles que están en los bordes de la imagen
  x_pad = zeros(F + 2*r, C + 2*r, class(x));
  x_pad(r+1 : F+r, r+1 : C+r) = x;

  % Recorremos cada píxel de la imagen original
  for f = 1:F
    for c = 1:C
      % 1. Extraemos la ventana
      ventana = x_pad(f : f+2*r, c : c+2*r);

      % 2. La convertimos en un vector lineal
      vector = ventana(:);

      % 3. Ordenamos los valores de menor a mayor
      vector_ordenado = sort(vector);

      % 4. Extraemos la mediana
      indice_central = ceil(length(vector_ordenado) / 2);
      mediana_val = vector_ordenado(indice_central);

      % 5. Asignamos el valor al píxel central
      z(f, c) = mediana_val;
    end

    if mod(f, 500) == 0 % Solo imprime cada 500 filas para no saturar la consola
        fprintf('Filtrando fila %d de %d...\n', f, F);
    end
  end

end
