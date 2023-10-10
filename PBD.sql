--- criando a função
CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
INT) RETURNS INT AS
$$
BEGIN
RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;

---1.1 Faça um programa que exibe se um número inteiro é múltiplo de 3.

--- Primeira Solução
DO $$
DECLARE
	valor INT := valor_aleatorio_entre(1, 100);
BEGIN
	RAISE NOTICE 'O valor gerado é: %', valor;
	IF valor % 3= 0 THEN
			RAISE NOTICE '% é múltiplo de 3',valor;
	ELSE
			RAISE NOTICE '% não é múltiplo de 3', valor;
	END IF;
END;
$$

-- Segunda Solução
DO $$
DECLARE
	valor INT := valor_aleatorio_entre(1, 100);
BEGIN
	RAISE NOTICE 'O valor gerado é: %', valor;
	
	CASE
		WHEN valor % 3 = 0 THEN
			RAISE NOTICE '% é múltiplo de 3', valor;
		ELSE
			RAISE NOTICE '% não é múltiplo de 3', valor;
	END CASE;
END;
$$
