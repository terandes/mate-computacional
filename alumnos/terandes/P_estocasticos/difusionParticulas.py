#codigo para la animacion cada 10 pasos de la difusion de las particulas
for i in range(20):
    plt.subplot(5,4,i+1)
    plot(particulas[0:10*(i+1),0], particulas[0:10*(i+1),1], 'ro')
    plt.xlim(0,200)
    plt.ylim(0,200)
