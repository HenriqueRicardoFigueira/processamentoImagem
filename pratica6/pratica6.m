pkg load image;                         # 1

function bra = distanciaEuclidiana(u, v, p, q)
  bra = (((u - p/2) ^ 2) + ((v - q/2) ^ 2))*0.5;
endfunction

function res = filtroPassaBaixa(imagem, P, Q)       # 7
  D0 = 20;
  h = zeros(P, Q, 'uint8');

  for u=1:P
    for v=1:Q
      Duv = distanciaEuclidiana(u, v, P, Q);
      h(u, v) = e ^ ((-Duv ^ 2) / (2 * (D0 ^ 2)));
    end
  end
  res = h;
endfunction

imgEntrada = imread('pratica6.png');    # 2
imgEntrada = im2double(imgEntrada);     # 3
# tamanho da imagem
[M, N] = size(imgEntrada);

P = 2*M;
Q = 2*N;

imgPadding = fft2(imgEntrada, P, Q);    # 4
imgPadding = fftshift(imgPadding);      # 5
imgEspectro = uint8(abs(imgPadding));   # 6

filtro = filtroPassaBaixa(imgPadding, P, Q);
imgFiltro = imgEspectro .* filtro;      # 8

figure, imshow(imgFiltro);