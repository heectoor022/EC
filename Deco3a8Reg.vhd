----------------------------------------------------------------------
-- Fichero: Deco3a8Reg.vhd
-- Descripción: Decodificador 3 a 8 registrado
-- Fecha última modificación: 2022-02-11
-- Asignatura: E.C. 1º grado
-- Grupo de Prácticas: 2113
-- Grupo de Teoría: 211
-- Práctica: 1
-- Ejercicio: 2
----------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity Deco3a8Reg is 
	port ( 
		D : in std_logic_vector (2 downto 0); 
		CE : in std_logic; 
		Clk : in std_logic; 
		Reset : in std_logic; 
		Q : out std_logic_vector (7 downto 0) 
	); 
end Deco3a8Reg;

architecture Practica of Deco3a8Reg is
	
	signal s1: std_logic_vector (7 downto 0);
	
	component Deco3a8 port (
		D : in  std_logic_vector (2 downto 0);
		Q : out  std_logic_vector (7 downto 0)
		);
	end component;
	
	component Reg port (
		D : in  std_logic_vector (7 downto 0);
		Reset : in  std_logic;
		Clk : in  std_logic;
		Ce : in  std_logic;
		Q : out  std_logic_vector (7 downto 0)
		);
	end component;
	
begin
	
	a1: Deco3a8 port map(
	D => D, 
	Q => s1
	); 
	
	a2: Reg port map(
	D => s1, 
	Reset => Reset,
	Clk => Clk,
	Ce => CE,
	Q => Q
	);
end Practica;