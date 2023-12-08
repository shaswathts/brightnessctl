VERSION = 0.5

all: brightnessctl

brightnessctl.o: brightnessctl.c
	$(CC) $(CCFLAGS) -c brightnessctl.c

brightnessctl: brightnessctl.o
	$(CC) $(LDFLAGS) brightnessctl.o -o brightnessctl

clean:
	rm -f brightnessctl

.PHONY: all clean
