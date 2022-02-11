----------------------------------------------------------------------
-- Fichero: Contador_Tb.vhd
-- Descripción: Testbench para un contador
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

entity Contador_tb is
end Contador_tb;

architecture Simulacion of Contador_tb is

	-- Declaración del componente Deco3a8Reg

	component Contador
	port(
		Clk : in  STD_LOGIC;
		Reset : in  STD_LOGIC;
		Ce : in  STD_LOGIC;
		Up : in  STD_LOGIC;
		Q : out  UNSIGNED (7 downto 0)
	);
	end component;


	-- Entradas del componente a comprobar
	signal ce : std_logic := '0';
	signal clk : std_logic := '0';
	signal reset : std_logic := '0';
	signal up : std_logic := '0';

	-- Salidas del componente a comprobar
	signal q : std_logic_vector(7 downto 0);

	-- Constantes del testbench
	constant CLKPERIOD : time := 10 ns;
	constant ESPERA : time := 1 ns;
	constant NINPUT: integer := 3;

	
begin

	-- Instanciación del componente Contador
	uut: Contador port map (
		Ce => ce,
		Clk => clk,
		Reset => reset,
		Up => up,
		Q => q
	);

	-- Proceso que genera el reloj
	CLKPROCESS :process
	begin
		clk <= '0';
		wait for CLKPERIOD/2;
		clk <= '1';
		wait for CLKPERIOD/2;
	end process;

	-- Proceso de estímulos
	stim_proc: process -- No hay lista de sensibilidad porque hay wait
	begin
		Reset <= '1'; -- Activar siempre el reset al comienzo
		wait for CLKPERIOD;
		Reset <= '0'; -- Se desactiva para que pueda avanzar
		if(ce = '1') then
			if Up = '1' then
				for i in 0 to 255 loop
					assert to_integer(Cuenta) = i
					report "Falla en " & to_string(i)
					severity error; 
					wait for CLKPERIOD; -- El reloj se genera en paralelo con
				end loop; -- Cierra el bucle for
				wait; -- “cuelga” este proceso
			else
				for i in 0 to 255 loop
					assert to_integer(Cuenta) = i
					report "Falla en " & to_string(i)
					severity error; 
					wait for CLKPERIOD; -- El reloj se genera en paralelo con
				end loop; -- Cierra el bucle for
				wait; -- “cuelga” este proceso
			
		end if;
	end process;

end Simulacion;

