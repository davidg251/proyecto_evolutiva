require './individuo'
require './operadores'

class Poblacion

	attr_accessor :poblacion, :numero_individuos


	def initialize(numero_individuos, tamanio_genotipo )
		
		@poblacion = []
		@numero_individuos = numero_individuos
		@t = tamanio_genotipo

		for i in 1..@numero_individuos
			temp = Individuo.new(@t)
			Operadores.funcion_fitness(temp)
			@poblacion << temp
			
		end
	end


	def ranking

		@poblacion = @poblacion.sort_by(&:fitness)

	end	


	def seleccion n

		individuos_seleccionados = []
		i = 0;
		
		while i < n do
   			
   			posicion = rand( 0..@numero_individuos - 1 )

   			if @poblacion[posicion].usado
				posicion = rand( 0..@numero_individuos - 1 )
			end
			@poblacion[posicion].usado = true
   			individuos_seleccionados << @poblacion[posicion]
			i +=1
		
		end

		return individuos_seleccionados
	
	end	

end