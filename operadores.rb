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

    def self.fitness individuo
        
        tasa_castigo = 1.0 / $tamanio_genotipo
        castigo = 0
        ocurrencias = 0
    
            for i in 1..$tamanio_genotipo
                #cuenta las ocurrencias de cada numero 1..n y lo multiplica
                #por la tasa de castigo, es decir castigo ~ 0 buen indiv.
                if individuo.get_genotipo.count(i.to_s) > 1
                    ocurrencias +=1
                end
            end
        
        individuo.fitness = ocurrencias*tasa_castigo
        puts "fitness individuo #{ocurrencias*tasa_castigo}"

    end
end

padre = Individuo.new(6)
madre = Individuo.new(6)
puts "padre: " + padre.genotipo
puts "madre: " + madre.genotipo
hijos = Operadores.cruce(padre, madre)

puts "hijo 1: " + hijos[0].genotipo
puts "hijo 2: " + hijos[1].genotipo