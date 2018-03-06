#Chose a platform here: (tested: genesis, n64, snes)
#PLATFORM:=atari2600 #Atari 2600
#PLATFORM:=atari5200 #Atari 5200
#PLATFORM:=atari7800 #Atari 7800
#PLATFORM:=atarijaguar #Atari Jaguar
#PLATFORM:=atarilynx #Atari Lynx
#PLATFORM:=c64 #Commodore 64
#PLATFORM:=cps1 #CPS1
#PLATFORM:=cps2 #CPS2
#PLATFORM:=mame #MAME
#PLATFORM:=namcosystem22 #Namco System 22
#PLATFORM:=neogeo #Neo Geo
#PLATFORM:=neogeocd #Neo Geo CD
#PLATFORM:=neogeopocket #Neo Geo Pocket
#PLATFORM:=segacd #Sega CD
#PLATFORM:=dc #Sega Dreamcast
#PLATFORM:=gamegear #Sega Game Gear
#PLATFORM:=genesis #Sega Genesis
#PLATFORM:=mastersystem #Sega Master System
#PLATFORM:=model2 #Sega Model 2
#PLATFORM:=saturn #Sega Saturn
#PLATFORM:=psx #Sony Playstation
#PLATFORM:=ps2 #Sony Playstation 2
#PLATFORM:=psp #Sony Playstation Portable


all: 4finalzeugs

prepare:
		mkdir -p 1raw
		mkdir -p 2links
		mkdir -p 3download
		mkdir -p 4final

1raw/z: prepare
	sh 1getraw.sh $(PLATFORM)

2tmplinks.sh: 1raw/z 2getlinks.sh
	sh 2getlinks.sh $(PLATFORM)

3downloadzeugs: 2tmplinks.sh
	sh 2tmplinks.sh

4finalzeugs: 3downloadzeugs 4extract.sh
	sh 4extract.sh
	mv 4final 4final-$(PLATFORM)



clean:
	rm -rf 1raw
	rm -rf 2links
	rm -rf 3download
	rm -rf 4final
	rm -f 2tmplinks.sh
	rm -f 3tmpdl.sh
