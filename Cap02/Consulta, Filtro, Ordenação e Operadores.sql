# Em abril de 2018 alguma embarcação teve índice de conformidade de 100% e pontuação de risco igual a 0?
SELECT nome_navio, temporada, classificacao_risco, indice_conformidade
FROM cap02.tb_navios
WHERE classificacao_risco IN ('A','B') AND indice_conformidade > 90
ORDER BY indice_conformidade
LIMIT 10;

# 1- Quais embarcações possuem pontuação de risco igual a 310?
SELECT *
FROM cap02.TB_NAVIOS 
WHERE pontuacao_risco = 310 
ORDER BY nome_navio;

# 2- Quais embarcações têm classificação de risco A e índice de conformidade maior ou igual a 95%?
SELECT *
FROM cap02.TB_NAVIOS
WHERE classificacao_risco = 'A'
AND indice_conformidade >= 95;

# 3- Quais embarcações têm classificação de risco C ou D e índice de conformidade menor ou igual a 95%?
SELECT *
FROM cap02.TB_NAVIOS
WHERE classificacao_risco IN ('C', 'D') 
AND indice_conformidade <= 95;

#4- Quais embarcações têm classificação de risco A ou pontuação de risco igual a 0?
SELECT *
FROM cap02.TB_NAVIOS
WHERE classificacao_risco = 'A' 
OR pontuacao_risco = 0;

# 5- [DESAFIO] Quais embarcações foram inspecionadas em Dezembro de 2016?
SELECT*	
FROM cap02.TB_NAVIOS
WHERE temporada LIKE '%Dezembro 2016'