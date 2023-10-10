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

---1.2 Faça um programa que exibe se um número inteiro é múltiplo de 3 ou de 5.
--Primeira Solução
DO $$
DECLARE
	valor INT := valor_aleatorio_entre(1, 100);
BEGIN
	RAISE NOTICE 'O valor gerado é: %', valor;
	IF valor % 3= 0 THEN
			RAISE NOTICE '% é múltiplo de 3',valor;
	ELSIF valor % 5 = 0 THEN
			RAISE NOTICE '% é múltiplo de 5', valor;
	ELSE
			RAISE NOTICE '% não é múltiplo nem 3 ou 5', valor;
	END IF;
END;
$$

--Segunda Solução
DO $$
DECLARE
	valor INT := valor_aleatorio_entre(1, 100);
BEGIN
	RAISE NOTICE 'O valor gerado é: %', valor;
	CASE
		WHEN valor % 3 = 0 THEN
			RAISE NOTICE '% é múltiplo de 3', valor;
		WHEN valor % 5 = 0 THEN
			RAISE NOTICE '% é múltiplo de 5', valor;
		ELSE
			RAISE NOTICE '% não é múltiplo nem de 3 ou 5', valor;
	END CASE;
END;
$$

--1.3  Faça um programa que opera de acordo com o seguinte menu.
--Primeira Solução
DO $$
DECLARE
   opcao INT:= valor_aleatorio_entre(1, 100);
   num1 INT:= valor_aleatorio_entre(1, 100);
   num2 INT:= valor_aleatorio_entre(1, 100);
   resultado INT:= valor_aleatorio_entre(1, 100);
BEGIN
   RAISE NOTICE 'Opções:';
   RAISE NOTICE '1 - Soma';
   RAISE NOTICE '2 - Subtração';
   RAISE NOTICE '3 - Multiplicação';
   RAISE NOTICE '4 - Divisão';

   IF opcao = 1 THEN
      resultado := num1 + num2;
      RAISE NOTICE '% + % = %', num1, num2, resultado;
   ELSIF opcao = 2 THEN
      resultado := num1 - num2;
      RAISE NOTICE '% - % = %', num1, num2, resultado;
   ELSIF opcao = 3 THEN
      resultado := num1 * num2;
      RAISE NOTICE '% * % = %', num1, num2, resultado;
   ELSIF opcao = 4 THEN
      IF num2 = 0 THEN
         RAISE NOTICE 'Não é possível dividir por zero.';
      ELSE
         resultado := num1 / num2;
         RAISE NOTICE '% / % = %', num1, num2, resultado;
      END IF;
   ELSE
      RAISE NOTICE 'Opção inválida.';
   END IF;
END;
$$

--Segunda Solução
DO $$
DECLARE
   opcao INT:= valor_aleatorio_entre(1, 100);
   num1 INT:= valor_aleatorio_entre(1, 100);
   num2 INT:= valor_aleatorio_entre(1, 100);
   resultado INT:= valor_aleatorio_entre(1, 100);
BEGIN
   RAISE NOTICE 'Opções:';
   RAISE NOTICE '1 - Soma';
   RAISE NOTICE '2 - Subtração';
   RAISE NOTICE '3 - Multiplicação';
   RAISE NOTICE '4 - Divisão';

   CASE opcao
      WHEN 1 THEN
         resultado := num1 + num2;
         RAISE NOTICE '% + % = %', num1, num2, resultado;
      WHEN 2 THEN
         resultado := num1 - num2;
         RAISE NOTICE '% - % = %', num1, num2, resultado;
      WHEN 3 THEN
         resultado := num1 * num2;
         RAISE NOTICE '% * % = %', num1, num2, resultado;
      WHEN 4 THEN
         IF num2 = 0 THEN
            RAISE NOTICE 'Não é possível dividir por zero.';
         ELSE
            resultado := num1 / num2;
            RAISE NOTICE '% / % = %', num1, num2, resultado;
         END IF;
      ELSE
         RAISE NOTICE 'Opção inválida.';
   END CASE;
END;
$$

--1.4
-- Primeira Solução
DO $$
DECLARE
   valor_compra NUMERIC := valor_aleatorio_entre(1, 100);
   valor_venda NUMERIC := valor_aleatorio_entre(1, 100);
BEGIN   
   IF valor_compra < 20 THEN
      valor_venda := valor_compra * 1.45; 
   ELSE
      valor_venda := valor_compra * 1.30;  
   END IF;
   
   RAISE NOTICE 'Valor de compra: R$%', valor_compra;
   RAISE NOTICE 'Valor de venda: R$%', valor_venda;
END;
$$

--Segunda Solução
DO $$
DECLARE
   valor_compra NUMERIC := valor_aleatorio_entre(1, 100);
   valor_venda NUMERIC := valor_aleatorio_entre(1, 100);
BEGIN 
     CASE 
      WHEN valor_compra < 20 THEN 
         valor_venda := valor_compra * 1.45;
      ELSE
         valor_venda := valor_compra * 1.30;
   END CASE;
   RAISE NOTICE 'Valor de compra: R$%', valor_compra;
   RAISE NOTICE 'Valor de venda: R$%', valor_venda;
END;
$$