@echo off

SET SDL2_PATH=D:/SDL/SDL2-2.28.4/x86_64-w64-mingw32
SET SDL2_IMAGE_PATH=D:/SDL/SDL2_image-2.8.1/x86_64-w64-mingw32
SET SDL2_TTF_PATH=D:/SDL/SDL2_ttf-2.22.0/x86_64-w64-mingw32

SET SDL2_VC_PATH=D:/SDL/SDL2-VC-2.30.0
SET SDL2_VC_IMAGE_PATH=D:/SDL/SDL2_image-VC-2.8.2
SET SDL2_VC_TTF_PATH=D:/SDL/SDL2_ttf-VC-2.22.0

DOSKEY ll=dir /W
DOSKEY ls=dir /B
DOSKEY clear=cls
DOSKEY dev=D:\dev\
DOSKEY vv=nvim .
DOSKEY gv=nvim-qt .
DOSKEY lg=lazygit
DOSKEY dn=dotnet
DOSKEY g=git
DOSKEY gr=git rebase master
DOSKEY gca=git commit -a -m
DOSKEY gp=git "push"
DOSKEY gu=git "push --set-upstream origin"
DOSKEY gc=git "checkout"
DOSKEY gt=git "status"
DOSKEY pru=git "remote prune origin"
DOSKEY gcm=git "checkout master && git fetch && git pull"
DOSKEY gpr=gh "pr create -B master --body '' --title"
DOSKEY prv=gh "pr list"
DOSKEY prm=gh "pr merge --merge"
DOSKEY nc=ncat
DOSKEY b=call "./misc/build.bat"
DOSKEY bd=call "./misc/build.bat" dev
DOSKEY r=call "./misc/run.bat"
DOSKEY clenv=call "./misc/clenv.bat"
DOSKEY make="mingw32-make.exe"
DOSKEY editbat=nvim "C:\Users\chris\clvs.bat"
DOSKEY showbat=more "C:\Users\chris\clvs.bat"
DOSKEY gotonvim=C:\Users\chris
