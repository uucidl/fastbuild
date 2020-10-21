config=RELEASE

CPPFLAGS+=-ICode/
CPPFLAGS+=-D$(config)

OPTS:=-O2 -g
CFLAGS+=-MMD -MF $(DEST)/$*.d $(OPTS)
CXXFLAGS+=-MMD -MF $(DEST)/$*.d $(OPTS)

## For later (does not seem to work well due to issues with operator delete/new)
#CFLAGS+=-fsanitize=address -fno-omit-frame-pointer
#LDFLAGS+=-fsanitize=address
CXXFLAGS+=-fsanitize=address
LDFLAGS+=-fsanitize=address
CXXFLAGS+=-fsanitize=undefined
CXXFLAGS+=-fsanitize=undefined
