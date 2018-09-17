pkg load image

# (1,2) carrengando a imagem e convertendo para double
imagemEntrada = im2double(imread('pratica4.jpg'));

# (3) monte um filtro de m�dia com tamanho 9x9
filtro = zeros(9, 9, 'double');

for i=1:9
   for j=1:9
     filtro(i, j) = 1/81;
   endfor
endfor

# (4) Use a fun��o filter2(b,x, shape) como forma para aplicar o filtro de m�dia do passo 3
#     na imagem no formato double obtida no passo 2. Essa fun��o ir� fazer a correla��o do
#     filtro sobre a imagem. Nesse passo use o valor padr�o para o par�metro shape. 
imagemSaida = im2double(filter2(filtro, imagemEntrada, 'same'));

# (5) Exiba a imagem resultante do passo 4 e observe a borda da imagem. O que aconteceu?
# (R) Aplicamos o meio do filtro em cada pixel da borda. Depois � multiplicado o filtro por 0,
#     e a borda fica preta.
imshow(imagemSaida);

# (6) Vamos aplicar o filtro da m�dia novamente s� que agora vamos replicar os pixels
#     da borda da imagem do passo 2 antes com a fun��o padarray(...).
#     Forne�a os par�metros para essa fun��o apropriadamente considerando o tamanho
#     do filtro de m�dia.

imagemSaida = padarray(imagemEntrada, [4 4], 'replicate');

# (7) Aplique novamente o mesmo filtro da m�dia, s� que agora sobre a imagem com
#  padding do passo 6, e exiba a imagem resultante
imagemSaida = filter2(filtro, imagemEntrada, 'valid');
#figure, imshow(imagemSaida);

# (8) Monte os filtros de Sobel (dispon�veis nos slides).
filtroSobel1 = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
filtroSobel2 = [-1, 0, 1; -2, 0, 2; -1, 0, 1];

# (9) Aplicamos o padding e depois o filtro Sobel
imagemSobelResultado = padarray(imagemSobelResultado, [1 1], 'replicate');
imagemSobel1 = filter2(filtroSobel1, imagemEntrada, 'valid');
imagemSobel2 = filter2(filtroSobel2, imagemEntrada, 'valid');

imagemSobelResultado = zeros(306, 306, 'double');

# (10) Magnitude do gradiente
imagemSobelResultado = abs(imagemSobel1) + abs(imagemSobel2);

figure, imshow(imagemSobelResultado);
