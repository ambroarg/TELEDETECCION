% =========================================================================
% PROYECTO : La Sequía en Doñana y sus Lagunas (2018-2024)
% SCRIPT PRINCIPAL (Integrando las funciones del profesor)
% =========================================================================

% 1. Nombres de los archivos (Comenta y descomenta el bloque de la fecha que quieras probar)

% --- FECHA : 17 Mayo 2018 ---
%nombre_archivo_B03 = 'imagenes (8 bits)\17 05 2018\2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B03_(Raw).png';
%nombre_archivo_B04 = 'imagenes (8 bits)\17 05 2018\2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B04_(Raw).png';
%nombre_archivo_B08 = 'imagenes (8 bits)\17 05 2018\2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B08_(Raw).png';
%nombre_archivo_B11 = 'imagenes (8 bits)\17 05 2018\2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B11_(Raw).png';

% --- FECHA : 19 Septiembre 2018 ---
%nombre_archivo_B03 = 'imagenes (8 bits)\19 09 2018\2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B03_(Raw).png';
%nombre_archivo_B04 = 'imagenes (8 bits)\19 09 2018\2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B04_(Raw).png';
%nombre_archivo_B08 = 'imagenes (8 bits)\19 09 2018\2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B08_(Raw).png';
%nombre_archivo_B11 = 'imagenes (8 bits)\19 09 2018\2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B11_(Raw).png';

% --- FECHA : 01 Mayo 2022 ---
%nombre_archivo_B03 = 'imagenes (8 bits)\01 05 2022\2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B03_(Raw).png';
%nombre_archivo_B04 = 'imagenes (8 bits)\01 05 2022\2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B04_(Raw).png';
%nombre_archivo_B08 = 'imagenes (8 bits)\01 05 2022\2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B08_(Raw).png';
%nombre_archivo_B11 = 'imagenes (8 bits)\01 05 2022\2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B11_(Raw).png';

% --- FECHA : 08 Septiembre 2022 ---
%nombre_archivo_B03 = 'imagenes (8 bits)\08 09 2022\2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B03_(Raw).png';
%nombre_archivo_B04 = 'imagenes (8 bits)\08 09 2022\2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B04_(Raw).png';
%nombre_archivo_B08 = 'imagenes (8 bits)\08 09 2022\2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B08_(Raw).png';
%nombre_archivo_B11 = 'imagenes (8 bits)\08 09 2022\2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B11_(Raw).png';

% --- FECHA : 01 Mayo 2023 ---
nombre_archivo_B03 = 'imagenes (8 bits)\01 05 2023\2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B03_(Raw).png';
nombre_archivo_B04 = 'imagenes (8 bits)\01 05 2023\2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B04_(Raw).png';
nombre_archivo_B08 = 'imagenes (8 bits)\01 05 2023\2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B08_(Raw).png';
nombre_archivo_B11 = 'imagenes (8 bits)\01 05 2023\2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B11_(Raw).png';

% --- FECHA : 13 Septiembre 2023 ---
%nombre_archivo_B03 = 'imagenes (8 bits)\13 09 2023\2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B03_(Raw).png';
%nombre_archivo_B04 = 'imagenes (8 bits)\13 09 2023\2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B04_(Raw).png';
%nombre_archivo_B08 = 'imagenes (8 bits)\13 09 2023\2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B08_(Raw).png';
%nombre_archivo_B11 = 'imagenes (8 bits)\13 09 2023\2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B11_(Raw).png';

% 2. Lectura de las imágenes
banda_verde = imread(nombre_archivo_B03);
banda_roja  = imread(nombre_archivo_B04);
banda_nir   = imread(nombre_archivo_B08);
banda_swir  = imread(nombre_archivo_B11);

% Seguridad: Redimensionar B11 (20m) a la resolución de B08 (10m) si es necesario
% Nota: Si en Octave puro sin librerías esto diera error, asume que las
% imágenes ya vienen al mismo tamaño desde el satélite/profesor.
if size(banda_swir, 1) ~= size(banda_nir, 1)
    banda_swir = imresize(banda_swir, size(banda_nir));
end

% 3. Cálculo de los índices llamando a las funciones del profesor
disp('Calculando el NDWI...');
mapa_ndwi = ndwi(banda_verde, banda_nir);

disp('Calculando el NDVI...');
mapa_ndvi = ndvi(banda_roja, banda_nir);

disp('Calculando el NDMI...');
mapa_ndmi = ndmi(banda_nir, banda_swir);

% =========================================================================
% 4. Análisis Espacial y Clasificación Filtrada
% =========================================================================

