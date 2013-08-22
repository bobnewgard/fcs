#
# Copyright 2013 Robert Newgard
#
# This file is part of fcs.
#
# fcs is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# fcs is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with fcs.  If not, see <http://www.gnu.org/licenses/>.
#

SYSCMAKE  := ../../SyscMake

include $(SYSCMAKE)/vars.mk

ACCUM_BLD_LIBS         +=
ACCUM_CPP_INCLUDES     +=
ACCUM_CPP_OPTS         +=
ACCUM_INTERMEDIATE     +=
ACCUM_LINKER_LIBS      +=
ACCUM_LINKER_LIB_DIRS  +=
ACCUM_PHONY_TARGS      +=
ACCUM_PREREQ_BLD       +=
ACCUM_PREREQ_CLEAN     +=
ACCUM_PREREQ_HELP      +=
ACCUM_PREREQ_LIB       +=
ACCUM_PREREQ_SIM       +=
ACCUM_PYTHONPATH       +=
ACCUM_SIM_LIB_DIRS     +=
ACCUM_VLTR_OPTS        +=

define lib-source
        tb.cxx
endef
LIB_SRC := $(strip $(lib-source))

# accumulate header specifications here
#------------|------- build-process -|------- hdr-dir ------------|
$(eval $(call $(strip hdr-spec      ),$(strip ../../SyscClk   )))
$(eval $(call $(strip hdr-spec      ),$(strip ../../SyscFCBus )))
$(eval $(call $(strip hdr-spec      ),$(strip $(VLTR_IDIR)       )))

# accumulate library specifications here
#------------|------- build-process -|------- lib-dir ------------|------- lib-name -------|
$(eval $(call $(strip lib-spec      ),$(strip ../../SyscMsg   ),$(strip syscmsg      )))
$(eval $(call $(strip lib-spec      ),$(strip ../../SyscDrv   ),$(strip syscdrv      )))
$(eval $(call $(strip lib-spec      ),$(strip ../../SyscJson  ),$(strip syscjson     )))
$(eval $(call $(strip lib-spec      ),$(strip ../ver/obj_dir  ),$(strip uut32        )))

# instantiate build process libraries here
#------------|------- build-process -|------- lib-name -|------- sources --------|
$(eval $(call $(strip build-sysc-lib),$(strip tb32     ),$(strip $(LIB_SRC)     )))

include $(SYSCMAKE)/targ.mk

# add auxiliary targets for testbench here, if needed

