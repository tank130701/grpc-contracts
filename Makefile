# # Makefile для генерации protofile

# # Компилятор Protocol Buffers
# PROTOC = protoc

# # Директория с исходными файлами .proto
# PROTO_SRC_DIR = ./join-requests-bot-service

# # Директория для сохранения сгенерированных файлов
# PROTO_GEN_DIR = ./gen

# # Список всех .proto файлов в директории
# PROTO_FILES = $(wildcard $(PROTO_SRC_DIR)/*.proto)

# # Сгенерированные файлы .pb.cc и .pb.h
# PROTO_OUT_FILES = $(patsubst $(PROTO_SRC_DIR)/%.proto,$(PROTO_GEN_DIR)/%.pb.cc,$(PROTO_FILES)) \
#                  $(patsubst $(PROTO_SRC_DIR)/%.proto,$(PROTO_GEN_DIR)/%.pb.h,$(PROTO_FILES))

# # Правило для генерации файлов .pb.cc и .pb.h
# $(PROTO_GEN_DIR)/%.pb.cc $(PROTO_GEN_DIR)/%.pb.h: $(PROTO_SRC_DIR)/%.proto
#     $(PROTOC) --cpp_out=$(PROTO_GEN_DIR) $<

# # Цель по умолчанию - генерация всех .proto файлов
# all: $(PROTO_OUT_FILES)

# # Чистка сгенерированных файлов
# clean:
#     rm -f $(PROTO_GEN_DIR)/*.pb.cc $(PROTO_GEN_DIR)/*.pb.h

# .PHONY: all clean
PROTO_SRC_DIRS = ./join-requests-bot-service/model ./join-requests-bot-service/service
PROTO_FILES = $(foreach dir, $(PROTO_SRC_DIRS), $(wildcard $(dir)/*.proto))

GEN_DIR = ./gen

gene:
	protoc --proto_path=$(PROTO_SRC_DIRS) \
		--cpp_out=$(GEN_DIR)/cpp --java_out=$(GEN_DIR)/java \
		--python_out=$(GEN_DIR)/python --go_out=$(GEN_DIR)/go \
		--ruby_out=$(GEN_DIR)/ruby --objc_out=$(GEN_DIR)/objc \
		--csharp_out=$(GEN_DIR)/csharp $(PROTO_FILES)
# PROTO_FILES = $(foreach dir, $(PROTO_SRC_DIRS), $(wildcard $(dir)/*.proto))
# gene:
# 	protoc --proto_path=./join-requests-bot-service --cpp_out=./gen/cpp --java_out=./gen/java \
# 	 --python_out=./gen/python --go_out=./gen/go --ruby_out=./gen/ruby --objc_out=./gen/objc\
# 	 --csharp_out=./gen/csharp ./join-requests-bot-service/model/user.proto