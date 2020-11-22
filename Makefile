# Convenience Makefile

# This Makefile requires my OpenBSD port of Cowgol.

# The port includes a native compiler wrapper named
# cowgolc, which runs cowfe-cgen through cowlink-cgen
# as well as the C compiler.

CGENPROG =	bfc bin2hex cat dis8080 getstring hexdump rpn

PROG8080 =	bfc-8080 bin2hex-8080 cat-8080 dis8080-8080 getstring-8080 \
		hexdump-8080 rpn-8080

PROG8086 =	bfc-8086 bin2hex-8086 cat-8086 dis8080-8086 getstring-8086 \
		hexdump-8086 rpn-8086

Z80PROG =	bfc-z80 bin2hex-z80 cat-z80 dis8080-z80 getstring-z80 \
		hexdump-z80 rpn-z80

all: ${CGENPROG}

all-8080: ${PROG8080}

all-8086: ${PROG8086}

all-z80: ${Z80PROG}

all-all: all all-8080 all-8086 all-z80

bfc:
	cowgolc bfc.cow

bfc-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ bfc.cow bfc.cob
	cowbe-8080.nncgen.exe bfc.cob bfc.coo
	cowlink-8080.nncgen.exe -o bfc.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo bfc.coo
	cowasm-8080.nncgen.exe -o bfc.com bfc.asm
	rm -f bfc.cob bfc.coo bfc.asm

bfc-8086:
	cowfe-8086.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/msdos/ bfc.cow bfc.cob
	cowbe-8086.nncgen.exe bfc.cob bfc.coo
	cowlink-msdos.nncgen.exe -o bfc.asm /usr/local/share/cowgol/rt/msdos/cowgol.coo bfc.coo
	nasm -f bin -o bfc.com bfc.asm
	rm -f bfc.cob bfc.coo bfc.asm

bfc-z80:
	cowfe-z80.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpmz/ bfc.cow bfc.cob
	cowbe-z80.nncgen.exe bfc.cob bfc.coo
	cowlink-8080.nncgen.exe -o bfc.asm /usr/local/share/cowgol/rt/cpmz/cowgol.coo bfc.coo
	zmac -j -m -z -o bfc.cim bfc.asm
	rm -f bfc.cob bfc.coo bfc.asm

bin2hex:
	cowgolc bin2hex.cow

bin2hex-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ bin2hex.cow bin2hex.cob
	cowbe-8080.nncgen.exe bin2hex.cob bin2hex.coo
	cowlink-8080.nncgen.exe -o bin2hex.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo bin2hex.coo
	cowasm-8080.nncgen.exe -o bin2hex.com bin2hex.asm
	rm -f bin2hex.cob bin2hex.coo bin2hex.asm

bin2hex-8086:
	cowfe-8086.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/msdos/ bin2hex.cow bin2hex.cob
	cowbe-8086.nncgen.exe bin2hex.cob bin2hex.coo
	cowlink-msdos.nncgen.exe -o bin2hex.asm /usr/local/share/cowgol/rt/msdos/cowgol.coo bin2hex.coo
	nasm -f bin -o bin2hex.com bin2hex.asm
	rm -f bin2hex.cob bin2hex.coo bin2hex.asm

bin2hex-z80:
	cowfe-z80.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpmz/ bin2hex.cow bin2hex.cob
	cowbe-z80.nncgen.exe bin2hex.cob bin2hex.coo
	cowlink-8080.nncgen.exe -o bin2hex.asm /usr/local/share/cowgol/rt/cpmz/cowgol.coo bin2hex.coo
	zmac -j -m -z -o bin2hex.cim bin2hex.asm
	rm -f bin2hex.cob bin2hex.coo bin2hex.asm

cat:
	cowgolc cat.cow

cat-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ cat.cow cat.cob
	cowbe-8080.nncgen.exe cat.cob cat.coo
	cowlink-8080.nncgen.exe -o cat.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo cat.coo
	cowasm-8080.nncgen.exe -o cat.com cat.asm
	rm -f cat.cob cat.coo cat.asm

cat-8086:
	cowfe-8086.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/msdos/ cat.cow cat.cob
	cowbe-8086.nncgen.exe cat.cob cat.coo
	cowlink-msdos.nncgen.exe -o cat.asm /usr/local/share/cowgol/rt/msdos/cowgol.coo cat.coo
	nasm -f bin -o cat.com cat.asm
	rm -f cat.cob cat.coo cat.asm

cat-z80:
	cowfe-z80.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpmz/ cat.cow cat.cob
	cowbe-z80.nncgen.exe cat.cob cat.coo
	cowlink-8080.nncgen.exe -o cat.asm /usr/local/share/cowgol/rt/cpmz/cowgol.coo cat.coo
	zmac -j -m -z -o cat.cim cat.asm
	rm -f cat.cob cat.coo cat.asm

dis8080:
	cowgolc dis8080.cow

dis8080-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ dis8080.cow dis8080.cob
	cowbe-8080.nncgen.exe dis8080.cob dis8080.coo
	cowlink-8080.nncgen.exe -o dis8080.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo dis8080.coo
	cowasm-8080.nncgen.exe -o dis8080.com dis8080.asm
	rm -f dis8080.cob dis8080.coo dis8080.asm

