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

# (4) Use a função filter2(b,x, shape) como forma para aplicar o ?ltro de média do passo 3 
#     na imagem no formato double obtida no passo 2. Essa função irá fazer a correlação do
#     ?ltro sobre a imagem. Nesse passo use o valor padrão para o parâmetro shape. 

imagemSaida = im2double(filter2(filtro, imagemEntrada, 'same'));

 # (5) Exiba a imagem resultante do passo 4 e observe a borda da imagem. O que aconteceu?
 # (R) 
imshow(imagemSaida);