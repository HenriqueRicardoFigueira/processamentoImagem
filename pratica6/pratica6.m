pkg load image;                         # 1

function res = filtroPassaBaixa(imagem, P, Q)
  res = imagem;
endfunction



imgEntrada = imread('pratica6.png');    # 2
imgEntrada = im2double(imgEntrada);     # 3
# tamanho da imagem
[M, N] = size(imgEntrada);

P = 2*M;
Q = 2*N;

imgPadding = fft2(imgEntrada, P, Q);    # 4
imgPadding = fftshift(imgPadding);      # 5
imgPadding = uint8(abs(imgPadding));    # 6

filtro = filtroPassaBaixa(imgPadding, P, Q);

figure, imshow(filtro);