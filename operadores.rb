# require './individuo'

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

        tamanio_genotipo = genotipo_padre.length

        case tamanio_genotipo 

            when 4 
                corte_a = 2
                corte_b = 3            
            else
                loop do 
                    corte_a = rand( 1..tamanio_genotipo - 2 )
                    corte_b = rand( 1..tamanio_genotipo - 2 )
                    break if (corte_a - corte_b).abs <= 1
                end
        end

        segmento_padre = genotipo_padre[corte_a,corte_b]
        genotipo_padre[corte_a,corte_b] = genotipo_madre[corte_a,corte_b]
        genotipo_madre[corte_a,corte_b] = segmento_padre

        padre.genotipo = genotipo_padre
        madre.genotipo = genotipo_madre

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

# padre = Individuo.new(6)
# # madre = Individuo.new(6)
# puts padre.genotipo
# # hijos = Operadores.cruce(padre, madre)
# # puts hijos[0].genotipo
# # puts hijos[1].genotipo
# puts Operadores.mutacion(padre).genotipo