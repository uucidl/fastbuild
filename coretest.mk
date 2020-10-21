CORETEST_ROOT:=Code/Core/CoreTest
CORETEST_CXXFLAGS:=-ICode -Wno-invalid-offsetof
CORETEST_SRC:=$(wildcard $(CORETEST_ROOT)/Tests/*.cpp) $(CORETEST_ROOT)/TestMain.cpp
CORETEST_OBJ:=$(addprefix $(DEST)/,$(patsubst %.cpp,%.o,$(CORETEST_SRC)))

$(CORETEST_OBJ): CXXFLAGS+=$(CORETEST_CXXFLAGS)

-include $(patsubst %.o,%.d,$(CORETEST_OBJ))

