require './algoritmo'

=begin
                    numero_individuos, cantidad_reinas, 
                    probabilidad_cruce, probabilidad_mutacion,
                    tamanio_mating_pool
=end

reinas = Algoritmo.new(5, 8, 0.2, 0.5,3)
reinas.generar_poblacion()
reinas.ejecutar()