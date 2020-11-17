# Convenience Makefile

# This Makefile requires my OpenBSD port of Cowgol.

# The port includes a native compiler wrapper named
# cowgolc, which runs cowfe-cgen through cowlink-cgen
# as well as the C compiler.

all: bfc bin2hex cat dis8080 hexdump rpn

all-8080: bfc-8080 bin2hex-8080 cat-8080 dis8080-8080 hexdump-8080 rpn-8080

all-z80: bfc-z80 bin2hex-z80 cat-z80 dis8080-z80 hexdump-z80 rpn-z80

all-all: all all-8080 all-z80

bfc:
	cowgolc bfc.cow

bfc-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ bfc.cow bfc.cob
	cowbe-8080.nncgen.exe bfc.cob bfc.coo
	cowlink-8080.nncgen.exe -o bfc.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo bfc.coo
	cowasm-8080.nncgen.exe -o bfc.com bfc.asm
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

dis8080-z80:
	cowfe-z80.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpmz/ dis8080.cow dis8080.cob
	cowbe-z80.nncgen.exe dis8080.cob dis8080.coo
	cowlink-8080.nncgen.exe -o dis8080.asm /usr/local/share/cowgol/rt/cpmz/cowgol.coo dis8080.coo
	zmac -j -m -z -o dis8080.cim dis8080.asm
	rm -f dis8080.cob dis8080.coo dis8080.asm

hexdump:
	cowgolc hexdump.cow

hexdump-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ hexdump.cow hexdump.cob
	cowbe-8080.nncgen.exe hexdump.cob hexdump.coo
	cowlink-8080.nncgen.exe -o hexdump.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo hexdump.coo
	cowasm-8080.nncgen.exe -o hexdump.com hexdump.asm
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

rpn-z80:
	cowfe-z80.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpmz/ rpn.cow rpn.cob
	cowbe-z80.nncgen.exe rpn.cob rpn.coo
	cowlink-8080.nncgen.exe -o rpn.asm /usr/local/share/cowgol/rt/cpmz/cowgol.coo rpn.coo
	zmac -j -m -z -o rpn.cim rpn.asm
	rm -f rpn.cob rpn.coo rpn.asm

clean:
	rm -f bfc bin2hex cat dis8080 hexdump rpn

clean-8080:
	rm -f bfc.com bin2hex.com cat.com dis8080.com hexdump.com rpn.com

clean-z80:
	rm -f bfc.cim bin2hex.cim cat.cim dis8080.cim hexdump.cim rpn.cim

clean-all: clean clean-8080 clean-z80
