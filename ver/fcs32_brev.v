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

function [31:0] fcs32_brev(input [31:0] arg);
begin
    fcs32_brev[31] = ~arg[24];
    fcs32_brev[30] = ~arg[25];
    fcs32_brev[29] = ~arg[26];
    fcs32_brev[28] = ~arg[27];
    fcs32_brev[27] = ~arg[28];
    fcs32_brev[26] = ~arg[29];
    fcs32_brev[25] = ~arg[30];
    fcs32_brev[24] = ~arg[31];
    fcs32_brev[23] = ~arg[16];
    fcs32_brev[22] = ~arg[17];
    fcs32_brev[21] = ~arg[18];
    fcs32_brev[20] = ~arg[19];
    fcs32_brev[19] = ~arg[20];
    fcs32_brev[18] = ~arg[21];
    fcs32_brev[17] = ~arg[22];
    fcs32_brev[16] = ~arg[23];
    fcs32_brev[15] = ~arg[8];
    fcs32_brev[14] = ~arg[9];
    fcs32_brev[13] = ~arg[10];
    fcs32_brev[12] = ~arg[11];
    fcs32_brev[11] = ~arg[12];
    fcs32_brev[10] = ~arg[13];
    fcs32_brev[9]  = ~arg[14];
    fcs32_brev[8]  = ~arg[15];
    fcs32_brev[7]  = ~arg[0];
    fcs32_brev[6]  = ~arg[1];
    fcs32_brev[5]  = ~arg[2];
    fcs32_brev[4]  = ~arg[3];
    fcs32_brev[3]  = ~arg[4];
    fcs32_brev[2]  = ~arg[5];
    fcs32_brev[1]  = ~arg[6];
    fcs32_brev[0]  = ~arg[7];
end
endfunction
