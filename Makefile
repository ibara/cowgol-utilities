# Convenience Makefile

# This Makefile requires my OpenBSD port of Cowgol.

# The port includes a native compiler wrapper named
# cowgolc, which runs cowfe-cgen through cowlink-cgen
# as well as the C compiler.

all: bfc bin2hex cowdis hexdump

all-8080: bfc-8080 bin2hex-8080 cowdis-8080 hexdump-8080

bfc:
	cowgolc bfc.cow

bfc-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ bfc.cow bfc.cob
	cowbe-8080.nncgen.exe bfc.cob bfc.coo
	cowlink-8080.nncgen.exe -o bfc.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo bfc.coo
	cowasm-8080.nncgen.exe -o bfc.com bfc.asm
	rm -f bfc.cob bfc.coo bfc.asm

bin2hex:
	cowgolc bin2hex.cow

bin2hex-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ bin2hex.cow bin2hex.cob
	cowbe-8080.nncgen.exe bin2hex.cob bin2hex.coo
	cowlink-8080.nncgen.exe -o bin2hex.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo bin2hex.coo
	cowasm-8080.nncgen.exe -o bin2hex.com bin2hex.asm
	rm -f bin2hex.cob bin2hex.coo bin2hex.asm

cowdis:
	cowgolc cowdis.cow

cowdis-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ cowdis.cow cowdis.cob
	cowbe-8080.nncgen.exe cowdis.cob cowdis.coo
	cowlink-8080.nncgen.exe -o cowdis.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo cowdis.coo
	cowasm-8080.nncgen.exe -o cowdis.com cowdis.asm
	rm -f cowdis.cob cowdis.coo cowdis.asm

hexdump:
	cowgolc hexdump.cow

hexdump-8080:
	cowfe-8080.nncgen.exe -I/usr/local/share/cowgol/rt/ -I/usr/local/share/cowgol/rt/cpm/ hexdump.cow hexdump.cob
	cowbe-8080.nncgen.exe hexdump.cob hexdump.coo
	cowlink-8080.nncgen.exe -o hexdump.asm /usr/local/share/cowgol/rt/cpm/cowgol.coo hexdump.coo
	cowasm-8080.nncgen.exe -o hexdump.com hexdump.asm
	rm -f hexdump.cob hexdump.coo hexdump.asm

clean:
	rm -f bfc bin2hex cowdis hexdump

clean-8080:
	rm -f bfc.com bin2hex.com cowdis.com hexdump.com

clean-all: clean clean-8080
