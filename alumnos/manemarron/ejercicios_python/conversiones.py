def decimalToBinTwosComplement(n,k):
    """
    Funcion que transforma de decimal n a binario de k bits en complemento a 2
    """
    try:
        assert -2**(k-1)<=n<2**(k-1)
        if n<0:
            n+=2**k
        binary=""
        while len(binary)<8:
            binary="%s%s"%(n%2,binary)
            n/=2
        return binary
    except(AssertionError):
        return "Overflow"

def binTwosComplementToDecimal(binary):
    """
    Funcion que transforma un numero binario en complemento a 2 a decimal
    """
    try:
        dec=0
        for i in range(0,len(binary)):
            c = int(binary[i])
            if c!=0 and c!=1: raise Exception("No es binario")
            if i==0:
                c=-c
            dec+=c*2**(len(binary)-i-1)
        return dec
    except Exception as e:
        print e