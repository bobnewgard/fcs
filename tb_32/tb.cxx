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

#include <iomanip>
#include <tb.h>

namespace tb_32
{
    using namespace SyscMsg::Chars;

    static uint32_t FCS_RESIDUE = 0xC704DD7B;

    Checker::Checker(sc_module_name arg_nm)
    {
        this->msg  = unique_ptr<Msg>(new Msg(this->name()));
        this->pass = true;

        SC_CTHREAD(check, this->clk_i.neg());
    }

    Checker::~Checker(void) { }

    void
    Checker::check(void)
    {
        uint32_t sig_res = 0;
        uint32_t sig_exp = 0;
        uint32_t sig_obs = 0;
        bool     sig_val = false;

        while (true)
        {
            wait();

            sig_res = this->res_i;
            sig_exp = this->exp_i;
            sig_obs = this->obs_i;
            sig_val = this->val_i;

            if (!sig_val)
            {
                continue;
            }

            if (false)
            {
                ostringstream os;
                os << "exp:";
                os << SP << hex << setfill('0') << uppercase << setw(8) << sig_exp;
                os << SP << "obs:" << SP << hex << setfill('0') << uppercase << setw(8) << sig_obs;
                os << SP << "res:" << SP << hex << setfill('0') << uppercase << setw(8) << sig_res;
                this->msg->report_inf(os.str());
            }

            if (sig_obs != sig_exp)
            {
                ostringstream os;
                os << "MISMATCH: expected FCS is" << SP << hex << setfill('0') << uppercase << setw(8) << sig_exp;
                os << "; observed is" << SP << hex << setfill('0') << uppercase << setw(8) << sig_obs;
                this->msg->report_inf(os.str());
                this->pass = false;
            }

            if (sig_res != FCS_RESIDUE)
            {
                ostringstream os;
                os << "MISMATCH: expected FCS residue is" << SP << hex << setfill('0') << uppercase << setw(8) << FCS_RESIDUE;
                os << "; observed is" << SP << hex << setfill('0') << uppercase << setw(8) << sig_res;
                this->msg->report_inf(os.str());
                this->pass = false;
            }
        }
    }

    tb::tb(sc_module_name arg_nm)
    {
        this->clk_freq_hz = 156.250e6;
        this->drv_path    = "./pydrv32.py";
        this->drv_handler = "dot3_by_len";
        this->drv_request = "{\"size\":70}";
        this->msg         = unique_ptr<Msg>(new Msg(this->name()));
        this->drv         = new DrvClient(this->drv_path);

        this->i_clk = new Clk<bool>("i_clk", this->clk_freq_hz, 0.5, 1.0, SC_NS, true);
        this->i_uut = new Vuut_32_top("i_uut");
        this->i_bus = new Bus_src<be>("i_bus", this->drv, this->drv_handler, this->drv_request);
        this->i_chk = new Checker("i_chk");
        this->i_shm = new Bus_split<be>("i_shm");

        this->tb_clk   = true;
        this->tb_rdy   = true;

        this->i_clk->clk_o  ( tb_clk  );

        this->i_uut->pclk_i ( tb_clk  );
        this->i_uut->data_i ( shm_dat );
        this->i_uut->sof_i  ( shm_sof );
        this->i_uut->eof_i  ( shm_eof );
        this->i_uut->res_o  ( uut_res );
        this->i_uut->exp_o  ( uut_exp );
        this->i_uut->obs_o  ( uut_obs );
        this->i_uut->val_o  ( uut_val );

        this->i_chk->res_i  ( uut_res );
        this->i_chk->exp_i  ( uut_exp );
        this->i_chk->obs_i  ( uut_obs );
        this->i_chk->val_i  ( uut_val );
        this->i_chk->clk_i  ( tb_clk  );

        this->i_bus->bus_o  ( bus_bus );
        this->i_bus->sav_o  ( bus_sav );
        this->i_bus->dav_i  ( tb_rdy  );
        this->i_bus->cnt_o  ( bus_cnt );
        this->i_bus->req_o  ( bus_req );
        this->i_bus->ack_i  ( bus_req );
        this->i_bus->clk_i  ( tb_clk  );

        this->i_shm->usr_o  ( shm_usr );
        this->i_shm->err_o  ( shm_err );
        this->i_shm->val_o  ( shm_val );
        this->i_shm->sof_o  ( shm_sof );
        this->i_shm->eof_o  ( shm_eof );
        this->i_shm->mod_o  ( shm_mod );
        this->i_shm->dat_o  ( shm_dat );
        this->i_shm->bus_i  ( bus_bus );
    }

    tb::~tb(void)
    {
        delete this->i_shm;
        delete this->i_chk;
        delete this->i_bus;
        delete this->i_uut;
        delete this->i_clk;
        delete this->drv;
    }
}
