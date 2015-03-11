#ejercicio para encontrar los intervalos donde una función cambia de signo
#"n" no debe ser muy grande porque si no se estaria procediendo como el 
#método de la bisección
def find_brackets(func, a, b, n):
   In = abs(b - a)/n
   intervalos=[a]   #se inicializa la lista de los extremos de intervalos
#con el número más chico ingresado: a
   cIntervalos = np.zeros((1,1))  #inicializo un vector donde guardar los
#extremos de los intervalos
   xi = a
   while xi < b:
       xi = xi+In
       intervalos.append(xi)  #se va construyendo la lista con los 
#extremos de los intervalos
  # print intervalos
   brackets=np.array(intervalos) #cambio la lista a vector para poder evaluar la función en la siguiente instrucción 
   signo=func(brackets)
#para identificar en cuales extremos hay cambio de signo si lo hay que se guarden 
#los valores de los extremos en el vector cIntervalos
   for k in range(0, len(signo)-1, 1):
       if signo[k]*signo[k+1]<0:
           cIntervalos = np.insert(cIntervalos,(1,), (brackets[k], brackets[k+1]))
   cIntervalos = cIntervalos[1:] #quito el cero con declare el vector
#le doy forma de intervalos al vector
   cIntervalos = cIntervalos.reshape(len(cIntervalos)/2,2) 
   return cIntervalos
