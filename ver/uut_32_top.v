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

`timescale 1ns / 1ps
`include "fcs32_32.v"
`include "fcs32_brev.v"

module uut_32_top
(
    output wire [31:0] res_o,
    output wire [31:0] exp_o,
    output wire [31:0] obs_o,
    output wire        val_o,

    input  wire [31:0] data_i,
    input  wire        sof_i,
    input  wire        eof_i,

    input  wire        pclk_i
);
    /* -----------------------------------------------------------
       parameters
    ------------------------------------------------------------*/
    localparam         LO                = 1'b0;
    localparam         HI                = 1'b1;
    localparam [31:0]  ZEROS             = {32{LO}};
    localparam [31:0]  ONES              = {32{HI}};

    /* -----------------------------------------------------------
      net declarations
    ------------------------------------------------------------*/
    reg  [31:0]  data_z1;
    reg          sof_z1;

    reg  [31:0]  exp_z2;
    reg  [31:0]  fcs_z2;
    reg          val_z2;

    reg          val_z3;
    reg  [31:0]  exp_z3;
    reg  [31:0]  fcs_z3;

    /* -----------------------------------------------------------
      input assignments
    ------------------------------------------------------------*/

    /* -----------------------------------------------------------
       Pipeline
    ------------------------------------------------------------*/
    always @ (posedge pclk_i) begin
        data_z1[31:0] <= data_i[31:0];
        sof_z1        <= sof_i;

        val_z2        <= eof_i;

        if (eof_i == HI) begin
            exp_z2[31:0] <= data_i[31:0];
        end

        if (sof_z1 == HI) begin
            fcs_z2[31:0] <= fcs32_32(data_z1[31:0], ONES[31:0]);
        end else begin
            fcs_z2[31:0] <= fcs32_32(data_z1[31:0], fcs_z2[31:0]);
        end

        val_z3       <= val_z2;
        exp_z3[31:0] <= exp_z2[31:0];
        fcs_z3[31:0] <= fcs32_brev(fcs_z2[31:0]);
    end

    /* -----------------------------------------------------------
       output assignments
    ------------------------------------------------------------*/
    always @ (*) begin
        val_o       = val_z3;
        res_o[31:0] = fcs_z2[31:0];
        exp_o[31:0] = exp_z3[31:0];
        obs_o[31:0] = fcs_z3[31:0];
    end
endmodule
