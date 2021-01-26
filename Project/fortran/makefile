FC = gfortran
FFLAGS = -Wall -Wextra -Wno-surprising -fPIC -fmax-errors=1 -g -fcheck=all -fbacktrace -fdefault-double-8 -J ./obj
LFLAGS = -llapack

ODIR=.

_OBJ = read_data.o ge_elim.o write_data.o linear_solve.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

gauss: $(OBJ)
	$(FC) -o $@ $^ $(LFLAGS) $(FFLAGS)

$(ODIR)/%.o: %.f90
	$(FC) -c -o $@ $< $(FFLAGS)

.PHONY: clean

clean:
	rm -f gauss obj/* *~
	rm -f *.o
