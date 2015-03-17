#método de la secante (resultado de modificar el método de Newton, en lugar de usar, la derivada usar
#una aproximación de la derivada hacia atrás, por lo que es necesario un tercer punto: x2
def secante(f, x0, x1, tolerancia, stop):

    # Inicializamos el contador
    k = 0

    # Inicializamos abs(x1-x0) en un número mayor que la tolerancia
    diff = 1
    print "{: >5} {: >10} {: >10} {: >10} {: >11} {: >10}".format("k", "x0", "f(x0)", "DF(x0, x1)", "abs(x1-x0)", "x2")

    while diff >= tolerancia and k <= stop:
        k = k + 1
        DF = (f(x0) - f(x1))/(x0 - x1)
        #x0 = x1
        x2 = x1 - (float(f(x1)/DF))
        print "{: >5} {: >10.5f} {: >10.5f} {: >10.5f} {: >10.5f} {: >11.5f}".format(k, x0, f(x0), DF, diff, x2)

        diff = abs(x1 - x0)

        x0 = x1
        x1 = x2

    if k > stop:
        print "El método de Newton no convergió: para la tolerancia especificada, se alcanzaron el máximo número de iteraciones"
        print "\n\nLa raíz es %2.12f" % x0
        