# Directions for building the website:
#
# 1. Clone the Tor git repository and make TORGIT point to it:
#
# 	git clone git://git.torproject.org/tor/ tor.git
#
#    Note that you will need to point to the actual .git directory.
# 2. Edit include/versions.wmi or others if you like
# 3. Update STABLETAG and DEVTAG below if there is a new git tag
# 4. make
# 5. ./publish

export TORGIT=set this to your tor.git path
export STABLETAG=tor-0.2.2.34
export DEVTAG=tor-0.2.3.7-alpha

WMLBASE=.
SUBDIRS=docs eff projects press about download getinvolved donate torbutton

include $(WMLBASE)/Makefile.common
all: $(SUBDIRS)

docs:
	$(MAKE) -C "$@" WMLBASE=..
eff:
	$(MAKE) -C "$@" WMLBASE=..
projects:
	$(MAKE) -C "$@" WMLBASE=..
press:
	$(MAKE) -C "$@" WMLBASE=..
about:
	$(MAKE) -C "$@" WMLBASE=.. 
download:
	$(MAKE) -C "$@" WMLBASE=.. 
getinvolved:
	$(MAKE) -C "$@" WMLBASE=.. 
donate:
	$(MAKE) -C "$@" WMLBASE=..  
torbutton:
	$(MAKE) -C "$@" WMLBASE=..  
mirrors:
	./update-mirrors.pl
translations:
	./po2wml.sh
qrcode:
	qrencode -o $(IMGROOT)/android/orbot-qr-code-latest.png \
    "https://www.torproject.org/dist/android/alpha-orbot-latest.apk"

# XXX: this also depends on all subs' wmlfiles.  How to fix?
#translation-status.html.en: $(LANGS) $(WMIFILES) $(WMLFILES)

.PHONY: docs eff projects press about download getinvolved donate torbutton
