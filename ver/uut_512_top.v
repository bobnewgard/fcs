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
`include "fcs32_8.v"
`include "fcs32_16.v"
`include "fcs32_32.v"
`include "fcs32_64.v"
`include "fcs32_128.v"
`include "fcs32_256.v"
`include "fcs32_512.v"
`include "fcs32_brev.v"

module uut_512_top
(
    output wire [31:0]  res_o,
    output wire [31:0]  exp_o,
    output wire [31:0]  obs_o,
    output wire [15:0]  len_o,
    output wire         val_o,

    input  wire [511:0] dat_i,
    input  wire [5:0]   mod_i,
    input  wire         sof_i,
    input  wire         eof_i,

    input  wire         pclk_i
);
    /* -----------------------------------------------------------
       parameters
    ------------------------------------------------------------*/
    localparam         LO    = 1'b0;
    localparam         HI    = 1'b1;
    localparam [511:0] ZEROS = {512{LO}};
    localparam [511:0] ONES  = {512{HI}};

    /* -----------------------------------------------------------
      net declarations
    ------------------------------------------------------------*/
    reg  [511:0]    dat_z1   = ZEROS[511:0];
    reg  [5:0]      mod_z1   = ZEROS[5:0];
    reg             sof_z1   = LO;
    reg             eof_z1   = LO;
    reg  [15:0]     len_z1   = ZEROS[15:0];
    reg  [31:0]     exp_z1   = ZEROS[31:0];

    reg  [511:0]    dat_z2   = ZEROS[511:0];
    reg  [5:0]      mod_z2   = ZEROS[5:0];
    reg             sof_z2   = LO;
    reg             eof_z2   = LO;
    reg  [15:0]     len_z2   = ZEROS[15:0];
    reg  [31:0]     exp_z2   = ZEROS[31:0];
    reg             trim_z2  = LO;

    reg  [511:0]    dat_z3   = ZEROS[511:0];
    reg  [5:0]      mod_z3   = ZEROS[5:0];
    reg             eof_z3   = LO;
    reg  [15:0]     len_z3   = ZEROS[15:0];
    reg  [31:0]     fcs_z3   = ZEROS[31:0];
    reg  [31:0]     exp_z3   = ZEROS[31:0];

    reg  [511:256]  dat_z4   = ZEROS[511:256];
    reg  [4:0]      mod_z4   = ZEROS[4:0];
    reg             eof_z4   = LO;
    reg  [15:0]     len_z4   = ZEROS[15:0];
    reg  [31:0]     fcs_z4   = ZEROS[31:0];
    reg  [31:0]     exp_z4   = ZEROS[31:0];

    reg  [511:384]  dat_z5   = ZEROS[511:384];
    reg  [3:0]      mod_z5   = ZEROS[3:0];
    reg             eof_z5   = LO;
    reg  [15:0]     len_z5   = ZEROS[15:0];
    reg  [31:0]     fcs_z5   = ZEROS[31:0];
    reg  [31:0]     exp_z5   = ZEROS[31:0];

    reg  [511:448]  dat_z6   = ZEROS[511:448];
    reg  [2:0]      mod_z6   = ZEROS[2:0];
    reg             eof_z6   = LO;
    reg  [15:0]     len_z6   = ZEROS[15:0];
    reg  [31:0]     fcs_z6   = ZEROS[31:0];
    reg  [31:0]     exp_z6   = ZEROS[31:0];

    reg  [511:480]  dat_z7   = ZEROS[511:480];
    reg  [1:0]      mod_z7   = ZEROS[1:0];
    reg             eof_z7   = LO;
    reg  [15:0]     len_z7   = ZEROS[15:0];
    reg  [31:0]     fcs_z7   = ZEROS[31:0];
    reg  [31:0]     exp_z7   = ZEROS[31:0];

    reg  [511:496]  dat_z8   = ZEROS[511:496];
    reg             mod_z8   = LO;
    reg             eof_z8   = LO;
    reg  [15:0]     len_z8   = ZEROS[15:0];
    reg  [31:0]     fcs_z8   = ZEROS[31:0];
    reg  [31:0]     exp_z8   = ZEROS[31:0];

    reg             eof_z9   = LO;
    reg  [15:0]     len_z9   = ZEROS[15:0];
    reg  [31:0]     fcs_z9   = ZEROS[31:0];
    reg  [31:0]     exp_z9   = ZEROS[31:0];

    reg             eof_z10  = LO;
    reg  [15:0]     len_z10  = ZEROS[15:0];
    reg  [31:0]     fcs_z10  = ZEROS[31:0];
    reg  [31:0]     exp_z10  = ZEROS[31:0];
    reg  [31:0]     res_z10  = ZEROS[31:0];

    wire            unused   = &{LO, dat_z8[503:496], LO};

    /* -----------------------------------------------------------
       Pipeline
    ------------------------------------------------------------*/
    always @ (posedge pclk_i) begin
        /* z1 */
        dat_z1[511-:512] <= dat_i[511-:512];
        mod_z1[5:0]      <= 6'd0;
        sof_z1           <= sof_i;
        eof_z1           <= LO;

        if (sof_i) begin
            len_z1[15:0] <= 16'd64;
        end else if (mod_i[5:0] != ZEROS[5:0]) begin
            len_z1[15:0] <= len_z1[15:0] + {10'b0,mod_i[5:0]};
        end else begin
            len_z1[15:0] <= len_z1[15:0] + 16'd64;
        end

        if (eof_i) begin
            case (mod_i[5:0])
                6'd0    : mod_z1[5:0] <= 6'd60;
                6'd1    : mod_z1[5:0] <= 6'd0;
                6'd2    : mod_z1[5:0] <= 6'd0;
                6'd3    : mod_z1[5:0] <= 6'd0;
                6'd4    : mod_z1[5:0] <= 6'd0;
                default : mod_z1[5:0] <= mod_i[5:0] - 4;
            endcase
            case (mod_i[5:0])
                6'd1    : eof_z1 <= LO;
                6'd2    : eof_z1 <= LO;
                6'd3    : eof_z1 <= LO;
                6'd4    : eof_z1 <= LO;
                default : eof_z1 <= eof_i;
            endcase
            case (mod_i[5:0])
                6'd0    : exp_z1[31:0] <= dat_i[31:0];
                6'd1    : exp_z1[31:0] <= ZEROS[31:0];
                6'd2    : exp_z1[31:0] <= ZEROS[31:0];
                6'd3    : exp_z1[31:0] <= ZEROS[31:0];
                6'd4    : exp_z1[31:0] <= ZEROS[31:0];
                default : exp_z1[31:0] <= dat_i[(511-(({3'b0,mod_i[5:0]}-4)*8))-:32];
            endcase
        end

        /* z2 */
        dat_z2[511-:512] <= dat_z1[511-:512];
        mod_z2[5:0]      <= 6'd0;
        sof_z2           <= sof_z1;
        eof_z2           <= LO;
        trim_z2          <= LO;

        case (mod_i[5:0])
            6'd1    : len_z2[15:0] <= len_z1[15:0] + 16'd1;
            6'd2    : len_z2[15:0] <= len_z1[15:0] + 16'd2;
            6'd3    : len_z2[15:0] <= len_z1[15:0] + 16'd3;
            6'd4    : len_z2[15:0] <= len_z1[15:0] + 16'd4;
            default : len_z2[15:0] <= len_z1[15:0];
        endcase

        if (eof_i) begin
            case (mod_i[5:0])
                6'd1    : mod_z2[5:0] <= 6'd61;
                6'd2    : mod_z2[5:0] <= 6'd62;
                6'd3    : mod_z2[5:0] <= 6'd63;
                6'd4    : mod_z2[5:0] <= 6'd0;
                default : mod_z2[5:0] <= mod_z1;
            endcase
            case (mod_i[5:0])
                6'd1    : eof_z2 <= HI;
                6'd2    : eof_z2 <= HI;
                6'd3    : eof_z2 <= HI;
                6'd4    : eof_z2 <= HI;
                default : eof_z2 <= eof_z1;
            endcase
            case (mod_i[5:0])
                6'd1    : exp_z2[31:0] <= {dat_z1[23:0], dat_i[511-:8]};
                6'd2    : exp_z2[31:0] <= {dat_z1[15:0], dat_i[511-:16]};
                6'd3    : exp_z2[31:0] <= {dat_z1[7:0],  dat_i[511-:24]};
                6'd4    : exp_z2[31:0] <= dat_i[511-:32];
                default : exp_z2[31:0] <= exp_z1[31:0];
            endcase
            case (mod_i[5:0])
                6'd1    : trim_z2 <= HI;
                6'd2    : trim_z2 <= HI;
                6'd3    : trim_z2 <= HI;
                6'd4    : trim_z2 <= HI;
                default : trim_z2 <= LO;
            endcase
        end else if (trim_z2 == LO) begin
            mod_z2[5:0]  <= mod_z1;
            eof_z2       <= eof_z1;
            exp_z2[31:0] <= exp_z1[31:0];
        end

        /* z3 - fcs for 512 bits */
        dat_z3[511-:512] <= dat_z2[511-:512];
        mod_z3[5:0]      <= mod_z2[5:0];
        eof_z3           <= eof_z2;
        len_z3[15:0]     <= len_z2[15:0];
        exp_z3[31:0]     <= exp_z2[31:0];

        if ((sof_z2 == HI) && (mod_z2[5:0] == ZEROS[5:0])) begin
            fcs_z3[31:0] <= fcs32_512(dat_z2[511:0], ONES[31:0]);
        end else if (sof_z2 == HI) begin
            fcs_z3[31:0] <= ONES[31:0];
        end else if (mod_z2[5:0] == ZEROS[5:0]) begin
            fcs_z3[31:0] <= fcs32_512(dat_z2[511:0], fcs_z3[31:0]);
        end

        /* z4 - fcs for 256 bits */
        mod_z4[4:0]  <= mod_z3[4:0];
        eof_z4       <= eof_z3;
        len_z4[15:0] <= len_z3[15:0];
        exp_z4[31:0] <= exp_z3[31:0];

        if (mod_z3[5] == HI) begin
            fcs_z4[31:0]     <= fcs32_256(dat_z3[511-:256], fcs_z3[31:0]);
            dat_z4[511-:256] <= dat_z3[(511-256)-:256];
        end else begin
            fcs_z4[31:0]     <= fcs_z3[31:0];
            dat_z4[511-:256] <= dat_z3[511-:256];
        end

        /* z5 - fcs for 128 bits */
        mod_z5[3:0]  <= mod_z4[3:0];
        eof_z5       <= eof_z4;
        len_z5[15:0] <= len_z4[15:0];
        exp_z5[31:0] <= exp_z4[31:0];

        if (mod_z4[4] == HI) begin
            fcs_z5[31:0]     <= fcs32_128(dat_z4[511-:128], fcs_z4[31:0]);
            dat_z5[511-:128] <= dat_z4[(511-128)-:128];
        end else begin
            fcs_z5[31:0]     <= fcs_z4[31:0];
            dat_z5[511-:128] <= dat_z4[511-:128];
        end

        /* z6 - fcs for 64 bits */
        mod_z6[2:0]  <= mod_z5[2:0];
        eof_z6       <= eof_z5;
        len_z6[15:0] <= len_z5[15:0];
        exp_z6[31:0] <= exp_z5[31:0];

        if (mod_z5[3] == HI) begin
            fcs_z6[31:0]    <= fcs32_64(dat_z5[511-:64], fcs_z5[31:0]);
            dat_z6[511-:64] <= dat_z5[(511-64)-:64];
        end else begin
            fcs_z6[31:0]    <= fcs_z5[31:0];
            dat_z6[511-:64] <= dat_z5[511-:64];
        end

        /* z7 - fcs for 32 bits */
        mod_z7[1:0]  <= mod_z6[1:0];
        eof_z7       <= eof_z6;
        len_z7[15:0] <= len_z6[15:0];
        exp_z7[31:0] <= exp_z6[31:0];

        if (mod_z6[2] == HI) begin
            fcs_z7[31:0]    <= fcs32_32(dat_z6[511-:32], fcs_z6[31:0]);
            dat_z7[511-:32] <= dat_z6[(511-32)-:32];
        end else begin
            fcs_z7[31:0]    <= fcs_z6[31:0];
            dat_z7[511-:32] <= dat_z6[511-:32];
        end

        /* z8 - fcs for 16 bits */
        dat_z8[7:0]  <= dat_z7[15:8];
        mod_z8       <= mod_z7[0];
        eof_z8       <= eof_z7;
        len_z8[15:0] <= len_z7[15:0];
        exp_z8[31:0] <= exp_z7[31:0];

        if (mod_z7[1] == HI) begin
            fcs_z8[31:0]    <= fcs32_16(dat_z7[511-:16], fcs_z7[31:0]);
            dat_z8[511-:16] <= dat_z7[(511-16)-:16];
        end else begin
            fcs_z8[31:0]    <= fcs_z7[31:0];
            dat_z8[511-:16] <= dat_z7[511-:16];
        end

        /* z9 - fcs for 8 bits */
        eof_z9       <= eof_z8;
        len_z9[15:0] <= len_z8[15:0];
        exp_z9[31:0] <= exp_z8[31:0];

        if (mod_z8 == HI) begin
            fcs_z9[31:0] <= fcs32_8(dat_z8[511-:8], fcs_z8[31:0]);
        end else begin
            fcs_z9[31:0] <= fcs_z8[31:0];
        end

        /* z10 - bit-reverse */
        eof_z10       <= eof_z9;
        len_z10[15:0] <= len_z9[15:0];
        exp_z10[31:0] <= exp_z9[31:0];
        fcs_z10[31:0] <= fcs32_brev(fcs_z9[31:0]);
        res_z10[31:0] <= fcs32_32(exp_z9[31:0], fcs_z9[31:0]);
    end

    /* -----------------------------------------------------------
       output assignments
    ------------------------------------------------------------*/
    always @ (*) begin
        val_o       = eof_z10;
        len_o[15:0] = len_z10[15:0];
        res_o[31:0] = res_z10[31:0];
        exp_o[31:0] = exp_z10[31:0];
        obs_o[31:0] = fcs_z10[31:0];
    end
endmodule
