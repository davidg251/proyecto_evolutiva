class Operadores

    def self.mutacion individuo
        tamanio_individuo = individuo.length
        nuevo_alelo = rand( 0..9 ).to_s;
        posicion_reemplazo = rand( 0..tamanio_individuo - 2 )
        individuo[posicion_reemplazo] = nuevo_alelo
        puts individuo
    end

    def self.cruce (padre, madre)
        tamanio_individuo = padre.length

        case tamanio_individuo 

            when 4 
                corte_a = 2
                corte_b = 3            
            else
                loop do 
                    corte_a = rand( 1..tamanio_individuo - 2 )
                    corte_b = rand( 1..tamanio_individuo - 2 )
                    break if (corte_a - corte_b).abs <= 1
                end
        end

        segmento_padre = padre[corte_a,corte_b]
        padre[corte_a,corte_b] = madre[corte_a,corte_b]
        madre[corte_a,corte_b] = segmento_padre

        return padre, madre
    end

    def self.fitness individuo
            
    end
end
