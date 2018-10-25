# doopl-R

This is an example on how to use OPL with the R framework and the reticulate library (open source library).

It shows how to run an OPL model with R dataframes as inputs, and R dataframes as solution outputs.
In this example, we use SQLite to retrieve data from a database.

To make it work, you need:
   * R runtime
   * a Python interpreter
   * doopl library installed in your Python environment (https://pypi.org/project/doopl/)
   * CPLEX Studio 128 runtime
   
First, install doopl library in your Python interpreter: 'pip install doopl'. You alternatively download it and put it in your PYTHONPATH).

Second, set the environment path variable to point to the OPL runtime:
   * on Mac OS, it will be something like DYLD_LIBRARY_PATH=/Applications/CPLEX_Studio128/opl/bin/x86-64_osx
   * on Linux, it will be LD_LIBRARY_PATH
   * on Windows, it will be PATH.
   
Now, you can run R and the carseq.r script.

All the doopl functionalities are available in R. You can find the doopl examples here: https://github.com/IBMDecisionOptimization/doopl-examples/tree/master/examples

You can access the reticulate documentation here: https://rstudio.github.io/reticulate/articles/calling_python.html where you will find all the R-Python conversions.
