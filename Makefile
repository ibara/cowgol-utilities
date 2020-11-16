# Convenience Makefile

# This Makefile requires my OpenBSD port of Cowgol.

# The port includes a native compiler wrapper named
# cowgolc, which runs cowfe-cgen through cowlink-cgen
# as well as the C compiler.

all: bfc bin2hex cowdis hexdump

bfc:
	cowgolc bfc.cow

bin2hex:
	cowgolc bin2hex.cow

cowdis:
	cowgolc cowdis.cow

hexdump:
	cowgolc hexdump.cow

clean:
	rm -f bfc bin2hex cowdis hexdump
