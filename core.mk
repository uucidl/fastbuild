CORE_ROOT:=Code/Core
CORE_CXXFLAGS:=-ICode/
CORE_SRC:=$(foreach Dir,Env FileIO Math Mem Network Process Profile Reflection Reflection/MetaData Strings Time Tracing,$(wildcard $(CORE_ROOT)/$(Dir)/*.cpp))
CORE_OBJ:=$(addprefix $(DEST)/,$(patsubst %.cpp,%.o,$(CORE_SRC)))

$(CORE_OBJ): CXXFLAGS+=$(CORE_CXXFLAGS)

-include $(patsubst %.o,%.d,$(CORE_OBJ))

