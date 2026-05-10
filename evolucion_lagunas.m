% =========================================================================
% PROYECTO : La Sequía en Doñana y sus Lagunas (Serie Temporal Completa)
% SCRIPT : evolucion_lagunas.m (Enfoque Lineal, Imagen Completa)
% =========================================================================

disp('Iniciando procesamiento de la serie temporal (Método Lineal)...');

% =========================================================================
% FECHA 1 : 17 Mayo 2018
% =========================================================================
disp('Procesando: 17 Mayo 2018...');
b03_f1 = imread('imagenes (8 bits)\17 05 2018\2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B03_(Raw).png');
b04_f1 = imread('imagenes (8 bits)\17 05 2018\2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B04_(Raw).png');
b08_f1 = imread('imagenes (8 bits)\17 05 2018\2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B08_(Raw).png');
b11_f1 = imread('imagenes (8 bits)\17 05 2018\2018-05-17-00_00_2018-05-17-23_59_Sentinel-2_L2A_B11_(Raw).png');

% Índices y Clasificación
ndwi_f1 = ndwi(b03_f1, b08_f1);
ndvi_f1 = ndvi(b04_f1, b08_f1);
ndmi_f1 = ndmi(b08_f1, b11_f1);

mapa_clases_f1 = zeros(size(ndvi_f1), 'uint8');
mapa_clases_f1(ndvi_f1 > 153) = 1;
mapa_clases_f1(ndwi_f1 > 110) = 2;

mapa_filtrado_f1 = filtro_mediana(mapa_clases_f1, 5);

% Extracción
masc_agua_f1 = mapa_filtrado_f1 == 2;
area_f1 = sum(masc_agua_f1(:)) * (100 / 10000);
humedad_f1 = mean(double(ndmi_f1(ndvi_f1 > 153)));


% =========================================================================
% FECHA 2 : 19 Septiembre 2018
% =========================================================================
disp('Procesando: 19 Septiembre 2018...');
b03_f2 = imread('imagenes (8 bits)\19 09 2018\2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B03_(Raw).png');
b04_f2 = imread('imagenes (8 bits)\19 09 2018\2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B04_(Raw).png');
b08_f2 = imread('imagenes (8 bits)\19 09 2018\2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B08_(Raw).png');
b11_f2 = imread('imagenes (8 bits)\19 09 2018\2018-09-19-00_00_2018-09-19-23_59_Sentinel-2_L2A_B11_(Raw).png');

% Índices y Clasificación
ndwi_f2 = ndwi(b03_f2, b08_f2);
ndvi_f2 = ndvi(b04_f2, b08_f2);
ndmi_f2 = ndmi(b08_f2, b11_f2);

mapa_clases_f2 = zeros(size(ndvi_f2), 'uint8');
mapa_clases_f2(ndvi_f2 > 153) = 1;
mapa_clases_f2(ndwi_f2 > 110) = 2;

mapa_filtrado_f2 = filtro_mediana(mapa_clases_f2, 5);

% Extracción
masc_agua_f2 = mapa_filtrado_f2 == 2;
area_f2 = sum(masc_agua_f2(:)) * (100 / 10000);
humedad_f2 = mean(double(ndmi_f2(ndvi_f2 > 153)));


% =========================================================================
% FECHA 3 : 01 Mayo 2022
% =========================================================================
disp('Procesando: 01 Mayo 2022...');
b03_f3 = imread('imagenes (8 bits)\01 05 2022\2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B03_(Raw).png');
b04_f3 = imread('imagenes (8 bits)\01 05 2022\2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B04_(Raw).png');
b08_f3 = imread('imagenes (8 bits)\01 05 2022\2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B08_(Raw).png');
b11_f3 = imread('imagenes (8 bits)\01 05 2022\2022-05-01-00_00_2022-05-01-23_59_Sentinel-2_L2A_B11_(Raw).png');

% Índices y Clasificación
ndwi_f3 = ndwi(b03_f3, b08_f3);
ndvi_f3 = ndvi(b04_f3, b08_f3);
ndmi_f3 = ndmi(b08_f3, b11_f3);

mapa_clases_f3 = zeros(size(ndvi_f3), 'uint8');
mapa_clases_f3(ndvi_f3 > 153) = 1;
mapa_clases_f3(ndwi_f3 > 110) = 2;

mapa_filtrado_f3 = filtro_mediana(mapa_clases_f3, 5);

% Extracción
masc_agua_f3 = mapa_filtrado_f3 == 2;
area_f3 = sum(masc_agua_f3(:)) * (100 / 10000);
humedad_f3 = mean(double(ndmi_f3(ndvi_f3 > 153)));


% =========================================================================
% FECHA 4 : 08 Septiembre 2022
% =========================================================================
disp('Procesando: 08 Septiembre 2022...');
b03_f4 = imread('imagenes (8 bits)\08 09 2022\2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B03_(Raw).png');
b04_f4 = imread('imagenes (8 bits)\08 09 2022\2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B04_(Raw).png');
b08_f4 = imread('imagenes (8 bits)\08 09 2022\2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B08_(Raw).png');
b11_f4 = imread('imagenes (8 bits)\08 09 2022\2022-09-08-00_00_2022-09-08-23_59_Sentinel-2_L2A_B11_(Raw).png');

