require './algoritmo'

=begin
                    numero_individuos, cantidad_reinas, 
                    probabilidad_cruce, probabilidad_mutacion,
                    tamanio_mating_pool, max_iteraciones
=end

reinas = Algoritmo.new(10000, 11, 0.2, 0.5, 7000, 1)
reinas.generar_poblacion()
reinas.ejecutar()