#------------------------------------------------------------#
# This Makefile is written for compiling and run LISA in GPU. #
# contact me at ericzhng@umich.edu, if any issues. 
# Copyright @A2SRL Aerospace Engineering, 
# 			University of Michigan Ann Arbor
#------------------------------------------------------------#
TARGETS = LISAtoolbox

NVCC = nvcc

EXECUTABLE 	=	LISA_TOOLBOX_RELEASE
CUFILES   	=	lisa_main.cu

MAIN_DIR	=	0Main
HEADER_DIR	=	0Headers
EXECUTABLE_DIR	=	0Main

# export CUDA_HOME=/usr/local/cuda-7.5
# export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}

# export TECPLOT_HOME=/usr/local/tecplot360ex
# export PATH=$TECPLOT_HOME/bin:$PATH

TECPLOT_HOME	=	/home/ericzhng/10LISA_CODE/0Tecplot_Related
TECPLOT_INCLUDE =	-I$(TECPLOT_HOME)/include/
TECIO_LIB	=	-L$(TECPLOT_HOME)/lib/ -ltecio
# TECIO_LIB	=	$(TECPLOT_HOME)/lib/libtecio.a

# export LD_LIBRARY_PATH=${TECPLOT_HOME}/lib:/usr/local/cuda/lib64

CUBLAS_LIB	=	-lcublas

CFLAGS		=	-I$(HEADER_DIR)
LIBS		=	 -O3 -lm -std=c++11 -w -lpthread -lgomp
# -lcudart

CUDA_OPTION =	-gencode=arch=compute_37,code=\"sm_37,compute_37\" -Xcompiler -fopenmp
# --gpu-architecture=sm_35


_DEPS = interpretor.h lisa_coefficients_cal.h lisa_core_1d.h lisa_core_2d.h lisa_core_3d.h lisa_core_3d_fast.h lisa_core_3d_rk.h lisa_data_write.h lisa_element_select.h lisa_file_io.h lisa_node_1d.h lisa_node_2d.h lisa_node_3d.h lisa_node_select.h lisa_piezo_coupled_d31.h lisa_piezo_coupled_d36.h lisa_tecplot.h lisa_tecplot_ascii.h lisa_tecplot_binary.h lisa_utility_cpu.h lisa_utility_gpu.h

DEPS 		= 	$(patsubst %,$(HEADER_DIR)/%,$(_DEPS))

all: $(TARGETS)

LISAtoolbox: $(DEPS)
	$(NVCC) -o $(EXECUTABLE_DIR)/$(EXECUTABLE) $(MAIN_DIR)/$(CUFILES) $(TECPLOT_INCLUDE) $(TECIO_LIB) $(CUBLAS_LIB) $(CUDA_OPTION) $(CFLAGS) $(LIBS) && echo '\nCompile finished, you can run the program now'

LISAtoolbox_DEBUG: $(DEPS)
	$(NVCC) -g -G $(MAIN_DIR)/$(CUFILES) -o $(EXECUTABLE_DIR)/$(EXECUTABLE)  $(TECPLOT_INCLUDE) $(TECIO_LIB) $(CUBLAS_LIB) $(CUDA_OPTION) $(CFLAGS) $(LIBS) && echo '\nCompile finished, you can debug the program now'

run:
	cd $(EXECUTABLE_DIR) && ./$(EXECUTABLE)

run_display:
	cd $(EXECUTABLE_DIR) && ./$(EXECUTABLE)

run_nondisplay:
	cd $(EXECUTABLE_DIR) && ./$(EXECUTABLE) > ../LISA_EXECTUTION_INFO.txt

.PHONY: clean
clean:
	rm -f $(EXECUTABLE_DIR)/$(EXECUTABLE)
	rm -f $(PATHTOEXECUTABLE)/$(EXECUTABLE)
	# rm -f $(EXECUTABLE_DIR)/*.o
