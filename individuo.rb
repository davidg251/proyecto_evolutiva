
class Individuo

	@fitness = 0

	def initialize(n)
		
		@n = n
		@genotipo = ''
		for i in 1..@n
			alelo =  1 + (rand * @n).to_i
			@genotipo << alelo.to_s
		end
		
		return	@genotipo
	end	




	def get_genotipo()
		return @genotipo
	end	





end
