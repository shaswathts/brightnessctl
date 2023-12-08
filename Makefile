include config.mk

VERSION = 0.5
CFLAGS += -std=c99 -g -Wall -Wextra -DVERSION=\"${VERSION}\" -D_POSIX_C_SOURCE=200809L
LDLIBS += -lm

BINDIR = ${DESTDIR}${PREFIX}/bin
MANDIR = ${DESTDIR}${PREFIX}/share/man

INSTALL_UDEV_1 = install_udev_rules

all: brightnessctl brightnessctl.1

config.mk:
	@echo "You need to run ./configure first"
	@exit 1

install: all ${INSTALL_UDEV_${INSTALL_UDEV_RULES}}
	# install -d ${BINDIR} ${MANDIR}/man1
	install -m ${MODE} brightnessctl   ${BINDIR}/
	# install -m ${MODE} brightnessctl.1 ${MANDIR}/man1

install_udev_rules:
	# Performing this in do_install() step.
	# install -d ${DESTDIR}${UDEVDIR}
	# install -m ${MODE} 90-brightnessctl.rules ${DESTDIR}${UDEVDIR}

clean:
	rm -f brightnessctl

distclean: clean
	${RM} config.mk

.PHONY: all install clean distclean install_udev_rules
