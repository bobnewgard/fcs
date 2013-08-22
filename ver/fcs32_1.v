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

/** \file  fcs32_1.v
 *  \brief FCS function for a 1-bit datapath.
 *
 *  Declares and defines the canonical 1-bit FCS function
 *
 */

function [31:0] fcs32_1(input di, input [31:0] ci);
begin
	fcs32_1[0] =  ci[31] ^ di;
	fcs32_1[1] =  ci[0] ^ ci[31] ^ di;
	fcs32_1[2] =  ci[1] ^ ci[31] ^ di;
	fcs32_1[3] =  ci[2];
	fcs32_1[4] =  ci[3] ^ ci[31] ^ di;
	fcs32_1[5] =  ci[4] ^ ci[31] ^ di;
	fcs32_1[6] =  ci[5];
	fcs32_1[7] =  ci[6] ^ ci[31] ^ di;
	fcs32_1[8] =  ci[7] ^ ci[31] ^ di;
	fcs32_1[9] =  ci[8];
	fcs32_1[10] =  ci[9] ^ ci[31] ^ di;
	fcs32_1[11] =  ci[10] ^ ci[31] ^ di;
	fcs32_1[12] =  ci[11] ^ ci[31] ^ di;
	fcs32_1[13] =  ci[12];
	fcs32_1[14] =  ci[13];
	fcs32_1[15] =  ci[14];
	fcs32_1[16] =  ci[15] ^ ci[31] ^ di;
	fcs32_1[17] =  ci[16];
	fcs32_1[18] =  ci[17];
	fcs32_1[19] =  ci[18];
	fcs32_1[20] =  ci[19];
	fcs32_1[21] =  ci[20];
	fcs32_1[22] =  ci[21] ^ ci[31] ^ di;
	fcs32_1[23] =  ci[22] ^ ci[31] ^ di;
	fcs32_1[24] =  ci[23];
	fcs32_1[25] =  ci[24];
	fcs32_1[26] =  ci[25] ^ ci[31] ^ di;
	fcs32_1[27] =  ci[26];
	fcs32_1[28] =  ci[27];
	fcs32_1[29] =  ci[28];
	fcs32_1[30] =  ci[29];
	fcs32_1[31] =  ci[30];
end
endfunction
