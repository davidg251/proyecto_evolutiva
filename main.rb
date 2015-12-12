require './algoritmo'

=begin
                    numero_individuos, cantidad_reinas, 
                    probabilidad_cruce, probabilidad_mutacion,
                    tamanio_mating_pool
=end

reinas = Algoritmo.new(20, 9, 0.2, 0.5, 5)

reinas.generar_poblacion()
reinas.ejecutar()