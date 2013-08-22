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

module uut_1_bytep
(
    output wire [31:0] data_o,
    output wire        sof_o,

    input  wire [7:0]  data_i,
    input  wire        sof_i,
    input  wire        pclk_i
);
    /* -----------------------------------------------------------
      parameters
    ------------------------------------------------------------*/

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
    end

    /* -----------------------------------------------------------
       output assignments
    ------------------------------------------------------------*/
    always @ (*)
    begin
        data_o[31:0] = {data_z4[7:0], data_z3[7:0], data_z2[7:0], data_z1[7:0]};
        sof_o        = sof_z4;
    end

endmodule
