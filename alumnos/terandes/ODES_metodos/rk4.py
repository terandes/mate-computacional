#metodo de RUNGE-KUTTA DE 4TO ORDEN,tomando como base el de 2do orden
def RK4(y, t, dt, derivadas):
    k0 = dt*derivadas(y, t)
    k1 = dt*derivadas(y + 0.5*k0, t + 0.5*dt)
    k2 = dt*derivadas(y + 0.5*k1, t + 0.5*dt)
    k3 = dt*derivadas(y + k2, t + dt)
    y_next = y + (k0 + 2*k1 + 2*k2 + k3)/6

    return y_next