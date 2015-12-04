require './poblacion'


$tamanio_genotipo = 2
$tamanio_poblacion = 5

Objpoblacion = Poblacion.new(5, 2)
poblacion = Objpoblacion.get_poblacion()
#puts poblacion

for i in 0..poblacion.count-1

	o = poblacion[i]
	o.get_genotipo();

end
