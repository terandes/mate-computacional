from math import sin, cos
def coordenadasEsfericas(r,theta,phi):
    x = r*sin(phi)*cos(theta)
    y = r*sin(phi)*sin(theta)
    x = r*cos(phi)
    print x,y,z