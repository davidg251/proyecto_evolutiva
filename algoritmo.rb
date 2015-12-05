

class Algoritmo

    attr_accessor :numero_individuos, :cantidad_reinas,
                  :probabilidad_cruce, :probabilidad_mutacion,
                  :tamanio_mating_pool

    def initialize (numero_individuos, cantidad_reinas, 
                    probabilidad_cruce, probabilidad_mutacion,
                    tamanio_mating_pool)

        @numero_individuos = numero_individuos
        @cantidad_reinas = cantidad_reinas
        @probabilidad_cruce = probabilidad_cruce
        @probabilidad_mutacion = probabilidad_mutacion
        @tamanio_mating_pool = tamanio_mating_pool
    end

    def generar_poblacion
        
    end

end