% --- 4.1 Máscaras iniciales (Umbrales) ---
umbral_agua = 115; % Originalmente 128
mascara_agua_bruta = mapa_ndwi > umbral_agua;
mascara_vegetacion = mapa_ndvi > 153;

% --- 4.2 Mapa de Clasificación y Filtrado Espacial ---
% Creamos mapa vacío (0=Suelo), y superponemos vegetación (1) y agua (2)
mapa_clases = zeros(size(mapa_ndvi), 'uint8');
mapa_clases(mascara_vegetacion) = 1;
mapa_clases(mascara_agua_bruta) = 2;

% Aplicamos NUESTRO filtro de mediana casero (Ventana de 5x5)
disp('Aplicando filtro de mediana propio (esto puede tardar unos minutos, paciencia)...');
mapa_clases_filtrado = filtro_mediana(mapa_clases, 5);

% --- 4.3 Extracción de Datos Finales ---
% Extraemos la máscara de agua ya limpia tras el filtrado
mascara_agua_limpia = mapa_clases_filtrado == 2;
pixeles_agua = sum(mascara_agua_limpia(:));
superficie_agua_ha = pixeles_agua * (100 / 10000);
fprintf('Superficie de agua (Filtrada) : %.2f hectáreas\n', superficie_agua_ha);

% Calculamos la humedad media (NDMI) solo en los píxeles de vegetación
% Formato lineal para evitar errores en Octave
ndmi_lineal = mapa_ndmi(mascara_vegetacion);
if isempty(ndmi_lineal)
    humedad_media_vegetacion = 0;
else
    humedad_media_vegetacion = mean(double(ndmi_lineal));
end
fprintf('Humedad media en vegetación (NDMI) : %.2f\n', humedad_media_vegetacion);


% =========================================================================
% 5. Visualizaciones
% =========================================================================

% ---- Figura 1 : Máscara de agua limpia ----
figure('Name', 'Máscara de Agua Limpia');
imshow(mascara_agua_limpia);
colormap(gca, [0.8 0.8 0.8; 0 0.4 0.8]);
title('Máscara de Agua Filtrada');

% ---- Figura 2 : Clasificación del Terreno (NUEVA) ----
figure('Name', 'Clasificación del Terreno');
colores_clases = [0.8 0.8 0.8; 0.2 0.7 0.2; 0.0 0.4 0.8]; % Suelo, Vegetación, Agua
imshow(mapa_clases_filtrado, []);
colormap(gca, colores_clases);

% SOLUCIÓN PARA OCTAVE:
cb = colorbar(); % 1. Dibujamos la barra y guardamos su "identificador" en cb
set(cb, 'YTick', [0.33, 1, 1.66]); % 2. Ponemos las marcas a las alturas correctas
set(cb, 'YTickLabel', {'Suelo', 'Vegetacion', 'Agua'}); % 3. Ponemos los nombres

title('Clasificación Filtrada (Mediana 5x5)');

% ---- Figura 3 : La Vegetación (NDVI) ----
figure('Name', 'Mapa de Vegetación (NDVI)');
imshow(mapa_ndvi, [1 255]);
colormap(gca, 'parula');
colorbar;
title('Índice NDVI (Escala 1-255)');

% ---- Figura 4 : Humedad en Vegetación (NDMI) ----
figure('Name', 'Mapa de Humedad (NDMI)');
imshow(mapa_ndmi, [1 255]);
colormap(gca, 'jet');
colorbar;
title('Índice NDMI - Humedad en Vegetación (Escala 1-255)');

% ---- Figura 5 : Comparativa de índices ----
figure('Name', 'Comparativa Índices');
subplot(1,3,1);
imshow(mapa_ndwi, [1 255]);
colormap(gca, 'jet');
title('NDWI - Agua Superficial');

subplot(1,3,2);
imshow(mapa_ndvi, [1 255]);
colormap(gca, 'jet');
title('NDVI - Vegetación');

subplot(1,3,3);
imshow(mapa_ndmi, [1 255]);
colormap(gca, 'jet');
title('NDMI - Humedad');

% ---- Figura 6 : Banda Bruta en Escala de Grises e Histograma ----
figure('Name', 'Análisis de la Banda NIR');
subplot(1,2,1);
imshow(banda_nir, []);
colormap(gca, 'gray');
title('Banda NIR - Escala de Grises');

subplot(1,2,2);
subplot(1,2,2);
% 1. Guardamos el resultado matemático en una variable
frecuencias = histo_v(double(banda_nir(:)));
% 2. Dibujamos las frecuencias como un gráfico de barras negro
bar(1:255, frecuencias, 'k', 'EdgeColor', 'none');
title('Histograma (Banda NIR)');
xlabel('Intensidad (Reflectancia)');
ylabel('Frecuencia (Píxeles)');
grid on;
