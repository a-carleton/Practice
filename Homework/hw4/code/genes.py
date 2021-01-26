import numpy as np
import matplotlib.pyplot as plt

def bar_plot(histo):
    plt.figure(figsize=(15,4))
    plt.bar(range(len(histo)), histo.values())
    plt.title('Codon Frequency in SARS-CoV-2')
    plt.xlabel('Codon')
    plt.ylabel('Frequency')
    plt.xticks(range(len(histo)),list(histo), rotation=80)
    plt.grid(True)
    plt.savefig('histogram.png')

def histogram(s):
    d = dict()

    for i in range(2, len(s)-1):
        codon = s[i-2] + s[i-1] + s[i]
        d[codon] = 1 if codon not in d else d[codon]+1

    return d

def baseDensity(geneStr, nWind=200):
    length = len(geneStr) - nWind

    dA = np.zeros(length)
    dT = np.zeros(length)
    dG = np.zeros(length)
    dC = np.zeros(length)


    for n in range(length):
        window = geneStr[n:n+nWind]
        dA[n] = window.count('a')/nWind
        dT[n] = window.count('t')/nWind
        dG[n] = window.count('g')/nWind
        dC[n] = window.count('c')/nWind

    return dA,dT,dG,dC


def density_plot(dA,dT,dG,dC):
    plt.figure(figsize=(15,6))
    length = range(len(dA))
    plt.plot(length,dA)
    plt.plot(length,dT)
    plt.plot(length,dG)
    plt.plot(length,dC)
    plt.legend(['A','T','G','C'])
    plt.title('Density of base pairs through gene sequence')
    plt.xlabel('Sequence position')
    plt.ylabel('Fraction per window')
    plt.grid(True)
    plt.savefig('density.png')
    

if __name__ == "__main__":
    with open('sarsCov2Sequence.txt','r') as geneFile:
        geneStr = geneFile.readline()

    dA,dT,dG,dC = baseDensity(geneStr)

    density_plot(dA,dT,dG,dC)

    codon_freq = histogram(geneStr)

    bar_plot(codon_freq)
