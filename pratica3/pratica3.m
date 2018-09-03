pkg load image;

img = imread('imagem.jpg');
[histograma, o] = imhist(img);    # recupera o histograma

# estrutura auxiliar
aux = zeros(1, 255);

# gerar matrix de zeros para a imagem corrigida
img2 = zeros(679, 800, 'uint8');

for i=1:255       # normalizando o histograma
  histograma(i) = histograma(i)/(679*800);
endfor

for rk=1:255
  pr = 0;
  for j=1:rk
    pr = pr+histograma(j);
  endfor

  aux(i) = round(255*pr);
endfor

#aplicando os valores na imagem de saida
for i = 1:679
  for j = 1:800
    img2(i, j) = aux(1,img(i, j)+1);
  endfor
endfor

#imshow(img2);
plot(img2);
#histograma(89)