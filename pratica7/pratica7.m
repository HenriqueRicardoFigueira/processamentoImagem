pkg load image;

function res = filtroPassaBaixa(P, Q)
  h = ones(P, Q);

  min = (Q/2)-15;
  max = (Q/2)+15;

  h(1:(Q+100), min:max) = 0;

  min1 = (Q/2)-20;
  max1 = (Q/2)+100;

  h(min1:max1, min:max) = 1;

  res = h;
endfunction

imgEntrada = imread('pratica7.png');
imgEntrada = im2double(imgEntrada);
# tamanho da imagem
[M, N] = size(imgEntrada);

P = 2*M;
Q = 2*N;

imgTransformada = fft2(imgEntrada, P, Q);
imgTransformada = fftshift(imgTransformada);
imgEspectro = uint8(abs(imgTransformada));

#figure, imshow(imgEspectro);
imwrite(imgEspectro, "espectro.png");

filtro = filtroPassaBaixa(P, Q);
imwrite(filtro, "filtro.png");
figure, imshow(filtro .* imgEspectro);
imgFiltro = imgTransformada .* filtro;
imgFiltro = ifftshift(imgFiltro);
imgFiltro = ifft2(imgFiltro);
imgFiltro = real(imgFiltro);

imgSaida = zeros(M, N);
imgSaida = imgFiltro(1:M, 1:N);

figure, imshow(im2uint8(imgSaida));
imwrite(imgSaida, "resultado.png")
figure, imshow(imgEntrada);