
class
	APPLICATION
inherit
	ARGUMENTS
create
	make

feature
	estados : ARRAY[STRING]
	alfabeto : ARRAY[STRING]
	transiciones : ARRAY[ARRAY[STRING]]
	finales : ARRAY[STRING]
	inicial : STRING

	palabra : STRING
	estactual : STRING
	eleactual : CHARACTER

	make
		do

			estados:= <<"0","1","2","3">>
			alfabeto := <<"A","B">>
			inicial := "0"
			finales := <<"3">>

			transiciones := << <<"0","A","1">>,<<"1","A","0">>,<<"1","B","3">>,<<"3","B","1">>,<<"0","B","2">>,<<"2","B","0">>,<<"2","A","3">>,<<"3","A","2">> >>

			estactual := inicial
			print("Ingrese la cadena de texto (en mayusculas): ")

			io.read_line

			palabra := io.last_string



			across palabra as c
			loop
				eleactual := c.item
				estactual := checar(eleactual)
			end

			if esFinal(estactual) then
				print("Palabra aceptada.")
			else
				print("No pertenece al lenguaje.")
			end


		end

	checar(letra:CHARACTER):STRING
	local
	ban : BOOLEAN
	estado :STRING
	do
		estado :=""
		ban := true
		across transiciones as tr
		loop
			if tr.item.item (1).is_equal (estactual)  and ban and tr.item.item (2).is_equal (letra.out)
			then
				ban := false
				estado := tr.item.item (3)
			end
		end
		Result := estado
	end

	esFinal(estado : STRING):BOOLEAN
	local
		band: BOOLEAN
	do
		band :=false
		across finales as  c
		loop
			if estado.is_equal (c.item) then
				band := true
			end
		end
		Result := band
	end




end
