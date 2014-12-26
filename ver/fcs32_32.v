/*
 * Copyright 2014 Robert Newgard
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

/** \file  fcs32_32.v
 *  \brief FCS functions for a 32-bit datapath.
 *
 *  Declares and defines the 32-bit functions
 *  for FCS, input byte reversal and top-level
 *  wrapper.
 */

function [31:0] fcs32_32_core(input [31:0] di, input [31:0] ci);
	fcs32_32_core[0] =  ci[0] ^ ci[6] ^ ci[9] ^ ci[10] ^ ci[12] ^ ci[16] ^ ci[24] ^ ci[25] ^ ci[26] ^ ci[28] ^ ci[29] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[2] ^ di[3] ^ di[5] ^ di[6] ^ di[7] ^ di[15] ^ di[19] ^ di[21] ^ di[22] ^ di[25] ^ di[31];
	fcs32_32_core[1] =  ci[0] ^ ci[1] ^ ci[6] ^ ci[7] ^ ci[9] ^ ci[11] ^ ci[12] ^ ci[13] ^ ci[16] ^ ci[17] ^ ci[24] ^ ci[27] ^ ci[28] ^ di[3] ^ di[4] ^ di[7] ^ di[14] ^ di[15] ^ di[18] ^ di[19] ^ di[20] ^ di[22] ^ di[24] ^ di[25] ^ di[30] ^ di[31];
	fcs32_32_core[2] =  ci[0] ^ ci[1] ^ ci[2] ^ ci[6] ^ ci[7] ^ ci[8] ^ ci[9] ^ ci[13] ^ ci[14] ^ ci[16] ^ ci[17] ^ ci[18] ^ ci[24] ^ ci[26] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[5] ^ di[7] ^ di[13] ^ di[14] ^ di[15] ^ di[17] ^ di[18] ^ di[22] ^ di[23] ^ di[24] ^ di[25] ^ di[29] ^ di[30] ^ di[31];
	fcs32_32_core[3] =  ci[1] ^ ci[2] ^ ci[3] ^ ci[7] ^ ci[8] ^ ci[9] ^ ci[10] ^ ci[14] ^ ci[15] ^ ci[17] ^ ci[18] ^ ci[19] ^ ci[25] ^ ci[27] ^ ci[31] ^ di[0] ^ di[4] ^ di[6] ^ di[12] ^ di[13] ^ di[14] ^ di[16] ^ di[17] ^ di[21] ^ di[22] ^ di[23] ^ di[24] ^ di[28] ^ di[29] ^ di[30];
	fcs32_32_core[4] =  ci[0] ^ ci[2] ^ ci[3] ^ ci[4] ^ ci[6] ^ ci[8] ^ ci[11] ^ ci[12] ^ ci[15] ^ ci[18] ^ ci[19] ^ ci[20] ^ ci[24] ^ ci[25] ^ ci[29] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[2] ^ di[6] ^ di[7] ^ di[11] ^ di[12] ^ di[13] ^ di[16] ^ di[19] ^ di[20] ^ di[23] ^ di[25] ^ di[27] ^ di[28] ^ di[29] ^ di[31];
	fcs32_32_core[5] =  ci[0] ^ ci[1] ^ ci[3] ^ ci[4] ^ ci[5] ^ ci[6] ^ ci[7] ^ ci[10] ^ ci[13] ^ ci[19] ^ ci[20] ^ ci[21] ^ ci[24] ^ ci[28] ^ ci[29] ^ di[2] ^ di[3] ^ di[7] ^ di[10] ^ di[11] ^ di[12] ^ di[18] ^ di[21] ^ di[24] ^ di[25] ^ di[26] ^ di[27] ^ di[28] ^ di[30] ^ di[31];
	fcs32_32_core[6] =  ci[1] ^ ci[2] ^ ci[4] ^ ci[5] ^ ci[6] ^ ci[7] ^ ci[8] ^ ci[11] ^ ci[14] ^ ci[20] ^ ci[21] ^ ci[22] ^ ci[25] ^ ci[29] ^ ci[30] ^ di[1] ^ di[2] ^ di[6] ^ di[9] ^ di[10] ^ di[11] ^ di[17] ^ di[20] ^ di[23] ^ di[24] ^ di[25] ^ di[26] ^ di[27] ^ di[29] ^ di[30];
	fcs32_32_core[7] =  ci[0] ^ ci[2] ^ ci[3] ^ ci[5] ^ ci[7] ^ ci[8] ^ ci[10] ^ ci[15] ^ ci[16] ^ ci[21] ^ ci[22] ^ ci[23] ^ ci[24] ^ ci[25] ^ ci[28] ^ ci[29] ^ di[2] ^ di[3] ^ di[6] ^ di[7] ^ di[8] ^ di[9] ^ di[10] ^ di[15] ^ di[16] ^ di[21] ^ di[23] ^ di[24] ^ di[26] ^ di[28] ^ di[29] ^ di[31];
	fcs32_32_core[8] =  ci[0] ^ ci[1] ^ ci[3] ^ ci[4] ^ ci[8] ^ ci[10] ^ ci[11] ^ ci[12] ^ ci[17] ^ ci[22] ^ ci[23] ^ ci[28] ^ ci[31] ^ di[0] ^ di[3] ^ di[8] ^ di[9] ^ di[14] ^ di[19] ^ di[20] ^ di[21] ^ di[23] ^ di[27] ^ di[28] ^ di[30] ^ di[31];
	fcs32_32_core[9] =  ci[1] ^ ci[2] ^ ci[4] ^ ci[5] ^ ci[9] ^ ci[11] ^ ci[12] ^ ci[13] ^ ci[18] ^ ci[23] ^ ci[24] ^ ci[29] ^ di[2] ^ di[7] ^ di[8] ^ di[13] ^ di[18] ^ di[19] ^ di[20] ^ di[22] ^ di[26] ^ di[27] ^ di[29] ^ di[30];
	fcs32_32_core[10] =  ci[0] ^ ci[2] ^ ci[3] ^ ci[5] ^ ci[9] ^ ci[13] ^ ci[14] ^ ci[16] ^ ci[19] ^ ci[26] ^ ci[28] ^ ci[29] ^ ci[31] ^ di[0] ^ di[2] ^ di[3] ^ di[5] ^ di[12] ^ di[15] ^ di[17] ^ di[18] ^ di[22] ^ di[26] ^ di[28] ^ di[29] ^ di[31];
	fcs32_32_core[11] =  ci[0] ^ ci[1] ^ ci[3] ^ ci[4] ^ ci[9] ^ ci[12] ^ ci[14] ^ ci[15] ^ ci[16] ^ ci[17] ^ ci[20] ^ ci[24] ^ ci[25] ^ ci[26] ^ ci[27] ^ ci[28] ^ ci[31] ^ di[0] ^ di[3] ^ di[4] ^ di[5] ^ di[6] ^ di[7] ^ di[11] ^ di[14] ^ di[15] ^ di[16] ^ di[17] ^ di[19] ^ di[22] ^ di[27] ^ di[28] ^ di[30] ^ di[31];
	fcs32_32_core[12] =  ci[0] ^ ci[1] ^ ci[2] ^ ci[4] ^ ci[5] ^ ci[6] ^ ci[9] ^ ci[12] ^ ci[13] ^ ci[15] ^ ci[17] ^ ci[18] ^ ci[21] ^ ci[24] ^ ci[27] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[4] ^ di[7] ^ di[10] ^ di[13] ^ di[14] ^ di[16] ^ di[18] ^ di[19] ^ di[22] ^ di[25] ^ di[26] ^ di[27] ^ di[29] ^ di[30] ^ di[31];
	fcs32_32_core[13] =  ci[1] ^ ci[2] ^ ci[3] ^ ci[5] ^ ci[6] ^ ci[7] ^ ci[10] ^ ci[13] ^ ci[14] ^ ci[16] ^ ci[18] ^ ci[19] ^ ci[22] ^ ci[25] ^ ci[28] ^ ci[31] ^ di[0] ^ di[3] ^ di[6] ^ di[9] ^ di[12] ^ di[13] ^ di[15] ^ di[17] ^ di[18] ^ di[21] ^ di[24] ^ di[25] ^ di[26] ^ di[28] ^ di[29] ^ di[30];
	fcs32_32_core[14] =  ci[2] ^ ci[3] ^ ci[4] ^ ci[6] ^ ci[7] ^ ci[8] ^ ci[11] ^ ci[14] ^ ci[15] ^ ci[17] ^ ci[19] ^ ci[20] ^ ci[23] ^ ci[26] ^ ci[29] ^ di[2] ^ di[5] ^ di[8] ^ di[11] ^ di[12] ^ di[14] ^ di[16] ^ di[17] ^ di[20] ^ di[23] ^ di[24] ^ di[25] ^ di[27] ^ di[28] ^ di[29];
	fcs32_32_core[15] =  ci[3] ^ ci[4] ^ ci[5] ^ ci[7] ^ ci[8] ^ ci[9] ^ ci[12] ^ ci[15] ^ ci[16] ^ ci[18] ^ ci[20] ^ ci[21] ^ ci[24] ^ ci[27] ^ ci[30] ^ di[1] ^ di[4] ^ di[7] ^ di[10] ^ di[11] ^ di[13] ^ di[15] ^ di[16] ^ di[19] ^ di[22] ^ di[23] ^ di[24] ^ di[26] ^ di[27] ^ di[28];
	fcs32_32_core[16] =  ci[0] ^ ci[4] ^ ci[5] ^ ci[8] ^ ci[12] ^ ci[13] ^ ci[17] ^ ci[19] ^ ci[21] ^ ci[22] ^ ci[24] ^ ci[26] ^ ci[29] ^ ci[30] ^ di[1] ^ di[2] ^ di[5] ^ di[7] ^ di[9] ^ di[10] ^ di[12] ^ di[14] ^ di[18] ^ di[19] ^ di[23] ^ di[26] ^ di[27] ^ di[31];
	fcs32_32_core[17] =  ci[1] ^ ci[5] ^ ci[6] ^ ci[9] ^ ci[13] ^ ci[14] ^ ci[18] ^ ci[20] ^ ci[22] ^ ci[23] ^ ci[25] ^ ci[27] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[4] ^ di[6] ^ di[8] ^ di[9] ^ di[11] ^ di[13] ^ di[17] ^ di[18] ^ di[22] ^ di[25] ^ di[26] ^ di[30];
	fcs32_32_core[18] =  ci[2] ^ ci[6] ^ ci[7] ^ ci[10] ^ ci[14] ^ ci[15] ^ ci[19] ^ ci[21] ^ ci[23] ^ ci[24] ^ ci[26] ^ ci[28] ^ ci[31] ^ di[0] ^ di[3] ^ di[5] ^ di[7] ^ di[8] ^ di[10] ^ di[12] ^ di[16] ^ di[17] ^ di[21] ^ di[24] ^ di[25] ^ di[29];
	fcs32_32_core[19] =  ci[3] ^ ci[7] ^ ci[8] ^ ci[11] ^ ci[15] ^ ci[16] ^ ci[20] ^ ci[22] ^ ci[24] ^ ci[25] ^ ci[27] ^ ci[29] ^ di[2] ^ di[4] ^ di[6] ^ di[7] ^ di[9] ^ di[11] ^ di[15] ^ di[16] ^ di[20] ^ di[23] ^ di[24] ^ di[28];
	fcs32_32_core[20] =  ci[4] ^ ci[8] ^ ci[9] ^ ci[12] ^ ci[16] ^ ci[17] ^ ci[21] ^ ci[23] ^ ci[25] ^ ci[26] ^ ci[28] ^ ci[30] ^ di[1] ^ di[3] ^ di[5] ^ di[6] ^ di[8] ^ di[10] ^ di[14] ^ di[15] ^ di[19] ^ di[22] ^ di[23] ^ di[27];
	fcs32_32_core[21] =  ci[5] ^ ci[9] ^ ci[10] ^ ci[13] ^ ci[17] ^ ci[18] ^ ci[22] ^ ci[24] ^ ci[26] ^ ci[27] ^ ci[29] ^ ci[31] ^ di[0] ^ di[2] ^ di[4] ^ di[5] ^ di[7] ^ di[9] ^ di[13] ^ di[14] ^ di[18] ^ di[21] ^ di[22] ^ di[26];
	fcs32_32_core[22] =  ci[0] ^ ci[9] ^ ci[11] ^ ci[12] ^ ci[14] ^ ci[16] ^ ci[18] ^ ci[19] ^ ci[23] ^ ci[24] ^ ci[26] ^ ci[27] ^ ci[29] ^ ci[31] ^ di[0] ^ di[2] ^ di[4] ^ di[5] ^ di[7] ^ di[8] ^ di[12] ^ di[13] ^ di[15] ^ di[17] ^ di[19] ^ di[20] ^ di[22] ^ di[31];
	fcs32_32_core[23] =  ci[0] ^ ci[1] ^ ci[6] ^ ci[9] ^ ci[13] ^ ci[15] ^ ci[16] ^ ci[17] ^ ci[19] ^ ci[20] ^ ci[26] ^ ci[27] ^ ci[29] ^ ci[31] ^ di[0] ^ di[2] ^ di[4] ^ di[5] ^ di[11] ^ di[12] ^ di[14] ^ di[15] ^ di[16] ^ di[18] ^ di[22] ^ di[25] ^ di[30] ^ di[31];
	fcs32_32_core[24] =  ci[1] ^ ci[2] ^ ci[7] ^ ci[10] ^ ci[14] ^ ci[16] ^ ci[17] ^ ci[18] ^ ci[20] ^ ci[21] ^ ci[27] ^ ci[28] ^ ci[30] ^ di[1] ^ di[3] ^ di[4] ^ di[10] ^ di[11] ^ di[13] ^ di[14] ^ di[15] ^ di[17] ^ di[21] ^ di[24] ^ di[29] ^ di[30];
	fcs32_32_core[25] =  ci[2] ^ ci[3] ^ ci[8] ^ ci[11] ^ ci[15] ^ ci[17] ^ ci[18] ^ ci[19] ^ ci[21] ^ ci[22] ^ ci[28] ^ ci[29] ^ ci[31] ^ di[0] ^ di[2] ^ di[3] ^ di[9] ^ di[10] ^ di[12] ^ di[13] ^ di[14] ^ di[16] ^ di[20] ^ di[23] ^ di[28] ^ di[29];
	fcs32_32_core[26] =  ci[0] ^ ci[3] ^ ci[4] ^ ci[6] ^ ci[10] ^ ci[18] ^ ci[19] ^ ci[20] ^ ci[22] ^ ci[23] ^ ci[24] ^ ci[25] ^ ci[26] ^ ci[28] ^ ci[31] ^ di[0] ^ di[3] ^ di[5] ^ di[6] ^ di[7] ^ di[8] ^ di[9] ^ di[11] ^ di[12] ^ di[13] ^ di[21] ^ di[25] ^ di[27] ^ di[28] ^ di[31];
	fcs32_32_core[27] =  ci[1] ^ ci[4] ^ ci[5] ^ ci[7] ^ ci[11] ^ ci[19] ^ ci[20] ^ ci[21] ^ ci[23] ^ ci[24] ^ ci[25] ^ ci[26] ^ ci[27] ^ ci[29] ^ di[2] ^ di[4] ^ di[5] ^ di[6] ^ di[7] ^ di[8] ^ di[10] ^ di[11] ^ di[12] ^ di[20] ^ di[24] ^ di[26] ^ di[27] ^ di[30];
	fcs32_32_core[28] =  ci[2] ^ ci[5] ^ ci[6] ^ ci[8] ^ ci[12] ^ ci[20] ^ ci[21] ^ ci[22] ^ ci[24] ^ ci[25] ^ ci[26] ^ ci[27] ^ ci[28] ^ ci[30] ^ di[1] ^ di[3] ^ di[4] ^ di[5] ^ di[6] ^ di[7] ^ di[9] ^ di[10] ^ di[11] ^ di[19] ^ di[23] ^ di[25] ^ di[26] ^ di[29];
	fcs32_32_core[29] =  ci[3] ^ ci[6] ^ ci[7] ^ ci[9] ^ ci[13] ^ ci[21] ^ ci[22] ^ ci[23] ^ ci[25] ^ ci[26] ^ ci[27] ^ ci[28] ^ ci[29] ^ ci[31] ^ di[0] ^ di[2] ^ di[3] ^ di[4] ^ di[5] ^ di[6] ^ di[8] ^ di[9] ^ di[10] ^ di[18] ^ di[22] ^ di[24] ^ di[25] ^ di[28];
	fcs32_32_core[30] =  ci[4] ^ ci[7] ^ ci[8] ^ ci[10] ^ ci[14] ^ ci[22] ^ ci[23] ^ ci[24] ^ ci[26] ^ ci[27] ^ ci[28] ^ ci[29] ^ ci[30] ^ di[1] ^ di[2] ^ di[3] ^ di[4] ^ di[5] ^ di[7] ^ di[8] ^ di[9] ^ di[17] ^ di[21] ^ di[23] ^ di[24] ^ di[27];
	fcs32_32_core[31] =  ci[5] ^ ci[8] ^ ci[9] ^ ci[11] ^ ci[15] ^ ci[23] ^ ci[24] ^ ci[25] ^ ci[27] ^ ci[28] ^ ci[29] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[2] ^ di[3] ^ di[4] ^ di[6] ^ di[7] ^ di[8] ^ di[16] ^ di[20] ^ di[22] ^ di[23] ^ di[26];
endfunction

function [31:0] fcs32_32_brev(input [31:0] di);
	fcs32_32_brev[31:0] = {di[7:0], di[15:8], di[23:16], di[31:24]};
endfunction

function [31:0] fcs32_32(input [31:0] di, input [31:0] ci);
	fcs32_32[31:0] = fcs32_32_core(fcs32_32_brev(di[31:0]), ci[31:0]);
endfunction
