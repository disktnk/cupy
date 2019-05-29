@echo off

set CUDA_VER=%1
set PY_VER=%2
set CUDA_PATH=CUDA_PATH_V%CUDA_VER%
set PY_PATH=C:\Development\Python\Python%PY_VER%
set PATH=%CUDA_PATH%\bin;%CUDA_PATH%\libnvvp;%PY_PATH%;%PY_PATH%\Scripts\%PATH%

curl -o xpytest.exe --insecure -L https://github.com/disktnk/xpytest/releases/download/v0.0.1/xpytest.exe

pip install cython
pip install -e .[test] -vvv
pip install scipy

set CUPY_TEST_GPU_LIMIT=1
xpytest --python python -m "not slow" --thread 8 tests/**/test_*.py
