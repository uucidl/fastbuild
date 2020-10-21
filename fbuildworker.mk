FBUILDWORKER_ROOT:=Code/Tools/FBuild/FBuildWorker
FBUILDWORKER_SRC:=$(foreach Dir,. Worker,$(wildcard $(FBUILDWORKER_ROOT)/$(Dir)/*.cpp))
FBUILDWORKER_OBJ:=$(addprefix $(DEST)/,$(patsubst %.cpp,%.o,$(FBUILDWORKER_SRC)))

-include $(patsubst %.o,%.d,$(FBUILDWORKER_OBJ))
