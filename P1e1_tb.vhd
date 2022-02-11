----------------------------------------------------------------------
-- File: P1e1_tb.vhd
-- Author: Hector Labrador Gómez
-- Course: EC
-- Practice: 1
-- Ejercise: 1
-- Description: VHDL Tutorial
----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity P1e1_tb is
end P1e1_tb;
architecture Practica of P1e1_tb is

	-- Declaracion de los componentes que van a ser instancionados en este circuito
	component P1e1 
		port (
			A : in std_logic;
			B : in std_logic;
			C : in std_logic;
			Q : out std_logic
		);
	end component;
	
	-- declaracion de claves auxiliares
	signal sigA : std_logic := '0';
	signal sigB : std_logic := '0';
	signal sigC : std_logic := '0';
	signal sigQ : std_logic := '0';
	
	--Declaracion de constancias
	constant ESPERA : time := 10 ns;
	
	
begin

	-- INSTANCIAR EL CIRUITO A SER PROBADO (el P1e1)
	uut: P1e1 port map (
		A => sigA,
		B => sigB,
		C => sigC,
		Q => sigQ
	);
	
	-- PRUEBAS DEL TESTBENCE
	process
	begin
	
		-- CASO DE USO 1
		sigA <= '0'; 
		sigB <= '0'; 
		sigC <= '0';
		wait for ESPERA;
		
		assert sigQ = '0'
			report "Error en el caso 000"
			severity failure;
		
		-- CASO DE USO 2
		sigA <= '0'; 
		sigB <= '0'; 
		sigC <= '1';
		wait for ESPERA;
		
		assert sigQ = '0'
			report "Error en el caso 000"
			severity failure;
	
		-- CASO DE USO 3
		sigA <= '0'; 
		sigB <= '1'; 
		sigC <= '0';
		wait for ESPERA;
		
		assert sigQ = '0'
			report "Error en el caso 000"
			severity failure;
			
		-- CASO DE USO 4
		sigA <= '0'; 
		sigB <= '1'; 
		sigC <= '1';
		wait for ESPERA;
		
		assert sigQ = '1'
			report "Error en el caso 000"
			severity failure;
			
		-- CASO DE USO 5
		sigA <= '1'; 
		sigB <= '0'; 
		sigC <= '0';
		wait for ESPERA;
		
		assert sigQ = '0'
			report "Error en el caso 000"
			severity failure;
		
		-- CASO DE USO 6
		sigA <= '1'; 
		sigB <= '0'; 
		sigC <= '1';
		wait for ESPERA;
		
		assert sigQ = '1'
			report "Error en el caso 000"
			severity failure;
		
		-- CASO DE USO 7
		sigA <= '1'; 
		sigB <= '1'; 
		sigC <= '0';
		wait for ESPERA;
		
		assert sigQ = '0'
			report "Error en el caso 000"
			severity failure;
			
		-- CASO DE USO 8
		sigA <= '1'; 
		sigB <= '1'; 
		sigC <= '1';
		wait for ESPERA;
		
		assert sigQ = '1'
			report "Error en el caso 000"
			severity failure;
			
			
		report "Si aparece este mensaje, la simulacion es correcta.";
		wait;
			
		
	end process;
	
end Practica;