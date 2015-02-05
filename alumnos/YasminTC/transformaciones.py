from math import sin, cos
def cart(r,t,f):
    """de coordenadas esfericas a cartesianas"""
    x=r*sin(f)*cos(t)
    y=r*sin(f)*sin(t)
    z=r*cos(f)
    print x,y,z
    return x,y,z