pkg load image;                         # 1

function res = filtroPassaBaixa(imagem, P, Q)
  for x=1:P
    for y=1:Q
      imagem = imagem
    end
  end

  res = imagem
endfunction



imgEntrada = imread('pratica6.png');    # 2
imgEntrada = im2double(imgEntrada);     # 3
# tamanho da imagem
M = 256;
N = 256;

P = 2*M;
Q = 2*N;

imgPadding = fft2(imgEntrada, P, Q);    # 4
imgPadding = fftshift(imgPadding);      # 5
imgPadding = uint8(abs(imgPadding));    # 6

filtro = filtroPassaBaixa(imgPadding, P, Q);

figure, imshow(filtro);