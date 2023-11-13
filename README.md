Setup
-----
To use the plotting script you will need to
```shell
$ pip install --user xbout
```
or use `conda` instead if you prefer that.

Compile and run
---------------
To compile, run and plot this test, run the following from this directory:
```shell
$ ./initialise.sh
$ cd run
$ mpirun -np 8 ./isothermal1d
$ ./animate-results.py
```
