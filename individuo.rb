
class Individuo


	def initialize(n)
		
		@n = n
		@genotipo = ''
		for i in 1..@n

			alelo = rand(@n)
			@genotipo << alelo.to_s

		end
		
		return	@genotipo
	end	

	def get_genotipo()

		puts @genotipo
		return @genotipo

	end	





end
