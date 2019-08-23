set /A length=3

set /A n_train=10000
set dir_train=../data/train

set /A n_test=2000
set dir_test=../data/test

REM for /l %%i in (0,1,%n_train%) do ripser.exe < %dir_train%/%%i.in --format point-cloud --dim 1 > %dir_train%/%%i.rips
REM for /l %%i in (0,1,%n_test%) do ripser.exe < %dir_test%/%%i.in --format point-cloud --dim 1 | extracter.exe %%i %length% > %dir_test%/%%i.out

REM for /l %%i in (0,1,%n_train%) do ripser.exe < %dir_train%/%%i.in --format point-cloud --dim 1 > %dir_train%/%%i.rips
for /l %%i in (2,1,3) do ripser.exe < %dir_train%/%%i.in --format point-cloud --dim 1 | extracter.exe %%i %length% > %dir_train%/%%i.out

pause