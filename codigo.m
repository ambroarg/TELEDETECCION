% =========================================================================
% PROYECTO : La Sequía en Doñana y sus Lagunas (2018-2024)
% SCRIPT PRINCIPAL (Integrando las funciones del profesor)
% =========================================================================

% 1. Nombres de los archivos (Comenta y descomenta el bloque de la fecha que quieras probar)

% --- FECHA : 17 Mayo 2018 ---
%nombre_archivo_B03 = '2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B03_(Raw).tiff';
%nombre_archivo_B04 = '2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B04_(Raw).tiff';
%nombre_archivo_B08 = '2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B08_(Raw).tiff';
%nombre_archivo_B11 = '2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B11_(Raw).tiff';

% --- FECHA : 19 Septiembre 2018 ---
%nombre_archivo_B03 = '2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B03_(Raw).tiff';
%nombre_archivo_B04 = '2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B04_(Raw).tiff';
%nombre_archivo_B08 = '2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B08_(Raw).tiff';
%nombre_archivo_B11 = '2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B11_(Raw).tiff';

% --- FECHA : 01 Mayo 2022 ---
%nombre_archivo_B03 = '2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B03_(Raw).tiff';
%nombre_archivo_B04 = '2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B04_(Raw).tiff';
%nombre_archivo_B08 = '2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B08_(Raw).tiff';
%nombre_archivo_B11 = '2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B11_(Raw).tiff';

% --- FECHA : 08 Septiembre 2022 ---
%nombre_archivo_B03 = '2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B03_(Raw).tiff';
%nombre_archivo_B04 = '2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B04_(Raw).tiff';
%nombre_archivo_B08 = '2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B08_(Raw).tiff';
%nombre_archivo_B11 = '2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B11_(Raw).tiff';

% --- FECHA : 01 Mayo 2023 ---
%nombre_archivo_B03 = '2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B03_(Raw).tiff';
%nombre_archivo_B04 = '2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B04_(Raw).tiff';
%nombre_archivo_B08 = '2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B08_(Raw).tiff';
%nombre_archivo_B11 = '2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B11_(Raw).tiff';

% --- FECHA : 13 Septiembre 2023 ---
%nombre_archivo_B03 = '2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B03_(Raw).tiff';
%nombre_archivo_B04 = '2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B04_(Raw).tiff';
%nombre_archivo_B08 = '2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B08_(Raw).tiff';
%nombre_archivo_B11 = '2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B11_(Raw).tiff';

% 2. Lectura de las imágenes
banda_verde = imread(nombre_archivo_B03);
banda_roja  = imread(nombre_archivo_B04);
banda_nir   = imread(nombre_archivo_B08);
banda_swir  = imread(nombre_archivo_B11);

% Seguridad: Redimensionar B11 (20m) a la resolución de B08 (10m) si es necesario
if size(banda_swir, 1) ~= size(banda_nir, 1)
    banda_swir = imresize(banda_swir, size(banda_nir));
end

% 3. Cálculo de los índices llamando a las funciones del profesor
disp('Calculando el NDWI...');
mapa_ndwi = ndwi(banda_verde, banda_nir);

disp('Calculando el NDVI...');
mapa_ndvi = ndvi(banda_roja, banda_nir);

disp('Calculando el NDMI...')
mapa_ndmi = ndmi(banda_nir, banda_swir);

% 4. Análisis Espacial
% Binarización para el agua (El antiguo umbral de 0 corresponde ahora a 128)
umbral_agua = 128; 
mascara_agua = mapa_ndwi > umbral_agua;

% Cálculo de superficie de agua
pixeles_agua = sum(mascara_agua(:));
superficie_agua_ha = pixeles_agua * (100 / 10000);
fprintf('Superficie de agua detectada : %.2f hectáreas\n', superficie_agua_ha);

% Definir máscara de vegetación para el cálculo de humedad 
% (NDVI > 153 en escala de 1-255 equivale aprox. a NDVI > 0.2)
mascara_vegetacion = mapa_ndvi > 153;

% Calcular NDMI medio solo en zonas con vegetación
ndmi_solo_vegetacion = double(mapa_ndmi);
ndmi_solo_vegetacion(~mascara_vegetacion) = NaN;
humedad_media_vegetacion = mean(ndmi_solo_vegetacion(mascara_vegetacion), 'omitnan');
fprintf('Humedad media en vegetación (NDMI) : %.2f\n', humedad_media_vegetacion);

% 5. Visualizaciones
% ---- Figura 1 : Máscara de agua ----
figure('Name', 'Máscara de Agua (Método del Profesor)');
imshow(mascara_agua);
colormap(gca, [0.8 0.8 0.8; 0 0.4 0.8]);
title('Máscara de Agua (NDWI > 128)');

% ---- Figura 2 : La Vegetación (NDVI) ----
figure('Name', 'Mapa de Vegetación (NDVI)');
imshow(mapa_ndvi, [1 255]);
colormap(gca, 'parula');
colorbar;
title('Índice NDVI (Escala 1-255)');

% ---- Figura 3 : Humedad en Vegetación (NDMI) ----
figure('Name', 'Mapa de Humedad (NDMI)');
imshow(mapa_ndmi, [1 255]);
colormap(gca, 'jet');
colorbar;
title('Índice NDMI - Humedad en Vegetación (Escala 1-255)');

% ---- Figura 4 : Comparativa de índices ----
figure('Name', 'Comparativa Índices');
subplot(1,3,1);
imshow(mapa_ndwi, [1 255]);
colormap(gca, 'parula');
colorbar;
title('NDWI - Agua Superficial');

subplot(1,3,2);
imshow(mapa_ndvi, [1 255]);
colormap(gca, 'parula');
colorbar;
title('NDVI - Vegetación');

subplot(1,3,3);
imshow(mapa_ndmi, [1 255]);
colormap(gca, 'jet');
colorbar;
title('NDMI - Humedad');

% ---- Figura 5 : Banda Bruta en Escala de Grises e Histograma ----
figure('Name', 'Análisis de la Banda NIR (Escala de Grises y Distribución)');

% Mostrar la imagen en escala de grises (Izquierda)
imshow(banda_nir, []); 
colormap(gca, 'gray');
colorbar;
title('Banda NIR - Escala de Grises');

% Mostrar el histograma (Derecha)
histo_v(double(banda_nir(:)));
title('Histograma de Niveles de Gris (Banda NIR)');
xlabel('Intensidad del píxel (Reflectancia)');
ylabel('Frecuencia (Número de píxeles)');
grid on;
