# Daniel Venturini
# Henrique Ricardo

pkg load image;

#carregar imagem a ser melhorada
img1 = imread('pollen.jpg');

#gerar matrix de zeros para a imagem corrigida
img2 = zeros(889, 889, 'uint8');

#imhist(img1);

#ponto inicialprimeira reta
i1 = 0;
i2 = 0;

#segundo ponto
r1 = 90;
s1 = 30;

#terceiro ponto
r2 = 150;
s2 = 220;


# os valores escolhidos foram baseados nos mostrados pela fun��o imhist(img).
# vendo que os valores de preto se aproximavam de 90, quanto mais baixo a fun��o gerasse o ponto r1,s1 em y, mais o preto seria real�ado.
# j� para o branco a l�gica � mesma. Para tornar os pontos brancos mais brancos, quanto mais alto o ponto r2,s1 fosse em y melhor seria.

#ponto final
f1 = 256;
f2 = 256;

#vetor para carregar os valores de entrada e saida x = indice y = valor
v = zeros(1, 256);

#coeficiente da reta 1.
#reta definida pelo ponto inicial ao primeiro ponto
m = (s1-i2)/(r1-i1);
#colocando os valores de saida no vetor de resultados da primeira reta
for i = i1+1:r1
  v(i) = i2 + m * (i - i1);
endfor

#coeficiente da reta 2 
#reta definida pelo segundo ponto ao terceiro ponto
m = (s2-s1)/(r2-r1);
#colocando os valores de saida no vetor de resultados da segunda reta
for i = r1+1:r2
  v(i) = s1 + m * (i - r1);
endfor

#coeficiente da reta 3
#reta definida pelo terceiro ponto ao ponto final
m = (f2-s2)/(f1-r2);
#colocando os valores de saida no vetor de resultados da terceira reta
for i = r2+1:f1
  v(i) = s2 + m * (i - r2);
endfor

#criando vetor de 1 a 256 para gerar grafico
vetor = [1:256];
#gerando grafico de correcao
plot (vetor, v);

#aplicando os valores de saida na imagem orignal
for i = 1:889
  for j = 1:889
    img2(i, j) = v(img1(i, j));
  endfor
endfor

imshow(img2);
#imhist(img2);
imwrite(img2, 'fotocorrigido.jpg');