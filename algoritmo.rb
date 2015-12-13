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
    max_iteraciones = 1
    iteraciones = 0
    mating_pool = Poblacion.new(0,0)
    nuevos_individuos = []

    while  (iteraciones < max_iteraciones) || (@poblacion.poblacion[0].fitness == 0.0)

        
        mating_pool.poblacion = @poblacion.seleccion(@tamanio_mating_pool)
        mating_pool.numero_individuos = @tamanio_mating_pool

        
        #if rand >= @probabilidad_cruce
        if true    
            padres = mating_pool.seleccion(2)
            nuevos_individuos << Operadores.cruce(padres[0], padres[1])
        end
            
        #if rand >= @probabilidad_mutacion
        if true    
            individuo = mating_pool.seleccion(1)
            nuevos_individuos << Operadores.mutacion(individuo[0])
        end

        
        @poblacion.ranking()

        nuevos_individuos.each do |i|
            
            @poblacion.poblacion.pop()
            @poblacion.poblacion << i
        end    

        
       
        iteraciones += 1
    end

    puts "final"
    puts @poblacion.poblacion[0].genotipo
    puts @poblacion.poblacion[0].fitness





=begin
        puts 'matin pool'
        mating_pool.poblacion.each do |i|
            puts i.genotipo
        end    

        # de aqui para abajo test o debug 
        sele = @poblacion.seleccion(5)
        puts sele
        puts 'seleccion: '
        sele.each do |i|
            puts i.genotipo
        end
       @poblacion.ranking     
       pobla = @poblacion.poblacion
       puts 'poblacion ranking: '
       pobla.each do |i|
           print i.genotipo,",", i.fitness
           puts ""
       end
=end

    end    

end