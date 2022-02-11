 ----------------------------------------------------------------------
-- Fichero: Reg.vhd
-- Descripción: Registro de 8 bits con Chip Enable
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


--Definición de la entidad
--El registro tiene una entrada de datos (D), entrada de Reset, CLK y CE
--Como salida tiene un sólo bit (Q)

entity Reg is
    port ( 
		D : in  std_logic_vector (7 downto 0);
		Reset : in  std_logic;
		Clk : in  std_logic;
		Ce : in  std_logic;
		Q : out  std_logic_vector (7 downto 0)
	);
end Reg;

architecture Practica of Reg is
	
begin

	--El registro es sensible al Reset (asíncrono) y a la señal del reloj
	process (all)
	begin
		-- Si el reset está activo la salida vale 0
		if Reset = '1' then
			Q <=  (others => '0');
		-- Si hay un flanco de subida del reloj
		elsif Clk = '1' and Clk'event then
			-- Si el chip enable está activo
			if Ce = '1' then
				Q <= D;
			end if;
		end if;
	end process;

end Practica;

