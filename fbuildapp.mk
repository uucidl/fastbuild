FBUILDAPP_ROOT:=Code/Tools/FBuild/FBuildApp
FBUILDAPP_SRC:=$(wildcard $(FBUILDAPP_ROOT)/*.cpp)
FBUILDAPP_OBJ:=$(addprefix $(DEST)/,$(patsubst %.cpp,%.o,$(FBUILDAPP_SRC)))

#$(FBUILDAPP_OBJ): CXXFLAGS+=-Wno-invalid-offsetof -I$(LZ4_INCLUDE_DIR)

-include $(patsubst %.o,%.d,$(FBUILDAPP_OBJ))
