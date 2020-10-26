# Makefile - Main build script
#
#  Copyright (c) <year>, <author(s)-name>  <email(s)>
#  This file is part of <project>
#  <project> is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

bin = main			# The main target (binary file)
objects = main.o		# Objects coprising the main binary

CC = gcc			# The compiler
CPP_FLAGS = -Wall		# Project flags for preprocessor
C_FLAGS = -g			# Project flags for compiler
LD_FLAGS = 			# Project flags for linker
PREFIX=				# Install prefix

# This Make files implements the following rules
#
# make			build everyting (default rule)
# make clean		undo what was created during build
# install		install binary under $(PREFIX)/usr/bin
# unstall		remove installed files

# Rule implementation

all: $(bin)

$(bin) : $(objects)
	$(CC) $(LD_FLAGS) $(LDFLAGS) $^ -o $@

%.o : %.c
	$(CC) $(CPP_FLAGS) $(C_FLAGS) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

.PHONY: clean install uninstall

clean:
	rm -f $(bin) $(objects)

install:
	mkdir -p $(PREFIX)/usr/bin
	cp $(bin) $(PREFIX)/usr/bin/

uninstall:
	rm -f $(PREFIX)/usr/bin/$(bin)

