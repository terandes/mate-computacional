radio = 1

N = 10
error_dif_N =np.array([0.0])
N_vec = np.array([10.0])
for i in range(1, 6, 1):
    N = 10**i
# Números al azar
    X = np.random.uniform(low = -radio, high = radio, size  = N)
    Y = np.random.uniform(low = -radio, high = radio, size = N)

    # Distancia desde el centro
    dist = np.sqrt(X**2+Y**2);

    # Aplicamos la fórmula...
    caja = (2.0*radio)**2
    esta_adentro = dist < radio
    N_adentro = np.sum(esta_adentro)
    area_circulo = caja*N_adentro/N
    error = abs(area_circulo - (pi*radio**2))
    #print error
    error_dif_N = np.insert(error_dif_N, len(error_dif_N), error)
    N_vec = np.insert(N_vec, len(N_vec), N)
    
error_dif_N = error_dif_N[1:]
N_vec = N_vec[1:]
#dibujamos
#plt.figure(figsize(8,8))
plt.scatter(N_vec, error_dif_N)
plt.plot(N_vec, error_dif_N)
plt.title('Error en aproximacion del area por Monte Carlo')
plt.xlabel(r"N = puntos aleatorios para determinar el area")
plt.ylabel(r"error ")
print error_dif_N, 
print N_vec
