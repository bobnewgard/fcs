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

define uut1-source
    uut_1_top.v
    uut_1_bitp.v
    uut_1_bytep.v
endef
UUT1_SRC := $(strip $(uut1-source))

# instantiate library build processes here
#------------|------- build-process -|------- name -----|------- sources --------|
$(eval $(call $(strip build-ver-lib ),$(strip uut16   ),$(strip uut_16_top.v   )))
$(eval $(call $(strip build-ver-lib ),$(strip uut1    ),$(strip $(UUT1_SRC)    )))
$(eval $(call $(strip build-ver-lib ),$(strip uut32   ),$(strip uut_32_top.v   )))
$(eval $(call $(strip build-ver-lib ),$(strip uut512  ),$(strip uut_512_top.v  )))
$(eval $(call $(strip build-ver-lib ),$(strip uut8    ),$(strip uut_8_top.v    )))

include $(SYSCMAKE)/targ.mk
