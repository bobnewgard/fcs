/*
 * Copyright 2013 Robert Newgard
 *
 * This file is part of fcs.
 *
 * fcs is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * fcs is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with fcs.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _TEST_H_
    #define _TEST_H_

    #include <tb.h>
    #include <verilated_vcd_sc.h>

    namespace tb_32
    {
        class test : public tb
        {
            private:
                sc_trace_file  * tf;
                VerilatedVcdSc * tfp;

            public:
                SC_HAS_PROCESS(test);
                test(sc_module_name nm);
                ~test(void);

                void drive_elaboration(void);
                void drive_execution(sc_time);
                void setup_trace(void);
                void cleanup(void);
        };
    }
#endif
