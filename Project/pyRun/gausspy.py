import os
import shutil
import numpy as np
import matplotlib.pyplot as plt

def rebuild():
    # change into mathieu
    os.chdir('../fortran')
    

    # call 'make clean mathieu'
    os.system('make clean')


    # change back up to code directory
    os.chdir('..')

def build():
    # change into mathieu
    os.chdir('fortran')
    

    # call 'make mathieu'
    os.system('make')


    # change back up to code directory
    os.chdir('..')




def builder():
    os.chdir('fortran/')
    for i in range(1,5):
        shutil.copy2('mat_data/A_{}.dat'.format(i), 'A.dat')
        shutil.copy2('mat_data/b_{}.dat'.format(i), 'b.dat')
        os.system('./gauss')
        shutil.copy2('x.dat', 'mat_data/x_{}.dat'.format(i))





if __name__=="__main__":
    #print(os.getcwd())
    #exit()
    rebuild()
    build()
    builder()

    matrix = np.matrix()
    matrix([
        [ 1, 1, -1],
        [1, 2, -2],
        [-2, 1, 1]])
    fig = plt.figure()
    ax.set_aspect('equal')
    plt.imshow(matrix, interpolation='nearest', cmap=plt.cm.ocean)
    plt.colorbar()
    plt.show()


