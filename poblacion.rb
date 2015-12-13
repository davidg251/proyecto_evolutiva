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



end
