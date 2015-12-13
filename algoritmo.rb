require './poblacion'
require './operadores'

class Algoritmo

    attr_accessor :numero_individuos, :cantidad_reinas,
                  :probabilidad_cruce, :probabilidad_mutacion,
                  :tamanio_mating_pool , :poblacion

    def initialize (numero_individuos, cantidad_reinas, 
                    probabilidad_cruce, probabilidad_mutacion,
                    tamanio_mating_pool, max_iteraciones)

        @numero_individuos = numero_individuos
        @cantidad_reinas = cantidad_reinas
        @probabilidad_cruce = probabilidad_cruce
        @probabilidad_mutacion = probabilidad_mutacion
        @tamanio_mating_pool = tamanio_mating_pool
        @max_iteraciones = max_iteraciones
    end

    def generar_poblacion
        
        @poblacion = Poblacion.new(@numero_individuos, @cantidad_reinas) 
=begin        
        puts "inicial_"
        @poblacion.poblacion.each do |i|
            print i.genotipo, ", ", i.fitness
            puts ""
        end        
=end    
    end




    def ejecutar
    
    iteraciones = 0
   
  
    while  (iteraciones < @max_iteraciones)

        nuevos_individuos = []    
        mating_pool = []

        mating_pool = Operadores.seleccion(@poblacion.poblacion, @tamanio_mating_pool)


        
        if true
            
            padres = Operadores.seleccion(mating_pool , 2)
            temporal = Operadores.cruce(padres[0], padres[1])
            nuevos_individuos << temporal[0]
            nuevos_individuos << temporal[1]
        
        end
            
        if true
           
            individuo = Operadores.seleccion(mating_pool, 1)
            nuevos_individuos << Operadores.mutacion(individuo[0])
        end
=begin
        puts "matin pool"
        mating_pool.each do |i|
            print i.genotipo, ", ", i.fitness
            puts ""
        end  
=end
        @poblacion.ranking()
        
       


       w = nuevos_individuos.length

       
       if w == 1
           @poblacion.poblacion.pop()
           @poblacion.poblacion << nuevos_individuos[0]   
        elsif w==2
            @poblacion.poblacion.pop()
            @poblacion.poblacion.pop()
            @poblacion.poblacion << nuevos_individuos[0] 
            @poblacion.poblacion << nuevos_individuos[1] 

        elsif w == 3    
            @poblacion.poblacion.pop()
            @poblacion.poblacion.pop()
            @poblacion.poblacion.pop()
            @poblacion.poblacion << nuevos_individuos[0] 
            @poblacion.poblacion << nuevos_individuos[1]          
            @poblacion.poblacion << nuevos_individuos[2] 
        end
        iteraciones += 1
        if(@poblacion.poblacion[0].fitness == 0.0)
            break
        end
         puts @poblacion.poblacion[0].genotipo
=begin
         puts "nueva poblacion"
        @poblacion.poblacion.each do |i|
            print i.genotipo, ", ", i.fitness
            puts ""
        end 
=end         
    end
        
    puts "final"
    puts @poblacion.poblacion[0].genotipo
    puts @poblacion.poblacion[0].fitness
    (@poblacion.poblacion[0].fitness == 0.0)




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