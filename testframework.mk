TESTFRAMEWORK_ROOT:=Code/TestFramework
TESTFRAMEWORK_SRC:=$(wildcard $(TESTFRAMEWORK_ROOT)/*.cpp)
TESTFRAMEWORK_OBJ:=$(addprefix $(DEST)/,$(patsubst %.cpp,%.o,$(TESTFRAMEWORK_SRC)))

-include $(patsubst %.o,%.d,$(TESTFRAMEWORK_OBJ))
