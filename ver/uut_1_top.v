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

`timescale 1ns / 1ps

module uut_1_top
(
    output wire [31:0] res_o,
    output wire [31:0] exp_o,
    output wire [31:0] obs_o,
    output wire        val_o,

    input  wire [7:0]  data_i,
    input  wire        sof_i,
    input  wire        eof_i,

    input  wire        bstb_i,
    input  wire        bclk_i,

    input  wire        pclk_i
);
    /* -----------------------------------------------------------
       parameters
    ------------------------------------------------------------*/

    /* -----------------------------------------------------------
      net declarations
    ------------------------------------------------------------*/
    reg  [31:0]  bytep_data;
    reg          bytep_sof;

    reg  [31:0]  bitp_res;
    reg  [31:0]  bitp_exp;
    reg  [31:0]  bitp_obs;
    reg          bitp_val;

    /* -----------------------------------------------------------
      input assignments
    ------------------------------------------------------------*/

    /* -----------------------------------------------------------
       Pipeline
    ------------------------------------------------------------*/

    /* -----------------------------------------------------------
       component module instantiation
    ------------------------------------------------------------*/
    uut_1_bytep i_bytep
    (
        .data_o(bytep_data[31:0]),
        .sof_o(bytep_sof),
        .data_i(data_i[7:0]),
        .sof_i(sof_i),
        .pclk_i(pclk_i)
    );

    uut_1_bitp i_bitp
    (
        .res_o(bitp_res[31:0]),
        .exp_o(bitp_exp[31:0]),
        .obs_o(bitp_obs[31:0]),
        .val_o(bitp_val),
        .data_i(bytep_data[31:0]),
        .sof_i(bytep_sof),
        .eof_i(eof_i),
        .bstb_i(bstb_i),
        .bclk_i(bclk_i)
    );

    /* -----------------------------------------------------------
       output assignments
    ------------------------------------------------------------*/
    always @ (*) begin
        res_o[31:0] = bitp_res[31:0];
        exp_o[31:0] = bitp_exp[31:0];
        obs_o[31:0] = bitp_obs[31:0];
        val_o       = bitp_val;
    end
endmodule
