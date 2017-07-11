######################################################################
# Compiler definitions for Linux systems
#  all compiler specific information should be declared here

CXX:= mpicxx
CXX_SERIAL:=g++

CXXFLAGS := -O3 -fomit-frame-pointer -funroll-loops -ffast-math
CXXFLAGS += -DUSE_MPI -DUSE_BLAS -DUSE_LAPACK  ${INCLUDEPATH}

#LAPACK_LIBS :=  -L$(MKLROOT)/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread 
LAPACK_LIBS :=   -L$(MKLROOT)/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread  -lm
LAPACK_INCLUDE :=  -I$(MKLROOT)/include

BLAS_LIBS :=  $(LAPACK_LIBS) 
BLAS_INCLUDE := $(LAPACK_INCLUDE) 

#EINSPLINE_LIBS := -L/home/lkwagner/qwalk/src/einspline-0.9.2/lib -leinspline
#EINSPLINE_INCLUDE := -I/home/lkwagner/qwalk/src/einspline-0.9.2/include/einspline


DEBUG:= -Wall -DNO_RANGE_CHECKING -DNDEBUG   -D__USE_GNU -DDEBUG_WRITE
LDFLAGS:=  

######################################################################
# This is the invokation to generate dependencies
DEPENDMAKER:=g++ -MM  $(INCLUDEPATH)

######################################################################
# example of changing options based upon processor type:
# if compiling on 386, don't use 486 extensions

#ifeq ("i386",$(shell uname -m'))
#  CXXFLAGS+=-mno-486
#endif
#ifeq ("i486",$(shell uname -m))
#  CXXFLAGS+=-m486
#endif
#ifeq ("i586",$(shell uname -m))
#  CXXFLAGS+=-m586  # if only gcc supported this...
#endif
