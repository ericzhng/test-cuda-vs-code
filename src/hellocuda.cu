#include <stdio.h>
#include <cuda.h>
#include <iostream>

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

using namespace std;

// New
#define gpuErrCheck( err ) (gpuAssert( err, __FILE__, __LINE__ ))

static void gpuAssert(cudaError_t err, const char *file, int line) {
	if (err != cudaSuccess) {
		printf("%s in %s at line %d\n", cudaGetErrorString(err), file, line);
		#ifdef _WIN32
			system("pause");
		#endif
		exit(EXIT_FAILURE);
	}
}

int main()
{
    cout << "Hello World\n" << endl;

    int n = 10000;
    int *a;
    int *dev_a;

	if (NULL == (a = (int*)malloc(n*sizeof(int)))) exit(20);

	int c = 32 +23;
	c += 1;

	printf("%d\n", c);


	gpuErrCheck(cudaMalloc((void**)&dev_a, n * sizeof(int)));
	gpuErrCheck(cudaMemcpy(dev_a, a, n * sizeof(int), cudaMemcpyHostToDevice));

}