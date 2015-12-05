
class Individuo

	attr_accessor :fitness

	def initialize(tamanio)
		@fitness = 0
		@tamanio = tamanio
		@genotipo = ''
		for i in 1..@tamanio
			alelo =  1 + (rand * @tamanio).to_i
			@genotipo << alelo.to_s
		end
		
		return	@genotipo
	end	
end
