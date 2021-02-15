/*
 * Copyright 2013-2021 Robert Newgard
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

#ifndef _TB_H_
    #define _TB_H_

    #include <systemc>
    #include <SyscMsg.h>
    #include <SyscDrv.h>
    #include <SyscClk.h>
    #include <SyscFCBus.h>
    #include <Vuut_512_top.h>

    namespace tb_512
    {
        using namespace std;
        using namespace sc_core;
        using namespace sc_dt;
        using namespace SyscMsg;
        using namespace SyscDrv;
        using namespace SyscClk;
        using namespace SyscFCBus;

        constexpr unsigned be  = 6;

        class Checker : public sc_module
        {
            private:
                unique_ptr<Msg> msg;
                uint32_t        max_size;
                bool            done;

            public:
                SC_HAS_PROCESS(Checker);
                Checker(sc_module_name);
                ~Checker(void);

                bool pass;

                sc_in  <uint32_t> res_i;
                sc_in  <uint32_t> exp_i;
                sc_in  <uint32_t> obs_i;
                sc_in  <uint32_t> len_i;
                sc_in  <bool>     val_i;
                sc_in  <bool>     clk_i;

                void check(void);
                void set_max_size(uint32_t);
                bool is_done(void);
        };

        class tb : public sc_module
        {
            protected:
                double            clk_freq_hz;
                string            drv_path;
                string            drv_handler;
                string            drv_request;
                unique_ptr<Msg>   msg;
                DrvClient       * drv;

            public:
                SC_HAS_PROCESS(tb);
                tb(sc_module_name);
                ~tb(void);

                Vuut_512_top  * i_uut;
                Clk<bool>     * i_clk;
                Bus_src<be>   * i_bus;
                Checker       * i_chk;
                Bus_split<be> * i_lys;

                sc_signal <bool    > tb_clk;
                sc_signal <bool    > tb_rdy;

                sc_signal <bool    > chk_end;

                sc_signal <uint32_t> uut_res;
                sc_signal <uint32_t> uut_exp;
                sc_signal <uint32_t> uut_obs;
                sc_signal <uint32_t> uut_len;
                sc_signal <bool    > uut_val;

                sc_signal <bool    > bus_sav;
                sc_signal <bool    > bus_req;
                sc_signal <uint32_t> bus_cnt;
                sc_signal <Bus<be>>  bus_bus;

                sc_signal <uint32_t> lys_usr;
                sc_signal <bool>     lys_err;
                sc_signal <bool>     lys_val;
                sc_signal <bool>     lys_sof;
                sc_signal <bool>     lys_eof;
                sc_signal <Mod<be>>  lys_mod;
                sc_signal <Dat<be>>  lys_dat;
        };
    }
#endif
