
class Individuo

	attr_accessor :fitness, :genotipo, :usado, :tamanio

	def initialize(tamanio)
		@usado = false
		@fitness = 0
		@tamanio = tamanio
		@genotipo = (1..@tamanio).to_a.shuffle
	end	

end
