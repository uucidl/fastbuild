FBUILDCORE_ROOT:=Code/Tools/FBuild/FBuildCore
FBUILDCORE_SRC:=$(wildcard $(FBUILDCORE_ROOT)/*.cpp) $(foreach Dir,BFF BFF/Tokenizer BFF/Functions Cache Graph Graph/MetaData Helpers Protocol WorkerPool,$(wildcard $(FBUILDCORE_ROOT)/$(Dir)/*.cpp))
FBUILDCORE_OBJ:=$(addprefix $(DEST)/,$(patsubst %.cpp,%.o,$(FBUILDCORE_SRC)))

$(FBUILDCORE_OBJ): CXXFLAGS+=-Wno-invalid-offsetof -I$(LZ4_INCLUDE_DIR)

-include $(patsubst %.o,%.d,$(FBUILDCORE_OBJ))
