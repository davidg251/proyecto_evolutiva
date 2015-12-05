
class Individuo

	@fitness = 0

	def initialize(tamanio)
		@tamanio = tamanio
		@genotipo = ''
		for i in 1..@tamanio
			alelo =  1 + (rand * @tamanio).to_i
			@genotipo << alelo.to_s
		end
		
		return	@genotipo
	end	

	def get_genotipo()
		return @genotipo
	end
end
