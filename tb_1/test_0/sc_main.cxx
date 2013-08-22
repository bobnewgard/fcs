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

#include <test.h>
#include <verilated_vcd_sc.h>

int sc_main(int argc, char **argv)
{
    Verilated::commandArgs(argc, argv);
    Verilated::debug(0);
    Verilated::traceEverOn(true);

    tb_1::test test_0("test_0");

    try
    {
        test_0.drive_elaboration();
        test_0.setup_trace();
        test_0.drive_execution(sc_time(1400, SC_NS));
        test_0.cleanup();
    }
    catch(...)
    {
        cerr << "[ERR] sc_main() caught an exception" << endl << flush;
    }

    return 0;
}
