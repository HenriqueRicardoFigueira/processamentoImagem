#ATIVIDADE PRATICA 1 13/08

#henrique ricardo figueira

#carrega pacote imagem
pkg load image;
#carrega imagem
imagemzuada = imread('tungsten_filament_shaded.tif');
#carrega filtro
imagemsombra = imread('tungsten_sensor_shading.tif');
#converte imagem para duble
imagemzuada = im2double(imagemzuada);
#converte filtro para duble
imagemsombra = im2double(imagemsombra);
#cria matrix com 0
imagemresult = zeros(892,754);
#aplica correçao
imagemresult = imagemzuada ./ imagemsombra;
#imagem a ser corrigida
figure, imshow(imagemzuada);
#imprime filtro
figure, imshow(imagemsombra);
#imprime imagem com correçao de sombra
figure, imshow(imagemresult);

