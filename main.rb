require './algoritmo'

=begin
                    numero_individuos, cantidad_reinas, 
                    probabilidad_cruce, probabilidad_mutacion,
                    tamanio_mating_pool, max_iteraciones
=end

reinas = Algoritmo.new(100, 8, 0.2, 0.5, 3, 1000 )
reinas.generar_poblacion()
reinas.ejecutar()