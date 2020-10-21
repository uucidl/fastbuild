## Bootstrapping FASTbuild on Linux/ARM
#
# Index:
# :/^SRC/  Where all the sources are defined.

include cflags.mk

DEST=tmp/bootstrap

vpath %.cpp .
vpath %.c .

all: all_obj all_bin
.PHONY: all

clean:
	rm -f $(OBJ) $(BIN)
.PHONY: clean

include lz4.mk
$(LZ4_OBJ): lz4.mk

include core.mk
$(CORE_OBJ): core.mk

include coretest.mk
$(CORETEST_OBJ): coretest.mk

include testframework.mk
$(TESTFRAMEWORK_OBJ): testframework.mk

include osui.mk
$(OSUI_OBJ): osui.mk

include fbuildcore.mk
$(FBUILDCORE_OBJ): fbuildcore.mk

include fbuildapp.mk
$(FBUILDAPP_OBJ): fbuildapp.mk

include fbuildworker.mk
$(FBUILDWORKER_OBJ): fbuildworker.mk

SRC:=$(LZ4_SRC)
OBJ:=$(LZ4_OBJ) $(CORE_OBJ) $(OSUI_OBJ) $(FBUILDCORE_OBJ)
$(OBJ): cflags.mk
$(FBUILDAPP_OBJ): cflags.mk
$(FBUILDWORKER_OBJ): cflags.mk

BIN:=fbuild fbuildworker $(if $(findstring DEBUG,$(config)),coretest,)

all_obj: $(OBJ)
.PHONY: all_obj

all_bin: $(BIN)
.PHONY: all_bin

coretest: $(CORE_OBJ) $(LZ4_OBJ) $(CORETEST_OBJ) $(TESTFRAMEWORK_OBJ)
	  $(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^ -lrt -lpthread

fbuild: $(OBJ) $(FBUILDAPP_OBJ)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^ -lrt -lpthread -ldl

fbuildworker: $(FBUILDWORKER_OBJ) $(CORE_OBJ) $(FBUILDCORE_OBJ) $(LZ4_OBJ) $(OSUI_OBJ)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^ -lrt -lpthread -ldl

$(DEST)/%.o: %.c
	mkdir -p $$(dirname $@)
	 $(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(DEST)/%.o: %.cpp
	mkdir -p $$(dirname $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

