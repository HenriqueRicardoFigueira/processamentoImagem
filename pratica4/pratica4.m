pkg load image

# (1,2) carrengando a imagem e convertendo para double
imagemEntrada = im2double(imread('pratica4.jpg'));

# (3) monte um filtro de média com tamanho 9x9
filtro = zeros(9, 9, 'double');

for i=1:9
   for j=1:9
     filtro(i, j) = 1/81;
   endfor
endfor

# (4) Use a função filter2(b,x, shape) como forma para aplicar o filtro de média do passo 3
#     na imagem no formato double obtida no passo 2. Essa função irá fazer a correlação do
#     filtro sobre a imagem. Nesse passo use o valor padrão para o parâmetro shape. 
imagemSaida = im2double(filter2(filtro, imagemEntrada, 'same'));

# (5) Exiba a imagem resultante do passo 4 e observe a borda da imagem. O que aconteceu?
# (R) Aplicamos o meio do filtro em cada pixel da borda. Depois é multiplicado o filtro por 0,
#     e a borda fica preta.
imshow(imagemSaida);

# (6) Vamos aplicar o filtro da média novamente só que agora vamos replicar os pixels
#     da borda da imagem do passo 2 antes com a função padarray(...).
#     Forneça os parâmetros para essa função apropriadamente considerando o tamanho
#     do filtro de média.

imagemSaida = padarray(imagemEntrada, [4 4], 'replicate');

# (7) Aplique novamente o mesmo filtro da média, só que agora sobre a imagem com
#  padding do passo 6, e exiba a imagem resultante
imagemSaida = filter2(filtro, imagemEntrada, 'valid');
#figure, imshow(imagemSaida);

# (8) Monte os filtros de Sobel (disponíveis nos slides).