require './poblacion'

class Algoritmo

    attr_accessor :numero_individuos, :cantidad_reinas,
                  :probabilidad_cruce, :probabilidad_mutacion,
                  :tamanio_mating_pool , :poblacion

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
        
        @poblacion = Poblacion.new(@numero_individuos, @cantidad_reinas) 
        
        # de aqui para abajo test o debug 
        pobla = @poblacion.poblacion
        puts 'poblacion inicial: '
        pobla.each do |i|
            puts i.genotipo
        end

       
    end



    def ejecutar
=begin
        este deberia ser el metodo que ejecute el algoritmo
        por ahora solo hay ejemplos de como se pueden seleccionar
        individuos de la poblacion.
        delegue la responsabilidad de seleccion a la clase poblacion
        mediante un metodo generico que recibe como parametro la cantidad
        de individuos a seleccionar.
        para no seleccionar el mismo individuo coloque una bandera (true/false)
        al objeto individuo , tiene algunos fallos , (revisar poblacion.rb)

=end
        sele = @poblacion.seleccion(5)
        puts sele


        # de aqui para abajo test o debug 
        puts 'seleccion: '
        sele.each do |i|
            puts i.genotipo
        end

    end    

end