dis8080-8086:
	cowfe-8086.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/msdos/ dis8080.cow dis8080.cob
	cowbe-8086.nncgen.exe dis8080.cob dis8080.coo
	cowlink-msdos.nncgen.exe -o dis8080.asm /usr/local/share/cowgol/rt/msdos/cowgol.coo dis8080.coo
	nasm -f bin -o dis8080.com dis8080.asm
	rm -f dis8080.cob dis8080.coo dis8080.asm

dis8080-z80:
	cowfe-z80.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpmz/ dis8080.cow dis8080.cob
	cowbe-z80.nncgen.exe dis8080.cob dis8080.coo
	cowlink-8080.nncgen.exe -o dis8080.asm /usr/local/share/cowgol/rt/cpmz/cowgol.coo dis8080.coo
	zmac -j -m -z -o dis8080.cim dis8080.asm
	rm -f dis8080.cob dis8080.coo dis8080.asm

dis8086-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ dis8086.cow dis8086.cob
	cowbe-8080.nncgen.exe dis8086.cob dis8086.coo
	cowlink-8080.nncgen.exe -o dis8086.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo dis8086.coo
	cowasm-8080.nncgen.exe -o dis8086.com dis8086.asm
	rm -f dis8086.cob dis8086.coo dis8086.asm

getstring:
	cowgolc getstring.cow

getstring-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ getstring.cow getstring.cob
	cowbe-8080.nncgen.exe getstring.cob getstring.coo
	cowlink-8080.nncgen.exe -o getstring.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo getstring.coo
	cowasm-8080.nncgen.exe -o getstring.com getstring.asm
	rm -f getstring.cob getstring.coo getstring.asm

getstring-8086:
	cowfe-8086.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/msdos/ getstring.cow getstring.cob
	cowbe-8086.nncgen.exe getstring.cob getstring.coo
	cowlink-msdos.nncgen.exe -o getstring.asm /usr/local/share/cowgol/rt/msdos/cowgol.coo getstring.coo
	nasm -f bin -o hexdump.com hexdump.asm
	rm -f getstring.cob getstring.coo getstring.asm

getstring-z80:
	cowfe-z80.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpmz/ getstring.cow getstring.cob
	cowbe-z80.nncgen.exe getstring.cob getstring.coo
	cowlink-8080.nncgen.exe -o getstring.asm /usr/local/share/cowgol/rt/cpmz/cowgol.coo getstring.coo
	zmac -j -m -z -o rpn.cim rpn.asm
	rm -f getstring.cob getstring.coo getstring.asm

hexdump:
	cowgolc hexdump.cow

hexdump-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ hexdump.cow hexdump.cob
	cowbe-8080.nncgen.exe hexdump.cob hexdump.coo
	cowlink-8080.nncgen.exe -o hexdump.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo hexdump.coo
	cowasm-8080.nncgen.exe -o hexdump.com hexdump.asm
	rm -f hexdump.cob hexdump.coo hexdump.asm

hexdump-8086:
	cowfe-8086.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/msdos/ hexdump.cow hexdump.cob
	cowbe-8086.nncgen.exe hexdump.cob hexdump.coo
	cowlink-msdos.nncgen.exe -o hexdump.asm /usr/local/share/cowgol/rt/msdos/cowgol.coo hexdump.coo
	nasm -f bin -o hexdump.com hexdump.asm
	rm -f hexdump.cob hexdump.coo hexdump.asm

hexdump-z80:
	cowfe-z80.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpmz/ hexdump.cow hexdump.cob
	cowbe-z80.nncgen.exe hexdump.cob hexdump.coo
	cowlink-8080.nncgen.exe -o hexdump.asm /usr/local/share/cowgol/rt/cpmz/cowgol.coo hexdump.coo
	zmac -j -m -z -o hexdump.cim hexdump.asm
	rm -f hexdump.cob hexdump.coo hexdump.asm

rpn:
	cowgolc rpn.cow

rpn-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ rpn.cow rpn.cob
	cowbe-8080.nncgen.exe rpn.cob rpn.coo
	cowlink-8080.nncgen.exe -o rpn.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo rpn.coo
	cowasm-8080.nncgen.exe -o rpn.com rpn.asm
	rm -f rpn.cob rpn.coo rpn.asm

rpn-8086:
	cowfe-8086.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/msdos/ rpn.cow rpn.cob
	cowbe-8086.nncgen.exe rpn.cob rpn.coo
	cowlink-msdos.nncgen.exe -o rpn.asm /usr/local/share/cowgol/rt/msdos/cowgol.coo rpn.coo
	nasm -f bin -o rpn.com rpn.asm
	rm -f rpn.cob rpn.coo rpn.asm

rpn-z80:
	cowfe-z80.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpmz/ rpn.cow rpn.cob
	cowbe-z80.nncgen.exe rpn.cob rpn.coo
	cowlink-8080.nncgen.exe -o rpn.asm /usr/local/share/cowgol/rt/cpmz/cowgol.coo rpn.coo
	zmac -j -m -z -o rpn.cim rpn.asm
	rm -f rpn.cob rpn.coo rpn.asm

clean:
	rm -f ${CGENPROG}

clean-8080:
	rm -f *.com

clean-8086:
	rm -f *.com

clean-z80:
	rm -f *.cim

clean-all: clean clean-8080 clean-8086 clean-z80
