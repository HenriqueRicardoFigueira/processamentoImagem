pkg load image;

imgEntradaOriginal = imread('Imagem.jpg');

imgConvertida = im2double(rgb2hsv(imgEntradaOriginal));
imgEntrada = imgConvertida(:,:,3);

# tamanho da imagem
[M, N] = size(imgEntrada);

P = 2*M;
Q = 2*N;

imgTransformada = fft2(imgEntrada, P, Q);
imgTransformada = fftshift(imgTransformada);
imgEspectro = uint8(abs(imgTransformada));

#figure, imshow(imgEspectro);
#imwrite(imgEspectro, 'espectro.jpg');

filtro = im2double(imread('filtro.jpg'));

#figure, imshow(filtro);
imgFiltro = imgTransformada .* filtro;
imgFiltro = ifftshift(imgFiltro);
imgFiltro = ifft2(imgFiltro);
imgFiltro = real(imgFiltro);

imgSaida = zeros(M, N);
imgSaida = imgFiltro(1:M, 1:N);

imgConvertida(:,:,3) = imgSaida;
imgConvertida = hsv2rgb(imgConvertida);
imshow(imgConvertida);
imwrite(imgConvertida, "imgsaida.jpg");

#imshow(imgEntradaOriginal);
#figure, imshow(imgSaida);