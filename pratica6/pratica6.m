pkg load image;                         # 1

function bra = distanciaEuclidiana(u, v, p, q)
  bra = (((u - p/2) ^ 2) + ((v - q/2) ^ 2)) ^ (1/2);
endfunction

function res = filtroPassaBaixa(imagem, P, Q)       # 7
  D0 = 20;
  h = zeros(P, Q);

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

imgTransformada = fft2(imgEntrada, P, Q);     # 4
imgTransformada = fftshift(imgTransformada);  # 5
figure, imshow(uint8(abs(imgTransformada)));  # 6

filtro = filtroPassaBaixa(imgTransformada, P, Q);
imgFiltro = imgTransformada .* filtro;        # 8
figure, imshow(real(imgFiltro));
imgTransformada = ifftshift(imgTransformada); # 9
imgTransformada = ifft2(imgTransformada);     # 10
imgTransformada = real(imgTransformada);      # 11

# 12
imgSaida = zeros(M, N);
for x=1:M
  for y=1:N
    imgSaida(x, y) = imgTransformada(x, y);
  end
end

figure, imshow(im2uint8(imgSaida));