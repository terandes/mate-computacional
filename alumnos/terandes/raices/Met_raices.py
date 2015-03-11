#funcion para encontrar varias raices si es que existen diferentes a lo largo de un intervalo
#utilizando el metodo de la bisección o newton, recibe como argumentos, la función la derivada, los 
#extremos del intervalo (a,b), el número de subintervalos a encontrar donde cambia el signo "n" y 
#el algoritmo a utilizar
def raices(f, df, a, b, stop, tolerancia, n, algoritmo):
    intervalos = find_brackets(f, a, b, n)
    for i in range (0, len(intervalos), 1):
        a = intervalos[i,0]
        b = intervalos[i,1]
        if algoritmo == biseccionNP:
            algoritmo(f, a, b, stop, tolerancia)
        else:    
            x0 = (a+b)/2    
            algoritmo(f, df, x0, tolerancia, stop)
