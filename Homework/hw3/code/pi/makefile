FC = gfortran
FFLAGS = -Wall -Wextra -Wimplicit-interface -Wno-surprising -fPIC -fmax-errors=1 -g -fcheck=all -fbacktrace

OBJ = pimod.o pi.o

pi: $(OBJ)
	$(FC) -o $@ $^ $(FFLAGS)

%.o: %.f90
	$(FC) -c $< $(FFLAGS)

.PHONY: clean

clean:
	rm -f dft *.o *.mod *~

