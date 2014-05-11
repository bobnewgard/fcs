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
`include "fcs32_8.v"
`include "fcs32_brev.v"

typedef struct packed
{
    logic [31:0] usr;
    logic        err;
    logic        val;
    logic        sof;
    logic        eof;
    logic  [7:0] dat;
    logic        mod;
}
FCBus_8;

FCBus_8 bus = 0;

wire _unused_ok = &{bus};

module uut_8_top
(
    output wire [31:0] res_o,
    output wire [31:0] exp_o,
    output wire [31:0] obs_o,
    output wire        val_o,

    input  wire [7:0]  data_i,
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
    localparam         FIRST             = 7;
    localparam         LAST              = 9;

    /* -----------------------------------------------------------
      net declarations
    ------------------------------------------------------------*/
    reg  [7:0]   data_z1;
    reg          sof_z1;

    reg  [7:0]   data_z2;
    reg          sof_z2;

    reg  [7:0]   data_z3;
    reg          sof_z3;

    reg  [7:0]   data_z4;
    reg          sof_z4;

    reg          val_z5;
    reg  [31:0]  exp_z5;
    reg  [31:0]  fcs_z5;

    reg          val_z6;
    reg  [31:0]  exp_z6;
    reg  [31:0]  fcs_z6;

    reg  [31:0]  exp[FIRST:LAST];
    reg  [31:0]  crc[FIRST:LAST];
    reg          val[FIRST:LAST];

    /* -----------------------------------------------------------
      input assignments
    ------------------------------------------------------------*/

    /* -----------------------------------------------------------
       Pipeline
    ------------------------------------------------------------*/
    always @ (posedge pclk_i) begin
        data_z1[7:0] <= data_i[7:0];
        sof_z1       <= sof_i;

        data_z2[7:0] <= data_z1[7:0];
        sof_z2       <= sof_z1;

        data_z3[7:0] <= data_z2[7:0];
        sof_z3       <= sof_z2;

        data_z4[7:0] <= data_z3[7:0];
        sof_z4       <= sof_z3;

        val_z5       <= eof_i;

        if (eof_i == HI) begin
            exp_z5[31:0] <= {data_z3[7:0], data_z2[7:0], data_z1[7:0], data_i[7:0]};
        end

        if (sof_z4 == HI) begin
            fcs_z5[31:0] <= fcs32_8(data_z4[7:0], ONES[31:0]);
        end else begin
            fcs_z5[31:0] <= fcs32_8(data_z4[7:0], fcs_z5[31:0]);
        end

        val_z6 <= val_z5;
        exp_z6[31:0] <= exp_z5[31:0];
        fcs_z6[31:0] <= fcs32_brev(fcs_z5[31:0]);
    end

    generate
        genvar i;
        for (i = FIRST ; i <= LAST ; i = i + 1) begin : ppln_delay
            always @ (posedge pclk_i) begin
                if (i == FIRST) begin
                    exp[i][31:0] <= exp_z6[31:0];
                    crc[i][31:0] <= fcs_z6[31:0];
                    val[i]       <= val_z6;
                end else begin
                    exp[i][31:0] <= exp[i - 1][31:0];
                    crc[i][31:0] <= crc[i - 1][31:0];
                    val[i]       <= val[i - 1];
                end
            end
        end
    endgenerate

    /* -----------------------------------------------------------
       output assignments
    ------------------------------------------------------------*/
    always @ (*) begin
        res_o[31:0] = fcs_z5[31:0];
        exp_o[31:0] = exp[LAST][31:0];
        obs_o[31:0] = crc[LAST][31:0];
        val_o       = val[LAST];
    end
endmodule
