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
        return individuo
    end

    def self.cruce (padre, madre)
        genotipo_padre = padre.genotipo
        genotipo_madre = madre.genotipo
        genotipo_temporal = genotipo_padre

        inicio = genotipo_padre[0]
        ultimo = genotipo_madre[0]
        ciclo = inicio + ultimo

        while inicio != ultimo
            indice = genotipo_padre.index(ultimo)
            ultimo = genotipo_madre[indice]
            ciclo += ultimo
        end

        ciclo = ciclo.chop


        m = genotipo_madre
        p = genotipo_padre

        puts "ciclo: " + ciclo

        for i in 0..p.length - 1
            if !ciclo.include? p[i]
                temp = p[i]
                p[i] = m[i]
                m[i] = temp
            end
        end
        puts m
        puts p

        padre.genotipo = p
        madre.genotipo = m

        return padre, madre
    end



    def self.funcion_fitness individuo
        #el codigo esta feo por el trasnocho hay
        #redundancias y codigo extra por razones de debú
        n =  individuo.tamanio
        tasa_castigo = 1.0 / n

        for i in 1..n
            for j in 1..n

                if i == j 
                    break

                elsif (i - individuo.genotipo[i-1].to_i) == (j - individuo.genotipo[j-1].to_i)    

                    individuo.fitness = individuo.fitness + tasa_castigo

                elsif (individuo.genotipo[i-1].to_i - individuo.genotipo[j-1].to_i) == (i - j)   

                     individuo.fitness = individuo.fitness + tasa_castigo   
                end
            end
        end        
    end




end

=begin
padre = Individuo.new(6)
madre = Individuo.new(6)
puts "padre: " + padre.genotipo
puts "madre: " + madre.genotipo
hijos = Operadores.cruce(padre, madre)

puts "hijo 1: " + hijos[0].genotipo
puts "hijo 2: " + hijos[1].genotipo


padre = Individuo.new(6)
puts padre.genotipo
Operadores.funcion_fitness(padre)
puts padre.genotipo
puts padre.fitness
=end