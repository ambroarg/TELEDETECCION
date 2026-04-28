% =========================================================================
% PROYECTO : La Sequía en Doñana y sus Lagunas (2018-2024)
% SCRIPT PRINCIPAL (Integrando las funciones del profesor)
% =========================================================================

% 1. Nombres de los archivos (Adapta según el año que quieras analizar)
nombre_archivo_B03 = '2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B03_(Raw).tiff';
nombre_archivo_B04 = '2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B04_(Raw).tiff';
nombre_archivo_B08 = '2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B08_(Raw).tiff';

% 2. Lectura de las imágenes
banda_verde = imread(nombre_archivo_B03);
banda_roja  = imread(nombre_archivo_B04);
banda_nir   = imread(nombre_archivo_B08);

% 3. Cálculo de los índices llamando a las funciones del profesor
% La ejecución puede tardar un poco debido a los bucles "for"
disp('Calculando el NDWI...');
mapa_ndwi = ndwi(banda_verde, banda_nir);

disp('Calculando el NDVI...');
mapa_ndvi = ndvi(banda_roja, banda_nir);

% 4. Binarización para el agua (Adaptada a la nueva escala 1-255)
% El antiguo umbral de 0 corresponde ahora a 128
umbral_agua = 128; 
mascara_agua = mapa_ndwi > umbral_agua;

% Cálculo de superficie
pixeles_agua = sum(mascara_agua(:));
superficie_agua_ha = pixeles_agua * (100 / 10000);
fprintf('Superficie de agua detectada : %.2f hectáreas\n', superficie_agua_ha);

% 5. Visualizaciones
% ---- Figura 1 : Máscara de agua ----
figure('Name', 'Máscara de Agua (Método del Profesor)');
imshow(mascara_agua);
colormap(gca, [0.8 0.8 0.8; 0 0.4 0.8]);
title('Máscara de Agua (NDWI > 128)');

% ---- Figura 2 : La Vegetación (NDVI) ----
figure('Name', 'Mapa de Vegetación (NDVI)');
% Se muestra de 1 a 255, con un mapa de colores adaptado
imshow(mapa_ndvi, [1 255]);
colormap(gca, 'parula');
colorbar;
title('Índice NDVI (Escala 1-255)');