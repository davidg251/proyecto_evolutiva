require './algoritmo'


reinas = Algoritmo.new(20, 9, 0.2, 0.5, 5)

reinas.generar_poblacion()
reinas.ejecutar()