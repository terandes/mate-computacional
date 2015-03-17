#conversion de la parte fraccionario de los 16 números posibles en cada binade
#tomando en cuenta que para el primer digito numero binario este por ser de la 
#parte fraccionaria se debe multiplicar por 2^-1, el segundo digito por 2^-2
#el tercer digito por 2^-3 y finalmente 2^-4
exp = 1
frac_dec = []
suma = 1.0
signo = 1
flotante = []
base2exp = (u'X2\u00B3')
for i in range (15, 0, -1):
    j = binario(i)
    #print j
    if len(j) < 4:
        falta = 4 - len(j)
        exp = exp + falta
    for k in j:
        #print k
        suma = suma + float(k)*(2**(-exp))
        exp = exp + 1
    if signo < 0:
        suma = -1*suma
        frac_dec.append(suma)
    else:
        frac_dec.append(suma)
    suma = 1.0
    exp = 1
    frac_dec[15-i] = str(frac_dec[15-i]) #+ print(u'X2\u00B3')
    print (frac_dec[15-i] + base2exp)
frac_dec.append(u'1.0000X2\u00B3')

print (frac_dec[15])
