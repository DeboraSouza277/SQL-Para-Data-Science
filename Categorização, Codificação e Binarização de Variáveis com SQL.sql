SELECT * FROM cap03.tb_dados;

#1- Aplique label encoding à variável menopausa
select distinct menopausa from cap03.tb_dados;

SELECT CASE 
	when menopausa = 'premeno' then 0
    when menopausa = 'ge40' then 1
	when menopausa = 'lt40' then 2
    end as meopausa
 FROM cap03.tb_dados;
 
 

 #2- [Desafio] Crie uma nova coluna chamada posicao_tumor concatenando as colunas inv_nodes e quadrante.
SELECT
	CONCAT(inv_nodes," ", quadrante) as posicao_tumor
FROM cap03.tb_dados;





#3- [Desafio] Aplique One-Hot-Encoding à coluna deg_malig
select distinct deg_malig from cap03.tb_dados;
SELECT 
 CASE when deg_malig = 1 then 1 ELSE 0 end as deg_malig_1,
 CASE when deg_malig = 2 then 1 ELSE 0 end as deg_malig_2,
 CASE when deg_malig = 3 then 1 ELSE 0 end as deg_malig_3
 FROM cap03.tb_dados;
 
 
 #4- Crie um novo dataset com todas as variáveis após as transformações anteriores
CREATE TABLE cap03.tb_dados3
AS
SELECT
classe,
idade,
 CASE 
	when menopausa = 'premeno' then 0
    when menopausa = 'ge40' then 1
	when menopausa = 'lt40' then 2
    end as menopausa,
tamanho_tumor,
node_caps,	
CONCAT(inv_nodes," ", quadrante)as posicao_tumor,
CASE when deg_malig = 1 then 1 ELSE 0 end as deg_malig_1,
CASE when deg_malig = 2 then 1 ELSE 0 end as deg_malig_2,
CASE when deg_malig = 3 then 1 ELSE 0 end as deg_malig_3,
seio,
irradiando
FROM cap03.tb_dados;