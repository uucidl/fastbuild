LZ4_BASE_PATH:=External/LZ4/lz4-1.9.2/lib/
LZ4_CFLAGS:=-O2
LZ4_SRC:=$(addprefix $(LZ4_BASE_PATH),lz4.c lz4hc.c xxhash.c)
LZ4_OBJ:=$(addprefix $(DEST)/,$(patsubst %.c,%.o,$(LZ4_SRC)))

LZ4_INCLUDE_DIR:=$(LZ4_BASE_PATH)

$(LZ4_OBJ): CFLAGS+=$(LZ4_CFLAGS)

-include $(patsubst %.o,%.d,$(LZ4_OBJ))
