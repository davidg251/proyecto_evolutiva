require './individuo'

class Poblacion

	def initialize(numero_individuos, tamanio_genotipo )
		
		@poblacion = []
		@n_i = numero_individuos
		@t = tamanio_genotipo

		for i in 1..@n_i
			temp = Individuo.new(@t)
			@poblacion << temp
			
		end
	end




	def get_poblacion()
		return @poblacion
	end


end