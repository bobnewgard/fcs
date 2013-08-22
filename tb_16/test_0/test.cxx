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

namespace tb_16
{
    test::test(sc_module_name nm) : tb(nm)
    {
        this->tf  = sc_create_vcd_trace_file("test");

        sc_trace(this->tf, this->tb_clk,               "tb_clk"              );
        sc_trace(this->tf, this->uut_exp,              "uut_exp"             );
        sc_trace(this->tf, this->uut_obs,              "uut_obs"             );
        sc_trace(this->tf, this->uut_val,              "uut_val"             );
        sc_trace(this->tf, this->i_chk->pass,          "i_chk.pass"          );
        sc_trace(this->tf, this->lys_dat,              "lys_dat"             );
        sc_trace(this->tf, this->lys_sof,              "lys_sof"             );
        sc_trace(this->tf, this->lys_eof,              "lys_eof"             );
        sc_trace(this->tf, this->lys_val,              "lys_val"             );
        sc_trace(this->tf, this->tb_rdy,               "tb_rdy"              );
        sc_trace(this->tf, this->bus_sav,              "bus_sav"             );
        sc_trace(this->tf, this->bus_cnt,              "bus_cnt"             );
        sc_trace(this->tf, this->bus_req,              "bus_req"             );
        sc_trace(this->tf, this->i_bus->drv_s,         "i_bus.drv_s"         );

        return;
    }

    test::~test(void)
    {
         sc_close_vcd_trace_file(this->tf);
    }

    void
    test::drive_execution(sc_time time_stop)
    {
        this->msg->report_inf("Executing...");

        while ((sc_time_stamp() < time_stop) && (!Verilated::gotFinish()))
        {
            sc_start(1, SC_NS); 
        }

        this->msg->report_inf("Cleanup...");
    }

    void
    test::drive_elaboration(void)
    {
        this->msg->report_inf("Elaborating...");

        sc_start(1, SC_NS);
    }

    void
    test::setup_trace(void)
    {
        this->tfp = new VerilatedVcdSc;
        this->i_uut->trace(tfp, 99);
        this->tfp->open("vlt.vcd");
        return;
    }

    void
    test::cleanup(void)
    {
        this->i_uut->final();
        this->tfp->close();
        delete tfp;

        if (this->i_chk->pass)
        {
            this->msg->report_inf("Stopped; FCS check OK.");
        }
        else
        {
            this->msg->report_inf("Stopped; FCS check FAIL.");
        }

        return;
    }
}
