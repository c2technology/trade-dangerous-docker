@echo off
SETLOCAL ENABLEEXTENSIONS

SET hops=2
SET jumps=2
SET lightyear_per=8.56
SET capacity=8
SET credits_available=5000
SET location="andere/kummer"

:loop
IF NOT "%1"=="" (
    IF "%1"=="-hops" (
        SET hops=%2
        SHIFT
    )
	IF "%1"=="-jumps" (
        SET jumps=%2
        SHIFT
    )
	IF "%1"=="-ly" (
        SET lightyear_per=%2
        SHIFT
    )
    IF "%1"=="-cap" (
        SET capacity=%2
        SHIFT
    )
	IF "%1"=="-credits" (
        SET credits_available=%2
        SHIFT
    )
	IF "%1"=="-loc" (
        SET location=%2
        SHIFT
    )
	IF "%1"=="-update" (
        SET update=1
    )
    SHIFT
    GOTO :loop
)

ECHO Searching for trade routes within %hops% hops from %location% with max %jumps% jumps per hop.
ECHO Available cargo: %capacity%
ECHO Available credits: %credits_available%

python -m pip install tradedangerous 2>&1 1>nul
if defined update (
	python -m tradedangerous.trade import -P eddblink -O skipvend
)
python -m tradedangerous.trade run --from %location% --credits %credits_available% --capacity %capacity% --ly-per %lightyear_per% --jumps %jumps% --hops %hops%