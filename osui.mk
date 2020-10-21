OSUI_ROOT:=Code/OSUI
OSUI_SRC:=$(wildcard $(OSUI_ROOT)/*.cpp)
OSUI_OBJ:=$(addprefix $(DEST)/,$(patsubst %.cpp,%.o,$(OSUI_SRC)))

-include $(patsubst %.o,%.d,$(OSUI_OBJ))
