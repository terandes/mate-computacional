#numeros base 2, con 8 bits de representacion
fracciones = []
signo = str('0' ' ')
sign = str('1' ' ')
ceros = str('0')
binades = []
h = 16
start = 0
conjunto = []
for i in range (15, 0, -1):
    j = binario(i)
    # k = math.floor(i)
    # jj = binario(k)
    fracciones.append(j)
    
    if len(fracciones[15-i]) == 4:
        fracciones[15-i] = fracciones[15-i]
    else:
        falta = 4 - len(fracciones[15-i])
        fracciones[15-i] = falta*ceros + fracciones[15-i]
fracciones.append('0000')
binades = 8*fracciones
for k in range (7, 0, -1):
    jj = binario(k) 
    #print jj,   k,  len(jj)
    for n in range (start, h, 1):
        if len(str(jj)) == 3:
            binades[n] = binades[n] + str(' ') + str(jj)
            #print binades[n]
        else:
            falta_exp = 3 - len(str(jj))
            binades[n] = binades[n] + str(' ') + falta_exp*ceros + str(jj)
            #print binades[n]
    h = h + 16
    start = start + 16
#print 'exponente = 000'
for n in range (112, 128, 1):
    binades[n] = binades[n] + str(' ') + 3*ceros 
    #print binades[n]
conjunto = binades*2
#print conjunto
for t in range(0, 128, 1):
    conjunto[t] = sign + conjunto[t]
    print conjunto[t]
for s in range(255, 127, -1):
    conjunto[s] = signo + conjunto[s]
    print conjunto[s]
    