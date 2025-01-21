OBJDIR = $(GARFIELD_HOME)/Object
SRCDIR = $(GARFIELD_HOME)/Source
INCDIR = $(GARFIELD_HOME)/Include
HEEDDIR = $(GARFIELD_HOME)/Heed
LIBDIR = $(GARFIELD_HOME)/Library

# Compiler flags
CFLAGS = -Wall -Wextra -Wno-long-long \
`root-config --cflags` \
-O3 -fno-common -c \
-I$(INCDIR) -I$(HEEDDIR)\



# Debug flags
#CFLAGS += -g

LDFLAGS = `root-config --glibs` -lGeom
LDFLAGS += -L/usr/local/gfortran/lib -lgfortran
LDFLAGS += -L$(LIBDIR) -lGarfield -lm -Wl,-no_compact_unwind
#LDFLAGS += -g

gasfile: gasfile.C
	$(CXX) $(CFLAGS) gasfile.C
	$(CXX) -o gasfile gasfile.o $(LDFLAGS)
	rm gasfile.o
