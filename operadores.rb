require './individuo'

class Operadores

    def self.mutacion individuo
        genotipo_individuo = individuo.genotipo

        tamanio_genotipo = genotipo_individuo.length
        
        posicion_reemplazo_a = rand( 0..tamanio_genotipo - 1 )
        posicion_reemplazo_b = rand( 0..tamanio_genotipo - 1 )

        alelo_temporal = genotipo_individuo[posicion_reemplazo_a]
        genotipo_individuo[posicion_reemplazo_a] = genotipo_individuo[posicion_reemplazo_b]
        genotipo_individuo[posicion_reemplazo_b] = alelo_temporal

        individuo.genotipo = genotipo_individuo
        individuo.usado = false
        return individuo
    end

    def self.cruce (padre, madre)
        genotipo_padre = padre.genotipo
        genotipo_madre = madre.genotipo

        inicio = genotipo_padre[0]
        ultimo = genotipo_madre[0]
        ciclo = Array.new()
        ciclo.push(inicio)
        ciclo.push(ultimo)

        while inicio != ultimo
            indice = genotipo_padre.index(ultimo)
            ultimo = genotipo_madre[indice]
            ciclo.push(ultimo)
        end
               
        ciclo = ciclo[0...-1] # Se elimina el ultimo elemento del array

        (0..genotipo_padre.length-1).each do |i|
            if !ciclo.include?(genotipo_padre[i])
                temp = genotipo_padre[i]
                genotipo_padre[i] = genotipo_madre[i]
                genotipo_madre[i] = temp
            end
        end

        padre.genotipo = genotipo_padre
        madre.genotipo = genotipo_madre
        padre.usado = false
        madre.usado = false

        return padre, madre
    end

    def self.funcion_fitness individuo
        n =  individuo.tamanio
        tasa_castigo = 1.0 / n
        for i in 1..n
            for j in 1..n

                if i == j 
                    
                    break
                
                elsif (i - j).abs == ( individuo.genotipo[i-1].to_i - individuo.genotipo[j-1].to_i ).abs
                    individuo.fitness = individuo.fitness + tasa_castigo  
                end                  
            end
        end  

    end

  
  def self.seleccion (poblacion, n)
        numero_individuos = poblacion.length
        individuos_seleccionados = []
        i = 0;
        
        while i <= n do
            
            posicion = rand( 0..numero_individuos - 1 )

            
            if poblacion[posicion].usado

                posicion = rand( 0..numero_individuos - 1 )
                    
            end
            
            individuos_seleccionados << poblacion[posicion]
            poblacion[posicion].usado = true
            i +=1
        
        end

        return individuos_seleccionados
        individuos_seleccionados = []
    end 
end

  
=begin
padre = Individuo.new(6)
puts padre.genotipo.join
madre = Individuo.new(6)
puts "padre: " + padre.genotipo.join
puts "madre: " + madre.genotipo.join
# puts Operadores.mutacion(padre).genotipo.join
hijos = Operadores.cruce(padre, madre)

puts "hijo 1: " + hijos[0].genotipo.join
puts "hijo 2: " + hijos[1].genotipo.join


# padre = Individuo.new(6)
# puts padre.genotipo
# Operadores.funcion_fitness(padre)
# puts padre.genotipo
# puts padre.fitness
=end
