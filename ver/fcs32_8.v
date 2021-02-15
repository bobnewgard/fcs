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

/** \file  fcs32_8.v
 *  \brief FCS function for an 8-bit datapath.
 *
 *  Declares and defines the 8-bit FCS function.
 *
 */

function [31:0] fcs32_8(input [7:0] di, input [31:0] ci);
begin
	fcs32_8[0] =  ci[24] ^ ci[30] ^ di[1] ^ di[7];
	fcs32_8[1] =  ci[24] ^ ci[25] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[6] ^ di[7];
	fcs32_8[2] =  ci[24] ^ ci[25] ^ ci[26] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[5] ^ di[6] ^ di[7];
	fcs32_8[3] =  ci[25] ^ ci[26] ^ ci[27] ^ ci[31] ^ di[0] ^ di[4] ^ di[5] ^ di[6];
	fcs32_8[4] =  ci[24] ^ ci[26] ^ ci[27] ^ ci[28] ^ ci[30] ^ di[1] ^ di[3] ^ di[4] ^ di[5] ^ di[7];
	fcs32_8[5] =  ci[24] ^ ci[25] ^ ci[27] ^ ci[28] ^ ci[29] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[2] ^ di[3] ^ di[4] ^ di[6] ^ di[7];
	fcs32_8[6] =  ci[25] ^ ci[26] ^ ci[28] ^ ci[29] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[2] ^ di[3] ^ di[5] ^ di[6];
	fcs32_8[7] =  ci[24] ^ ci[26] ^ ci[27] ^ ci[29] ^ ci[31] ^ di[0] ^ di[2] ^ di[4] ^ di[5] ^ di[7];
	fcs32_8[8] =  ci[0] ^ ci[24] ^ ci[25] ^ ci[27] ^ ci[28] ^ di[3] ^ di[4] ^ di[6] ^ di[7];
	fcs32_8[9] =  ci[1] ^ ci[25] ^ ci[26] ^ ci[28] ^ ci[29] ^ di[2] ^ di[3] ^ di[5] ^ di[6];
	fcs32_8[10] =  ci[2] ^ ci[24] ^ ci[26] ^ ci[27] ^ ci[29] ^ di[2] ^ di[4] ^ di[5] ^ di[7];
	fcs32_8[11] =  ci[3] ^ ci[24] ^ ci[25] ^ ci[27] ^ ci[28] ^ di[3] ^ di[4] ^ di[6] ^ di[7];
	fcs32_8[12] =  ci[4] ^ ci[24] ^ ci[25] ^ ci[26] ^ ci[28] ^ ci[29] ^ ci[30] ^ di[1] ^ di[2] ^ di[3] ^ di[5] ^ di[6] ^ di[7];
	fcs32_8[13] =  ci[5] ^ ci[25] ^ ci[26] ^ ci[27] ^ ci[29] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[2] ^ di[4] ^ di[5] ^ di[6];
	fcs32_8[14] =  ci[6] ^ ci[26] ^ ci[27] ^ ci[28] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[3] ^ di[4] ^ di[5];
	fcs32_8[15] =  ci[7] ^ ci[27] ^ ci[28] ^ ci[29] ^ ci[31] ^ di[0] ^ di[2] ^ di[3] ^ di[4];
	fcs32_8[16] =  ci[8] ^ ci[24] ^ ci[28] ^ ci[29] ^ di[2] ^ di[3] ^ di[7];
	fcs32_8[17] =  ci[9] ^ ci[25] ^ ci[29] ^ ci[30] ^ di[1] ^ di[2] ^ di[6];
	fcs32_8[18] =  ci[10] ^ ci[26] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[5];
	fcs32_8[19] =  ci[11] ^ ci[27] ^ ci[31] ^ di[0] ^ di[4];
	fcs32_8[20] =  ci[12] ^ ci[28] ^ di[3];
	fcs32_8[21] =  ci[13] ^ ci[29] ^ di[2];
	fcs32_8[22] =  ci[14] ^ ci[24] ^ di[7];
	fcs32_8[23] =  ci[15] ^ ci[24] ^ ci[25] ^ ci[30] ^ di[1] ^ di[6] ^ di[7];
	fcs32_8[24] =  ci[16] ^ ci[25] ^ ci[26] ^ ci[31] ^ di[0] ^ di[5] ^ di[6];
	fcs32_8[25] =  ci[17] ^ ci[26] ^ ci[27] ^ di[4] ^ di[5];
	fcs32_8[26] =  ci[18] ^ ci[24] ^ ci[27] ^ ci[28] ^ ci[30] ^ di[1] ^ di[3] ^ di[4] ^ di[7];
	fcs32_8[27] =  ci[19] ^ ci[25] ^ ci[28] ^ ci[29] ^ ci[31] ^ di[0] ^ di[2] ^ di[3] ^ di[6];
	fcs32_8[28] =  ci[20] ^ ci[26] ^ ci[29] ^ ci[30] ^ di[1] ^ di[2] ^ di[5];
	fcs32_8[29] =  ci[21] ^ ci[27] ^ ci[30] ^ ci[31] ^ di[0] ^ di[1] ^ di[4];
	fcs32_8[30] =  ci[22] ^ ci[28] ^ ci[31] ^ di[0] ^ di[3];
	fcs32_8[31] =  ci[23] ^ ci[29] ^ di[2];
end
endfunction
