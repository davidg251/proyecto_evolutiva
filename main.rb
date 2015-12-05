require './poblacion'

$tamanio_genotipo = 8
$tamanio_poblacion = 5

def funcion_fitness(individuo)

	tasa_castigo = 1.0 / $tamanio_genotipo
	castigo = 0
	ocurrencias = 0
	
	for i in 1..$tamanio_genotipo
	    #cuenta las ocurrencias de cada numero 1..n y lo multiplica
		#por la tasa de castigo, es decir castigo ~ 0 buen indiv.
		if individuo.get_genotipo.count(i.to_s) > 1
			ocurrencias +=1
		end
	end
	
	puts "fitness individuo #{ocurrencias*tasa_castigo}"
end



#esta seria la funcion para calcular el fitness de cada ind de la poblacion.
Objpoblacion = Poblacion.new(10, 6)
poblacion = Objpoblacion.get_poblacion()

for i in 0..poblacion.count-1
	o = poblacion[i]
	puts o.get_genotipo();
	funcion_fitness(o)
end





