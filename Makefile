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

SYSCMAKE  := ../SyscMake

include $(SYSCMAKE)/vars.mk

ACCUM_PREREQ_CLEAN += dox-clean ver-clean

HELP := dox-help wav5120-help vlt5120-help

# accumulate library targets here
#------------|------- build-process ----|------- lib-dir ------------|------- lib-name -------|
$(eval $(call $(strip root-lib-targets ),$(strip ver                ),$(strip uut1         )))
$(eval $(call $(strip root-lib-targets ),$(strip ver                ),$(strip uut8         )))
$(eval $(call $(strip root-lib-targets ),$(strip ver                ),$(strip uut16        )))
$(eval $(call $(strip root-lib-targets ),$(strip ver                ),$(strip uut32        )))
$(eval $(call $(strip root-lib-targets ),$(strip ver                ),$(strip uut512       )))
$(eval $(call $(strip root-lib-targets ),$(strip tb_1               ),$(strip tb1          )))
$(eval $(call $(strip root-lib-targets ),$(strip tb_1/test_0        ),$(strip test10       )))
$(eval $(call $(strip root-lib-targets ),$(strip tb_8               ),$(strip tb8          )))
$(eval $(call $(strip root-lib-targets ),$(strip tb_8/test_0        ),$(strip test80       )))
$(eval $(call $(strip root-lib-targets ),$(strip tb_16              ),$(strip tb16         )))
$(eval $(call $(strip root-lib-targets ),$(strip tb_16/test_0       ),$(strip test160      )))
$(eval $(call $(strip root-lib-targets ),$(strip tb_32              ),$(strip tb32         )))
$(eval $(call $(strip root-lib-targets ),$(strip tb_32/test_0       ),$(strip test320      )))
$(eval $(call $(strip root-lib-targets ),$(strip tb_512             ),$(strip tb512        )))
$(eval $(call $(strip root-lib-targets ),$(strip tb_512/test_0      ),$(strip test5120     )))

# accumulate build dependencies here
#------------|------- build-process -|------- exe-name -----------|------- lib-name -------|
$(eval $(call $(strip root-exe-deps ),$(strip exe10              ),$(strip uut1         )))
$(eval $(call $(strip root-exe-deps ),$(strip exe10              ),$(strip tb1          )))
$(eval $(call $(strip root-exe-deps ),$(strip exe10              ),$(strip test10       )))
$(eval $(call $(strip root-exe-deps ),$(strip exe80              ),$(strip uut8         )))
$(eval $(call $(strip root-exe-deps ),$(strip exe80              ),$(strip tb8          )))
$(eval $(call $(strip root-exe-deps ),$(strip exe80              ),$(strip test80       )))
$(eval $(call $(strip root-exe-deps ),$(strip exe160             ),$(strip uut16        )))
$(eval $(call $(strip root-exe-deps ),$(strip exe160             ),$(strip tb16         )))
$(eval $(call $(strip root-exe-deps ),$(strip exe160             ),$(strip test160      )))
$(eval $(call $(strip root-exe-deps ),$(strip exe320             ),$(strip uut32        )))
$(eval $(call $(strip root-exe-deps ),$(strip exe320             ),$(strip tb32         )))
$(eval $(call $(strip root-exe-deps ),$(strip exe320             ),$(strip test320      )))
$(eval $(call $(strip root-exe-deps ),$(strip exe5120            ),$(strip uut512       )))
$(eval $(call $(strip root-exe-deps ),$(strip exe5120            ),$(strip tb512        )))
$(eval $(call $(strip root-exe-deps ),$(strip exe5120            ),$(strip test5120     )))

# accumulate executable targets here
#------------|------- build-process ----|------- exe-dir ------------|------- exe-name -------|
$(eval $(call $(strip root-exe-targets ),$(strip tb_1/test_0        ),$(strip exe10        )))
$(eval $(call $(strip root-exe-targets ),$(strip tb_8/test_0        ),$(strip exe80        )))
$(eval $(call $(strip root-exe-targets ),$(strip tb_16/test_0       ),$(strip exe160       )))
$(eval $(call $(strip root-exe-targets ),$(strip tb_32/test_0       ),$(strip exe320       )))
$(eval $(call $(strip root-exe-targets ),$(strip tb_512/test_0      ),$(strip exe5120      )))

# instantiate core targets
$(eval $(root-targets))

# add auxiliary targets here, if needed
define dox
        rm -f Readme.md
        echo "\\mainpage %fcs Project" >> Readme.md
        cat README.md >> Readme.md
        doxygen dox.conf
	cp *.svg doxygen/html/.
endef

help         : $(HELP)  ; $(root-help-core)
dox-help     :          ; $(call root-help-aux,dox,build doxygen)
dox          :          ; $(dox)
dox-clean    :          ; rm -rf doxygen Readme.md
ver-clean    :          ; rm -rf ver/obj_dir
wav5120      :          ; gtkwave tb_512/test_0/test.vcd tb_512/tb.gtkw &> /dev/null &
wav5120-help :          ; $(call root-help-aux,wav5120,run gtkwave on tb_512 results)
vlt5120      :          ; gtkwave tb_512/test_0/vlt.vcd tb_512/test_0/vlt.gtkw &> /dev/null &
vlt5120-help :          ; $(call root-help-aux,vlt5120,run gtkwave on uut_512_top results)

.DEFAULT_GOAL := help
