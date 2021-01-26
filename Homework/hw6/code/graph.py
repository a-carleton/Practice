import sys
import os
import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt('dist.dat')
x = data[:,0]
y = data[:,1]

def S(x):
    ps = 0.75*np.exp(-np.abs(x-0.25))
    return ps/np.sum(ps)


fig = plt.figure()
ax = plt.subplot(111)
ax.plot(x, y, label='P_part(x)')
ax.plot(x, S(x), '--', label='S(x)')
plt.xlabel('x')
plt.ylabel('Probability')
plt.title('Stationary PMF of particle position (N=200, BIAS=0.001)')
plt.grid(True)
ax.legend()
plt.show()