pkg load image;

img = imread('imagem.jpg');
[histograma, o] = imhist(img);    # recupera o histograma

# estrutura auxiliar
aux = zeros(1, 256);

# gerar matrix de zeros para a imagem corrigida
img2 = zeros(679, 800, 'uint8');

for i=1:256       # normalizando o histograma
  histograma(i) = histograma(i)/(679*800);
endfor

for rk=1:256
  pr = 0;
  for j=1:rk
    pr = pr+histograma(j);
  endfor

  aux(rk) = uint8(round(255*pr));
endfor

#aplicando os valores na imagem de saida
for i = 1:679
  for j = 1:800
    img2(i, j) = aux(1,img(i, j)+1);
  endfor
endfor

#exibe a imagem de saida na tela 
#imshow(img2)

#plotando o histograma da imagem de saida
axis([0 250 0 4000])
plot(imhist(img2));
title("Histograma Equalizado")

#salva a imagem no disco 
imwrite(img2,'output_imgage.jpg');
#histograma(89)