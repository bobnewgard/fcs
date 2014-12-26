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

/** \file  fcs32_16.v
 *  \brief FCS functions for a 16-bit datapath.
 *
 *  Declares and defines the 16-bit functions
 *  for FCS, input byte reversal and top-level
 *  wrapper.
 */

function [31:0] fcs32_16_core(input [15:0] di, input [31:0] ci);
	fcs32_16_core[0] =  ci[16] ^ ci[22] ^ ci[25] ^ ci[26] ^ ci[28] ^ di[3] ^ di[5] ^ di[6] ^ di[9] ^ di[15];
	fcs32_16_core[1] =  ci[16] ^ ci[17] ^ ci[22] ^ ci[23] ^ ci[25] ^ ci[27] ^ ci[28] ^ ci[29] ^ di[2] ^ di[3] ^ di[4] ^ di[6] ^ di[8] ^ di[9] ^ di[14] ^ di[15];
	fcs32_16_core[2] =  ci[16] ^ ci[17] ^ ci[18] ^ ci[22] ^ ci[23] ^ ci[24] ^ ci[25] ^ ci[29] ^ ci[30] ^ di[1] ^ di[2] ^ di[6] ^ di[7] ^ di[8] ^ di[9] ^ di[13] ^ di[14] ^ di[15];
	fcs32_16_core[3] =  ci[17] ^ ci[18] ^ ci[19] ^ ci[23] ^ ci[24] ^ ci[25] ^ ci[26] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[5] ^ di[6] ^ di[7] ^ di[8] ^ di[12] ^ di[13] ^ di[14];
	fcs32_16_core[4] =  ci[16] ^ ci[18] ^ ci[19] ^ ci[20] ^ ci[22] ^ ci[24] ^ ci[27] ^ ci[28] ^ ci[31] ^ di[0] ^ di[3] ^ di[4] ^ di[7] ^ di[9] ^ di[11] ^ di[12] ^ di[13] ^ di[15];
	fcs32_16_core[5] =  ci[16] ^ ci[17] ^ ci[19] ^ ci[20] ^ ci[21] ^ ci[22] ^ ci[23] ^ ci[26] ^ ci[29] ^ di[2] ^ di[5] ^ di[8] ^ di[9] ^ di[10] ^ di[11] ^ di[12] ^ di[14] ^ di[15];
	fcs32_16_core[6] =  ci[17] ^ ci[18] ^ ci[20] ^ ci[21] ^ ci[22] ^ ci[23] ^ ci[24] ^ ci[27] ^ ci[30] ^ di[1] ^ di[4] ^ di[7] ^ di[8] ^ di[9] ^ di[10] ^ di[11] ^ di[13] ^ di[14];
	fcs32_16_core[7] =  ci[16] ^ ci[18] ^ ci[19] ^ ci[21] ^ ci[23] ^ ci[24] ^ ci[26] ^ ci[31] ^ di[0] ^ di[5] ^ di[7] ^ di[8] ^ di[10] ^ di[12] ^ di[13] ^ di[15];
	fcs32_16_core[8] =  ci[16] ^ ci[17] ^ ci[19] ^ ci[20] ^ ci[24] ^ ci[26] ^ ci[27] ^ ci[28] ^ di[3] ^ di[4] ^ di[5] ^ di[7] ^ di[11] ^ di[12] ^ di[14] ^ di[15];
	fcs32_16_core[9] =  ci[17] ^ ci[18] ^ ci[20] ^ ci[21] ^ ci[25] ^ ci[27] ^ ci[28] ^ ci[29] ^ di[2] ^ di[3] ^ di[4] ^ di[6] ^ di[10] ^ di[11] ^ di[13] ^ di[14];
	fcs32_16_core[10] =  ci[16] ^ ci[18] ^ ci[19] ^ ci[21] ^ ci[25] ^ ci[29] ^ ci[30] ^ di[1] ^ di[2] ^ di[6] ^ di[10] ^ di[12] ^ di[13] ^ di[15];
	fcs32_16_core[11] =  ci[16] ^ ci[17] ^ ci[19] ^ ci[20] ^ ci[25] ^ ci[28] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[3] ^ di[6] ^ di[11] ^ di[12] ^ di[14] ^ di[15];
	fcs32_16_core[12] =  ci[16] ^ ci[17] ^ ci[18] ^ ci[20] ^ ci[21] ^ ci[22] ^ ci[25] ^ ci[28] ^ ci[29] ^ ci[31] ^ di[0] ^ di[2] ^ di[3] ^ di[6] ^ di[9] ^ di[10] ^ di[11] ^ di[13] ^ di[14] ^ di[15];
	fcs32_16_core[13] =  ci[17] ^ ci[18] ^ ci[19] ^ ci[21] ^ ci[22] ^ ci[23] ^ ci[26] ^ ci[29] ^ ci[30] ^ di[1] ^ di[2] ^ di[5] ^ di[8] ^ di[9] ^ di[10] ^ di[12] ^ di[13] ^ di[14];
	fcs32_16_core[14] =  ci[18] ^ ci[19] ^ ci[20] ^ ci[22] ^ ci[23] ^ ci[24] ^ ci[27] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[4] ^ di[7] ^ di[8] ^ di[9] ^ di[11] ^ di[12] ^ di[13];
	fcs32_16_core[15] =  ci[19] ^ ci[20] ^ ci[21] ^ ci[23] ^ ci[24] ^ ci[25] ^ ci[28] ^ ci[31] ^ di[0] ^ di[3] ^ di[6] ^ di[7] ^ di[8] ^ di[10] ^ di[11] ^ di[12];
	fcs32_16_core[16] =  ci[0] ^ ci[16] ^ ci[20] ^ ci[21] ^ ci[24] ^ ci[28] ^ ci[29] ^ di[2] ^ di[3] ^ di[7] ^ di[10] ^ di[11] ^ di[15];
	fcs32_16_core[17] =  ci[1] ^ ci[17] ^ ci[21] ^ ci[22] ^ ci[25] ^ ci[29] ^ ci[30] ^ di[1] ^ di[2] ^ di[6] ^ di[9] ^ di[10] ^ di[14];
	fcs32_16_core[18] =  ci[2] ^ ci[18] ^ ci[22] ^ ci[23] ^ ci[26] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[5] ^ di[8] ^ di[9] ^ di[13];
	fcs32_16_core[19] =  ci[3] ^ ci[19] ^ ci[23] ^ ci[24] ^ ci[27] ^ ci[31] ^ di[0] ^ di[4] ^ di[7] ^ di[8] ^ di[12];
	fcs32_16_core[20] =  ci[4] ^ ci[20] ^ ci[24] ^ ci[25] ^ ci[28] ^ di[3] ^ di[6] ^ di[7] ^ di[11];
	fcs32_16_core[21] =  ci[5] ^ ci[21] ^ ci[25] ^ ci[26] ^ ci[29] ^ di[2] ^ di[5] ^ di[6] ^ di[10];
	fcs32_16_core[22] =  ci[6] ^ ci[16] ^ ci[25] ^ ci[27] ^ ci[28] ^ ci[30] ^ di[1] ^ di[3] ^ di[4] ^ di[6] ^ di[15];
	fcs32_16_core[23] =  ci[7] ^ ci[16] ^ ci[17] ^ ci[22] ^ ci[25] ^ ci[29] ^ ci[31] ^ di[0] ^ di[2] ^ di[6] ^ di[9] ^ di[14] ^ di[15];
	fcs32_16_core[24] =  ci[8] ^ ci[17] ^ ci[18] ^ ci[23] ^ ci[26] ^ ci[30] ^ di[1] ^ di[5] ^ di[8] ^ di[13] ^ di[14];
	fcs32_16_core[25] =  ci[9] ^ ci[18] ^ ci[19] ^ ci[24] ^ ci[27] ^ ci[31] ^ di[0] ^ di[4] ^ di[7] ^ di[12] ^ di[13];
	fcs32_16_core[26] =  ci[10] ^ ci[16] ^ ci[19] ^ ci[20] ^ ci[22] ^ ci[26] ^ di[5] ^ di[9] ^ di[11] ^ di[12] ^ di[15];
	fcs32_16_core[27] =  ci[11] ^ ci[17] ^ ci[20] ^ ci[21] ^ ci[23] ^ ci[27] ^ di[4] ^ di[8] ^ di[10] ^ di[11] ^ di[14];
	fcs32_16_core[28] =  ci[12] ^ ci[18] ^ ci[21] ^ ci[22] ^ ci[24] ^ ci[28] ^ di[3] ^ di[7] ^ di[9] ^ di[10] ^ di[13];
	fcs32_16_core[29] =  ci[13] ^ ci[19] ^ ci[22] ^ ci[23] ^ ci[25] ^ ci[29] ^ di[2] ^ di[6] ^ di[8] ^ di[9] ^ di[12];
	fcs32_16_core[30] =  ci[14] ^ ci[20] ^ ci[23] ^ ci[24] ^ ci[26] ^ ci[30] ^ di[1] ^ di[5] ^ di[7] ^ di[8] ^ di[11];
	fcs32_16_core[31] =  ci[15] ^ ci[21] ^ ci[24] ^ ci[25] ^ ci[27] ^ ci[31] ^ di[0] ^ di[4] ^ di[6] ^ di[7] ^ di[10];
endfunction

function [15:0] fcs32_16_brev(input [15:0] di);
	fcs32_16_brev[15:0] = {di[7:0], di[15:8]};
endfunction

function [31:0] fcs32_16(input [15:0] di, input [31:0] ci);
	fcs32_16[31:0] = fcs32_16_core(fcs32_16_brev(di[15:0]), ci[31:0]);
endfunction
