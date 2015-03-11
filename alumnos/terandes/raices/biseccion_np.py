#algoritmo Bisección para encontrar raíces, modificado utilizando Numpy
def biseccionNP(func, a, b, stop, tolerancia):
    x = (a + b)/2
    fguarda = np.zeros((1,3))

    assert f(a)*f(b) < 0, "El signo de la función en los extremos debería de ser diferente"
    assert f(a) != 0, "La raíz es %.5f" % a
    assert f(b) != 0, "La raíz es %.5f" % b

    print "%s\t%12s\t%12s" % ("k", "I(a,b)", "x")
    print "%d\tI(%.10f, %.10f)\t%.10f" % (0,a, b, x)
    
    
    fguarda=func(np.array([a,b,x]))
    f_x = fguarda[2]
    f_a = fguarda[0]
    f_b = fguarda[1]
    comparacion = abs(f_a-f_b) #aqui puede ocurrir cancelación catastrófica pero no se me ocurrió otra forma de introducir la tolerancia
    k = 0
    while (abs(comparacion) >= tolerancia) or k<stop:
        if (f_a*f_x < 0):
            a, b = a, x
        elif (f_x*f_b < 0):
            a, b = x, b
        x = (a+b)/2
        fguarda = func(np.array([a,b,x]))
        f_x = fguarda[2]
        f_a = fguarda[0]
        f_b = fguarda[1]
        comparacion = abs(f_a-f_b)
        k = k+1
        print "%d\tI(%.5f, %.5f)\t%.12f" % (k+1, a, b, x)
        