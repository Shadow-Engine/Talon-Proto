# Files to build
ftb=Source/main.cpp
compiler=g++
outExe=out.exe

OSVER=ERROR

ifeq ($(OS),Windows_NT)
	OSVER = WIN
else
	OSVER = LINUX
endif

all:
	windres resources/resources.rc res.o
	${compiler} -Iinclude ${ftb} res.o -o dist/${outExe}
	rcedit.exe dist/${outExe} --set-icon resources/icon/icon.ico

clean:
	del res.o
	del dist/${outExe}