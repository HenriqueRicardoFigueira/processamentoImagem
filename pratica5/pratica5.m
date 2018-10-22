pkg load image
#funcao que aplica o filtro num vezes a uma imagem e aplica a media aritmetica para correcao de ruidos
function retorno = ruido (num)
  image = imread("pratica5.png");
  result = zeros(256,384);
  for i = 1:num
    nova = zeros(256,384);
    nova = imnoise(image, "gaussian", 0 , 0.25);
    nova = nova*(1/num);
    result += nova;
  endfor
  retorno = result;
endfunction

#main
image8 = ruido(8);
image16 = ruido(16);
image64 = ruido(64);
#A diferença entre as imagens e quantidade de amostras que entram na media aritmetica, 
#pois quanto maior o numero de amostras, mais chance de eu ter uma imagem com menos ruido.

figure, imshow(image8);
figure, imshow(image16);
figure, imshow(image64);

imwrite(image8, "image8.png")
imwrite(image16, "image16.png")
imwrite(image64, "image64.png")