% Índices y Clasificación
ndwi_f4 = ndwi(b03_f4, b08_f4);
ndvi_f4 = ndvi(b04_f4, b08_f4);
ndmi_f4 = ndmi(b08_f4, b11_f4);

mapa_clases_f4 = zeros(size(ndvi_f4), 'uint8');
mapa_clases_f4(ndvi_f4 > 153) = 1;
mapa_clases_f4(ndwi_f4 > 110) = 2;

mapa_filtrado_f4 = filtro_mediana(mapa_clases_f4, 5);

% Extracción
masc_agua_f4 = mapa_filtrado_f4 == 2;
area_f4 = sum(masc_agua_f4(:)) * (100 / 10000);
humedad_f4 = mean(double(ndmi_f4(ndvi_f4 > 153)));


% =========================================================================
% FECHA 5 : 01 Mayo 2023
% =========================================================================
disp('Procesando: 01 Mayo 2023...');
b03_f5 = imread('imagenes (8 bits)\01 05 2023\2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B03_(Raw).png');
b04_f5 = imread('imagenes (8 bits)\01 05 2023\2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B04_(Raw).png');
b08_f5 = imread('imagenes (8 bits)\01 05 2023\2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B08_(Raw).png');
b11_f5 = imread('imagenes (8 bits)\01 05 2023\2023-05-01-00_00_2023-05-01-23_59_Sentinel-2_L2A_B11_(Raw).png');

% Índices y Clasificación
ndwi_f5 = ndwi(b03_f5, b08_f5);
ndvi_f5 = ndvi(b04_f5, b08_f5);
ndmi_f5 = ndmi(b08_f5, b11_f5);

mapa_clases_f5 = zeros(size(ndvi_f5), 'uint8');
mapa_clases_f5(ndvi_f5 > 153) = 1;
mapa_clases_f5(ndwi_f5 > 110) = 2;

mapa_filtrado_f5 = filtro_mediana(mapa_clases_f5, 5);

% Extracción
masc_agua_f5 = mapa_filtrado_f5 == 2;
area_f5 = sum(masc_agua_f5(:)) * (100 / 10000);
humedad_f5 = mean(double(ndmi_f5(ndvi_f5 > 153)));


% =========================================================================
% FECHA 6 : 13 Septiembre 2023
% =========================================================================
disp('Procesando: 13 Septiembre 2023...');
b03_f6 = imread('imagenes (8 bits)\13 09 2023\2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B03_(Raw).png');
b04_f6 = imread('imagenes (8 bits)\13 09 2023\2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B04_(Raw).png');
b08_f6 = imread('imagenes (8 bits)\13 09 2023\2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B08_(Raw).png');
b11_f6 = imread('imagenes (8 bits)\13 09 2023\2023-09-13-00_00_2023-09-13-23_59_Sentinel-2_L2A_B11_(Raw).png');

% Índices y Clasificación
ndwi_f6 = ndwi(b03_f6, b08_f6);
ndvi_f6 = ndvi(b04_f6, b08_f6);
ndmi_f6 = ndmi(b08_f6, b11_f6);

mapa_clases_f6 = zeros(size(ndvi_f6), 'uint8');
mapa_clases_f6(ndvi_f6 > 153) = 1;
mapa_clases_f6(ndwi_f6 > 110) = 2;

mapa_filtrado_f6 = filtro_mediana(mapa_clases_f6, 5);

% Extracción
masc_agua_f6 = mapa_filtrado_f6 == 2;
area_f6 = sum(masc_agua_f6(:)) * (100 / 10000);
humedad_f6 = mean(double(ndmi_f6(ndvi_f6 > 153)));


% =========================================================================
% GRÁFICAS FINALES COMPARATIVAS
% =========================================================================
disp('Procesamiento de fechas completado. Generando gráficas finales...');

vector_areas = [area_f1, area_f2, area_f3, area_f4, area_f5, area_f6];
vector_humedades = [humedad_f1, humedad_f2, humedad_f3, humedad_f4, humedad_f5, humedad_f6];
etiquetas_fechas = {'May 18', 'Sep 18', 'May 22', 'Sep 22', 'May 23', 'Sep 23'};

figure('Name', 'Evolución de la Sequía en Doñana');

% Gráfica 1: Área de Agua
subplot(2,1,1);
plot(1:6, vector_areas, '-bo', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerFaceColor', 'b');
set(gca, 'XTick', 1:6, 'XTickLabel', etiquetas_fechas);
title('Evolución de la Superficie de Agua (Imagen Completa)');
ylabel('Hectáreas (ha)');
grid on;

% Gráfica 2: Humedad en Vegetación (NDMI)
subplot(2,1,2);
plot(1:6, vector_humedades, '-go', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerFaceColor', 'g');
set(gca, 'XTick', 1:6, 'XTickLabel', etiquetas_fechas);
title('Evolución del Estrés Hídrico (NDMI medio)');
ylabel('NDMI (Escala 1-255)');
grid on;
