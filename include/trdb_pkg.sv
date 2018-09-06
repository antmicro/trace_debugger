// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// Author: Robert Balas (balasr@student.ethz.ch)
// Description:

package trdb_pkg;

parameter ILEN = 32;
parameter XLEN = 32;
parameter PRIVLEN = 3;
parameter CAUSELEN = 5;
parameter CONTEXTLEN = 32; //TODO: currently not used
parameter PACKET_LEN = 128; //adjust to about 70
parameter PACKET_HEADER_LEN = 7; // $clog(PACKET_LEN+1);
parameter PACKET_TOTAL = PACKET_LEN + PACKET_HEADER_LEN;

parameter PACKET_BUFFER_STAGES = 4;



typedef enum logic[1:0]
{
 F_BRANCH_FULL = 2'h0,
 F_BRANCH_DIFF = 2'h1,
 F_ADDR_ONLY   = 2'h2,
 F_SYNC        = 2'h3
 } trdb_format_t;

typedef enum logic[1:0]
{
 SF_START     = 2'h0,
 SF_EXCEPTION = 2'h1,
 SF_CONTEXT   = 2'h2,
 SF_UNDEF     = 2'h3
 } trdb_subformat_t;


// Automatically generated by parse-opcodes (pulp-fork).
parameter MATCH_BEQ = 32'h63;
parameter MASK_BEQ = 32'h707f;
parameter MATCH_BNE = 32'h1063;
parameter MASK_BNE = 32'h707f;
parameter MATCH_BLT = 32'h4063;
parameter MASK_BLT = 32'h707f;
parameter MATCH_BGE = 32'h5063;
parameter MASK_BGE = 32'h707f;
parameter MATCH_BLTU = 32'h6063;
parameter MASK_BLTU = 32'h707f;
parameter MATCH_BGEU = 32'h7063;
parameter MASK_BGEU = 32'h707f;
parameter MATCH_JALR = 32'h67;
parameter MASK_JALR = 32'h707f;
parameter MATCH_JAL = 32'h6f;
parameter MASK_JAL = 32'h7f;
parameter MATCH_LUI = 32'h37;
parameter MASK_LUI = 32'h7f;
parameter MATCH_AUIPC = 32'h17;
parameter MASK_AUIPC = 32'h7f;
parameter MATCH_ADDI = 32'h13;
parameter MASK_ADDI = 32'h707f;
parameter MATCH_SLLI = 32'h1013;
parameter MASK_SLLI = 32'hfc00707f;
parameter MATCH_SLTI = 32'h2013;
parameter MASK_SLTI = 32'h707f;
parameter MATCH_SLTIU = 32'h3013;
parameter MASK_SLTIU = 32'h707f;
parameter MATCH_XORI = 32'h4013;
parameter MASK_XORI = 32'h707f;
parameter MATCH_SRLI = 32'h5013;
parameter MASK_SRLI = 32'hfc00707f;
parameter MATCH_SRAI = 32'h40005013;
parameter MASK_SRAI = 32'hfc00707f;
parameter MATCH_ORI = 32'h6013;
parameter MASK_ORI = 32'h707f;
parameter MATCH_ANDI = 32'h7013;
parameter MASK_ANDI = 32'h707f;
parameter MATCH_ADD = 32'h33;
parameter MASK_ADD = 32'hfe00707f;
parameter MATCH_SUB = 32'h40000033;
parameter MASK_SUB = 32'hfe00707f;
parameter MATCH_SLL = 32'h1033;
parameter MASK_SLL = 32'hfe00707f;
parameter MATCH_SLT = 32'h2033;
parameter MASK_SLT = 32'hfe00707f;
parameter MATCH_SLTU = 32'h3033;
parameter MASK_SLTU = 32'hfe00707f;
parameter MATCH_XOR = 32'h4033;
parameter MASK_XOR = 32'hfe00707f;
parameter MATCH_SRL = 32'h5033;
parameter MASK_SRL = 32'hfe00707f;
parameter MATCH_SRA = 32'h40005033;
parameter MASK_SRA = 32'hfe00707f;
parameter MATCH_OR = 32'h6033;
parameter MASK_OR = 32'hfe00707f;
parameter MATCH_AND = 32'h7033;
parameter MASK_AND = 32'hfe00707f;
parameter MATCH_ADDIW = 32'h1b;
parameter MASK_ADDIW = 32'h707f;
parameter MATCH_SLLIW = 32'h101b;
parameter MASK_SLLIW = 32'hfe00707f;
parameter MATCH_SRLIW = 32'h501b;
parameter MASK_SRLIW = 32'hfe00707f;
parameter MATCH_SRAIW = 32'h4000501b;
parameter MASK_SRAIW = 32'hfe00707f;
parameter MATCH_ADDW = 32'h3b;
parameter MASK_ADDW = 32'hfe00707f;
parameter MATCH_SUBW = 32'h4000003b;
parameter MASK_SUBW = 32'hfe00707f;
parameter MATCH_SLLW = 32'h103b;
parameter MASK_SLLW = 32'hfe00707f;
parameter MATCH_SRLW = 32'h503b;
parameter MASK_SRLW = 32'hfe00707f;
parameter MATCH_SRAW = 32'h4000503b;
parameter MASK_SRAW = 32'hfe00707f;
parameter MATCH_LB = 32'h3;
parameter MASK_LB = 32'h707f;
parameter MATCH_LH = 32'h1003;
parameter MASK_LH = 32'h707f;
parameter MATCH_LW = 32'h2003;
parameter MASK_LW = 32'h707f;
parameter MATCH_LD = 32'h3003;
parameter MASK_LD = 32'h707f;
parameter MATCH_LBU = 32'h4003;
parameter MASK_LBU = 32'h707f;
parameter MATCH_LHU = 32'h5003;
parameter MASK_LHU = 32'h707f;
parameter MATCH_LWU = 32'h6003;
parameter MASK_LWU = 32'h707f;
parameter MATCH_SB = 32'h23;
parameter MASK_SB = 32'h707f;
parameter MATCH_SH = 32'h1023;
parameter MASK_SH = 32'h707f;
parameter MATCH_SW = 32'h2023;
parameter MASK_SW = 32'h707f;
parameter MATCH_SD = 32'h3023;
parameter MASK_SD = 32'h707f;
parameter MATCH_FENCE = 32'hf;
parameter MASK_FENCE = 32'h707f;
parameter MATCH_FENCE_I = 32'h100f;
parameter MASK_FENCE_I = 32'h707f;
parameter MATCH_MUL = 32'h2000033;
parameter MASK_MUL = 32'hfe00707f;
parameter MATCH_MULH = 32'h2001033;
parameter MASK_MULH = 32'hfe00707f;
parameter MATCH_MULHSU = 32'h2002033;
parameter MASK_MULHSU = 32'hfe00707f;
parameter MATCH_MULHU = 32'h2003033;
parameter MASK_MULHU = 32'hfe00707f;
parameter MATCH_DIV = 32'h2004033;
parameter MASK_DIV = 32'hfe00707f;
parameter MATCH_DIVU = 32'h2005033;
parameter MASK_DIVU = 32'hfe00707f;
parameter MATCH_REM = 32'h2006033;
parameter MASK_REM = 32'hfe00707f;
parameter MATCH_REMU = 32'h2007033;
parameter MASK_REMU = 32'hfe00707f;
parameter MATCH_MULW = 32'h200003b;
parameter MASK_MULW = 32'hfe00707f;
parameter MATCH_DIVW = 32'h200403b;
parameter MASK_DIVW = 32'hfe00707f;
parameter MATCH_DIVUW = 32'h200503b;
parameter MASK_DIVUW = 32'hfe00707f;
parameter MATCH_REMW = 32'h200603b;
parameter MASK_REMW = 32'hfe00707f;
parameter MATCH_REMUW = 32'h200703b;
parameter MASK_REMUW = 32'hfe00707f;
parameter MATCH_AMOADD_W = 32'h202f;
parameter MASK_AMOADD_W = 32'hf800707f;
parameter MATCH_AMOXOR_W = 32'h2000202f;
parameter MASK_AMOXOR_W = 32'hf800707f;
parameter MATCH_AMOOR_W = 32'h4000202f;
parameter MASK_AMOOR_W = 32'hf800707f;
parameter MATCH_AMOAND_W = 32'h6000202f;
parameter MASK_AMOAND_W = 32'hf800707f;
parameter MATCH_AMOMIN_W = 32'h8000202f;
parameter MASK_AMOMIN_W = 32'hf800707f;
parameter MATCH_AMOMAX_W = 32'ha000202f;
parameter MASK_AMOMAX_W = 32'hf800707f;
parameter MATCH_AMOMINU_W = 32'hc000202f;
parameter MASK_AMOMINU_W = 32'hf800707f;
parameter MATCH_AMOMAXU_W = 32'he000202f;
parameter MASK_AMOMAXU_W = 32'hf800707f;
parameter MATCH_AMOSWAP_W = 32'h800202f;
parameter MASK_AMOSWAP_W = 32'hf800707f;
parameter MATCH_LR_W = 32'h1000202f;
parameter MASK_LR_W = 32'hf9f0707f;
parameter MATCH_SC_W = 32'h1800202f;
parameter MASK_SC_W = 32'hf800707f;
parameter MATCH_AMOADD_D = 32'h302f;
parameter MASK_AMOADD_D = 32'hf800707f;
parameter MATCH_AMOXOR_D = 32'h2000302f;
parameter MASK_AMOXOR_D = 32'hf800707f;
parameter MATCH_AMOOR_D = 32'h4000302f;
parameter MASK_AMOOR_D = 32'hf800707f;
parameter MATCH_AMOAND_D = 32'h6000302f;
parameter MASK_AMOAND_D = 32'hf800707f;
parameter MATCH_AMOMIN_D = 32'h8000302f;
parameter MASK_AMOMIN_D = 32'hf800707f;
parameter MATCH_AMOMAX_D = 32'ha000302f;
parameter MASK_AMOMAX_D = 32'hf800707f;
parameter MATCH_AMOMINU_D = 32'hc000302f;
parameter MASK_AMOMINU_D = 32'hf800707f;
parameter MATCH_AMOMAXU_D = 32'he000302f;
parameter MASK_AMOMAXU_D = 32'hf800707f;
parameter MATCH_AMOSWAP_D = 32'h800302f;
parameter MASK_AMOSWAP_D = 32'hf800707f;
parameter MATCH_LR_D = 32'h1000302f;
parameter MASK_LR_D = 32'hf9f0707f;
parameter MATCH_SC_D = 32'h1800302f;
parameter MASK_SC_D = 32'hf800707f;
parameter MATCH_ECALL = 32'h73;
parameter MASK_ECALL = 32'hffffffff;
parameter MATCH_EBREAK = 32'h100073;
parameter MASK_EBREAK = 32'hffffffff;
parameter MATCH_URET = 32'h200073;
parameter MASK_URET = 32'hffffffff;
parameter MATCH_SRET = 32'h10200073;
parameter MASK_SRET = 32'hffffffff;
parameter MATCH_MRET = 32'h30200073;
parameter MASK_MRET = 32'hffffffff;
parameter MATCH_DRET = 32'h7b200073;
parameter MASK_DRET = 32'hffffffff;
parameter MATCH_SFENCE_VMA = 32'h12000073;
parameter MASK_SFENCE_VMA = 32'hfe007fff;
parameter MATCH_WFI = 32'h10500073;
parameter MASK_WFI = 32'hffffffff;
parameter MATCH_CSRRW = 32'h1073;
parameter MASK_CSRRW = 32'h707f;
parameter MATCH_CSRRS = 32'h2073;
parameter MASK_CSRRS = 32'h707f;
parameter MATCH_CSRRC = 32'h3073;
parameter MASK_CSRRC = 32'h707f;
parameter MATCH_CSRRWI = 32'h5073;
parameter MASK_CSRRWI = 32'h707f;
parameter MATCH_CSRRSI = 32'h6073;
parameter MASK_CSRRSI = 32'h707f;
parameter MATCH_CSRRCI = 32'h7073;
parameter MASK_CSRRCI = 32'h707f;
parameter MATCH_FADD_S = 32'h53;
parameter MASK_FADD_S = 32'hfe00007f;
parameter MATCH_FSUB_S = 32'h8000053;
parameter MASK_FSUB_S = 32'hfe00007f;
parameter MATCH_FMUL_S = 32'h10000053;
parameter MASK_FMUL_S = 32'hfe00007f;
parameter MATCH_FDIV_S = 32'h18000053;
parameter MASK_FDIV_S = 32'hfe00007f;
parameter MATCH_FSGNJ_S = 32'h20000053;
parameter MASK_FSGNJ_S = 32'hfe00707f;
parameter MATCH_FSGNJN_S = 32'h20001053;
parameter MASK_FSGNJN_S = 32'hfe00707f;
parameter MATCH_FSGNJX_S = 32'h20002053;
parameter MASK_FSGNJX_S = 32'hfe00707f;
parameter MATCH_FMIN_S = 32'h28000053;
parameter MASK_FMIN_S = 32'hfe00707f;
parameter MATCH_FMAX_S = 32'h28001053;
parameter MASK_FMAX_S = 32'hfe00707f;
parameter MATCH_FSQRT_S = 32'h58000053;
parameter MASK_FSQRT_S = 32'hfff0007f;
parameter MATCH_FADD_D = 32'h2000053;
parameter MASK_FADD_D = 32'hfe00007f;
parameter MATCH_FSUB_D = 32'ha000053;
parameter MASK_FSUB_D = 32'hfe00007f;
parameter MATCH_FMUL_D = 32'h12000053;
parameter MASK_FMUL_D = 32'hfe00007f;
parameter MATCH_FDIV_D = 32'h1a000053;
parameter MASK_FDIV_D = 32'hfe00007f;
parameter MATCH_FSGNJ_D = 32'h22000053;
parameter MASK_FSGNJ_D = 32'hfe00707f;
parameter MATCH_FSGNJN_D = 32'h22001053;
parameter MASK_FSGNJN_D = 32'hfe00707f;
parameter MATCH_FSGNJX_D = 32'h22002053;
parameter MASK_FSGNJX_D = 32'hfe00707f;
parameter MATCH_FMIN_D = 32'h2a000053;
parameter MASK_FMIN_D = 32'hfe00707f;
parameter MATCH_FMAX_D = 32'h2a001053;
parameter MASK_FMAX_D = 32'hfe00707f;
parameter MATCH_FCVT_S_D = 32'h40100053;
parameter MASK_FCVT_S_D = 32'hfff0007f;
parameter MATCH_FCVT_D_S = 32'h42000053;
parameter MASK_FCVT_D_S = 32'hfff0007f;
parameter MATCH_FSQRT_D = 32'h5a000053;
parameter MASK_FSQRT_D = 32'hfff0007f;
parameter MATCH_FADD_Q = 32'h6000053;
parameter MASK_FADD_Q = 32'hfe00007f;
parameter MATCH_FSUB_Q = 32'he000053;
parameter MASK_FSUB_Q = 32'hfe00007f;
parameter MATCH_FMUL_Q = 32'h16000053;
parameter MASK_FMUL_Q = 32'hfe00007f;
parameter MATCH_FDIV_Q = 32'h1e000053;
parameter MASK_FDIV_Q = 32'hfe00007f;
parameter MATCH_FSGNJ_Q = 32'h26000053;
parameter MASK_FSGNJ_Q = 32'hfe00707f;
parameter MATCH_FSGNJN_Q = 32'h26001053;
parameter MASK_FSGNJN_Q = 32'hfe00707f;
parameter MATCH_FSGNJX_Q = 32'h26002053;
parameter MASK_FSGNJX_Q = 32'hfe00707f;
parameter MATCH_FMIN_Q = 32'h2e000053;
parameter MASK_FMIN_Q = 32'hfe00707f;
parameter MATCH_FMAX_Q = 32'h2e001053;
parameter MASK_FMAX_Q = 32'hfe00707f;
parameter MATCH_FCVT_S_Q = 32'h40300053;
parameter MASK_FCVT_S_Q = 32'hfff0007f;
parameter MATCH_FCVT_Q_S = 32'h46000053;
parameter MASK_FCVT_Q_S = 32'hfff0007f;
parameter MATCH_FCVT_D_Q = 32'h42300053;
parameter MASK_FCVT_D_Q = 32'hfff0007f;
parameter MATCH_FCVT_Q_D = 32'h46100053;
parameter MASK_FCVT_Q_D = 32'hfff0007f;
parameter MATCH_FSQRT_Q = 32'h5e000053;
parameter MASK_FSQRT_Q = 32'hfff0007f;
parameter MATCH_FLE_S = 32'ha0000053;
parameter MASK_FLE_S = 32'hfe00707f;
parameter MATCH_FLT_S = 32'ha0001053;
parameter MASK_FLT_S = 32'hfe00707f;
parameter MATCH_FEQ_S = 32'ha0002053;
parameter MASK_FEQ_S = 32'hfe00707f;
parameter MATCH_FLE_D = 32'ha2000053;
parameter MASK_FLE_D = 32'hfe00707f;
parameter MATCH_FLT_D = 32'ha2001053;
parameter MASK_FLT_D = 32'hfe00707f;
parameter MATCH_FEQ_D = 32'ha2002053;
parameter MASK_FEQ_D = 32'hfe00707f;
parameter MATCH_FLE_Q = 32'ha6000053;
parameter MASK_FLE_Q = 32'hfe00707f;
parameter MATCH_FLT_Q = 32'ha6001053;
parameter MASK_FLT_Q = 32'hfe00707f;
parameter MATCH_FEQ_Q = 32'ha6002053;
parameter MASK_FEQ_Q = 32'hfe00707f;
parameter MATCH_FCVT_W_S = 32'hc0000053;
parameter MASK_FCVT_W_S = 32'hfff0007f;
parameter MATCH_FCVT_WU_S = 32'hc0100053;
parameter MASK_FCVT_WU_S = 32'hfff0007f;
parameter MATCH_FCVT_L_S = 32'hc0200053;
parameter MASK_FCVT_L_S = 32'hfff0007f;
parameter MATCH_FCVT_LU_S = 32'hc0300053;
parameter MASK_FCVT_LU_S = 32'hfff0007f;
parameter MATCH_FMV_X_W = 32'he0000053;
parameter MASK_FMV_X_W = 32'hfff0707f;
parameter MATCH_FCLASS_S = 32'he0001053;
parameter MASK_FCLASS_S = 32'hfff0707f;
parameter MATCH_FCVT_W_D = 32'hc2000053;
parameter MASK_FCVT_W_D = 32'hfff0007f;
parameter MATCH_FCVT_WU_D = 32'hc2100053;
parameter MASK_FCVT_WU_D = 32'hfff0007f;
parameter MATCH_FCVT_L_D = 32'hc2200053;
parameter MASK_FCVT_L_D = 32'hfff0007f;
parameter MATCH_FCVT_LU_D = 32'hc2300053;
parameter MASK_FCVT_LU_D = 32'hfff0007f;
parameter MATCH_FMV_X_D = 32'he2000053;
parameter MASK_FMV_X_D = 32'hfff0707f;
parameter MATCH_FCLASS_D = 32'he2001053;
parameter MASK_FCLASS_D = 32'hfff0707f;
parameter MATCH_FCVT_W_Q = 32'hc6000053;
parameter MASK_FCVT_W_Q = 32'hfff0007f;
parameter MATCH_FCVT_WU_Q = 32'hc6100053;
parameter MASK_FCVT_WU_Q = 32'hfff0007f;
parameter MATCH_FCVT_L_Q = 32'hc6200053;
parameter MASK_FCVT_L_Q = 32'hfff0007f;
parameter MATCH_FCVT_LU_Q = 32'hc6300053;
parameter MASK_FCVT_LU_Q = 32'hfff0007f;
parameter MATCH_FMV_X_Q = 32'he6000053;
parameter MASK_FMV_X_Q = 32'hfff0707f;
parameter MATCH_FCLASS_Q = 32'he6001053;
parameter MASK_FCLASS_Q = 32'hfff0707f;
parameter MATCH_FCVT_S_W = 32'hd0000053;
parameter MASK_FCVT_S_W = 32'hfff0007f;
parameter MATCH_FCVT_S_WU = 32'hd0100053;
parameter MASK_FCVT_S_WU = 32'hfff0007f;
parameter MATCH_FCVT_S_L = 32'hd0200053;
parameter MASK_FCVT_S_L = 32'hfff0007f;
parameter MATCH_FCVT_S_LU = 32'hd0300053;
parameter MASK_FCVT_S_LU = 32'hfff0007f;
parameter MATCH_FMV_W_X = 32'hf0000053;
parameter MASK_FMV_W_X = 32'hfff0707f;
parameter MATCH_FCVT_D_W = 32'hd2000053;
parameter MASK_FCVT_D_W = 32'hfff0007f;
parameter MATCH_FCVT_D_WU = 32'hd2100053;
parameter MASK_FCVT_D_WU = 32'hfff0007f;
parameter MATCH_FCVT_D_L = 32'hd2200053;
parameter MASK_FCVT_D_L = 32'hfff0007f;
parameter MATCH_FCVT_D_LU = 32'hd2300053;
parameter MASK_FCVT_D_LU = 32'hfff0007f;
parameter MATCH_FMV_D_X = 32'hf2000053;
parameter MASK_FMV_D_X = 32'hfff0707f;
parameter MATCH_FCVT_Q_W = 32'hd6000053;
parameter MASK_FCVT_Q_W = 32'hfff0007f;
parameter MATCH_FCVT_Q_WU = 32'hd6100053;
parameter MASK_FCVT_Q_WU = 32'hfff0007f;
parameter MATCH_FCVT_Q_L = 32'hd6200053;
parameter MASK_FCVT_Q_L = 32'hfff0007f;
parameter MATCH_FCVT_Q_LU = 32'hd6300053;
parameter MASK_FCVT_Q_LU = 32'hfff0007f;
parameter MATCH_FMV_Q_X = 32'hf6000053;
parameter MASK_FMV_Q_X = 32'hfff0707f;
parameter MATCH_FLW = 32'h2007;
parameter MASK_FLW = 32'h707f;
parameter MATCH_FLD = 32'h3007;
parameter MASK_FLD = 32'h707f;
parameter MATCH_FLQ = 32'h4007;
parameter MASK_FLQ = 32'h707f;
parameter MATCH_FSW = 32'h2027;
parameter MASK_FSW = 32'h707f;
parameter MATCH_FSD = 32'h3027;
parameter MASK_FSD = 32'h707f;
parameter MATCH_FSQ = 32'h4027;
parameter MASK_FSQ = 32'h707f;
parameter MATCH_FMADD_S = 32'h43;
parameter MASK_FMADD_S = 32'h600007f;
parameter MATCH_FMSUB_S = 32'h47;
parameter MASK_FMSUB_S = 32'h600007f;
parameter MATCH_FNMSUB_S = 32'h4b;
parameter MASK_FNMSUB_S = 32'h600007f;
parameter MATCH_FNMADD_S = 32'h4f;
parameter MASK_FNMADD_S = 32'h600007f;
parameter MATCH_FMADD_D = 32'h2000043;
parameter MASK_FMADD_D = 32'h600007f;
parameter MATCH_FMSUB_D = 32'h2000047;
parameter MASK_FMSUB_D = 32'h600007f;
parameter MATCH_FNMSUB_D = 32'h200004b;
parameter MASK_FNMSUB_D = 32'h600007f;
parameter MATCH_FNMADD_D = 32'h200004f;
parameter MASK_FNMADD_D = 32'h600007f;
parameter MATCH_FMADD_Q = 32'h6000043;
parameter MASK_FMADD_Q = 32'h600007f;
parameter MATCH_FMSUB_Q = 32'h6000047;
parameter MASK_FMSUB_Q = 32'h600007f;
parameter MATCH_FNMSUB_Q = 32'h600004b;
parameter MASK_FNMSUB_Q = 32'h600007f;
parameter MATCH_FNMADD_Q = 32'h600004f;
parameter MASK_FNMADD_Q = 32'h600007f;
parameter MATCH_SLLI_RV32 = 32'h1013;
parameter MASK_SLLI_RV32 = 32'hfe00707f;
parameter MATCH_SRLI_RV32 = 32'h5013;
parameter MASK_SRLI_RV32 = 32'hfe00707f;
parameter MATCH_SRAI_RV32 = 32'h40005013;
parameter MASK_SRAI_RV32 = 32'hfe00707f;
parameter MATCH_FRFLAGS = 32'h102073;
parameter MASK_FRFLAGS = 32'hfffff07f;
parameter MATCH_FSFLAGS = 32'h101073;
parameter MASK_FSFLAGS = 32'hfff0707f;
parameter MATCH_FSFLAGSI = 32'h105073;
parameter MASK_FSFLAGSI = 32'hfff0707f;
parameter MATCH_FRRM = 32'h202073;
parameter MASK_FRRM = 32'hfffff07f;
parameter MATCH_FSRM = 32'h201073;
parameter MASK_FSRM = 32'hfff0707f;
parameter MATCH_FSRMI = 32'h205073;
parameter MASK_FSRMI = 32'hfff0707f;
parameter MATCH_FSCSR = 32'h301073;
parameter MASK_FSCSR = 32'hfff0707f;
parameter MATCH_FRCSR = 32'h302073;
parameter MASK_FRCSR = 32'hfffff07f;
parameter MATCH_RDCYCLE = 32'hc0002073;
parameter MASK_RDCYCLE = 32'hfffff07f;
parameter MATCH_RDTIME = 32'hc0102073;
parameter MASK_RDTIME = 32'hfffff07f;
parameter MATCH_RDINSTRET = 32'hc0202073;
parameter MASK_RDINSTRET = 32'hfffff07f;
parameter MATCH_RDCYCLEH = 32'hc8002073;
parameter MASK_RDCYCLEH = 32'hfffff07f;
parameter MATCH_RDTIMEH = 32'hc8102073;
parameter MASK_RDTIMEH = 32'hfffff07f;
parameter MATCH_RDINSTRETH = 32'hc8202073;
parameter MASK_RDINSTRETH = 32'hfffff07f;
parameter MATCH_SCALL = 32'h73;
parameter MASK_SCALL = 32'hffffffff;
parameter MATCH_SBREAK = 32'h100073;
parameter MASK_SBREAK = 32'hffffffff;
parameter MATCH_FMV_X_S = 32'he0000053;
parameter MASK_FMV_X_S = 32'hfff0707f;
parameter MATCH_FMV_S_X = 32'hf0000053;
parameter MASK_FMV_S_X = 32'hfff0707f;
parameter MATCH_FENCE_TSO = 32'h8330000f;
parameter MASK_FENCE_TSO = 32'hfff0707f;
parameter MATCH_LP_STARTI = 32'h7b;
parameter MASK_LP_STARTI = 32'hfff7f;
parameter MATCH_LP_ENDI = 32'h107b;
parameter MASK_LP_ENDI = 32'hfff7f;
parameter MATCH_LP_COUNT = 32'h207b;
parameter MASK_LP_COUNT = 32'hfff07f7f;
parameter MATCH_LP_COUNTI = 32'h307b;
parameter MASK_LP_COUNTI = 32'hfff7f;
parameter MATCH_LP_SETUP = 32'h407b;
parameter MASK_LP_SETUP = 32'h7f7f;
parameter MATCH_LP_SETUPI = 32'h507b;
parameter MASK_LP_SETUPI = 32'h7f7f;
parameter MATCH_P_BEQIMM = 32'h2063;
parameter MASK_P_BEQIMM = 32'h707f;
parameter MATCH_P_BNEIMM = 32'h3063;
parameter MASK_P_BNEIMM = 32'h707f;
parameter CSR_FFLAGS = 32'h1;
parameter CSR_FRM = 32'h2;
parameter CSR_FCSR = 32'h3;
parameter CSR_CYCLE = 32'hc00;
parameter CSR_TIME = 32'hc01;
parameter CSR_INSTRET = 32'hc02;
parameter CSR_HPMCOUNTER3 = 32'hc03;
parameter CSR_HPMCOUNTER4 = 32'hc04;
parameter CSR_HPMCOUNTER5 = 32'hc05;
parameter CSR_HPMCOUNTER6 = 32'hc06;
parameter CSR_HPMCOUNTER7 = 32'hc07;
parameter CSR_HPMCOUNTER8 = 32'hc08;
parameter CSR_HPMCOUNTER9 = 32'hc09;
parameter CSR_HPMCOUNTER10 = 32'hc0a;
parameter CSR_HPMCOUNTER11 = 32'hc0b;
parameter CSR_HPMCOUNTER12 = 32'hc0c;
parameter CSR_HPMCOUNTER13 = 32'hc0d;
parameter CSR_HPMCOUNTER14 = 32'hc0e;
parameter CSR_HPMCOUNTER15 = 32'hc0f;
parameter CSR_HPMCOUNTER16 = 32'hc10;
parameter CSR_HPMCOUNTER17 = 32'hc11;
parameter CSR_HPMCOUNTER18 = 32'hc12;
parameter CSR_HPMCOUNTER19 = 32'hc13;
parameter CSR_HPMCOUNTER20 = 32'hc14;
parameter CSR_HPMCOUNTER21 = 32'hc15;
parameter CSR_HPMCOUNTER22 = 32'hc16;
parameter CSR_HPMCOUNTER23 = 32'hc17;
parameter CSR_HPMCOUNTER24 = 32'hc18;
parameter CSR_HPMCOUNTER25 = 32'hc19;
parameter CSR_HPMCOUNTER26 = 32'hc1a;
parameter CSR_HPMCOUNTER27 = 32'hc1b;
parameter CSR_HPMCOUNTER28 = 32'hc1c;
parameter CSR_HPMCOUNTER29 = 32'hc1d;
parameter CSR_HPMCOUNTER30 = 32'hc1e;
parameter CSR_HPMCOUNTER31 = 32'hc1f;
parameter CSR_SSTATUS = 32'h100;
parameter CSR_SIE = 32'h104;
parameter CSR_STVEC = 32'h105;
parameter CSR_SCOUNTEREN = 32'h106;
parameter CSR_SSCRATCH = 32'h140;
parameter CSR_SEPC = 32'h141;
parameter CSR_SCAUSE = 32'h142;
parameter CSR_STVAL = 32'h143;
parameter CSR_SIP = 32'h144;
parameter CSR_SATP = 32'h180;
parameter CSR_MSTATUS = 32'h300;
parameter CSR_MISA = 32'h301;
parameter CSR_MEDELEG = 32'h302;
parameter CSR_MIDELEG = 32'h303;
parameter CSR_MIE = 32'h304;
parameter CSR_MTVEC = 32'h305;
parameter CSR_MCOUNTEREN = 32'h306;
parameter CSR_MSCRATCH = 32'h340;
parameter CSR_MEPC = 32'h341;
parameter CSR_MCAUSE = 32'h342;
parameter CSR_MTVAL = 32'h343;
parameter CSR_MIP = 32'h344;
parameter CSR_PMPCFG0 = 32'h3a0;
parameter CSR_PMPCFG1 = 32'h3a1;
parameter CSR_PMPCFG2 = 32'h3a2;
parameter CSR_PMPCFG3 = 32'h3a3;
parameter CSR_PMPADDR0 = 32'h3b0;
parameter CSR_PMPADDR1 = 32'h3b1;
parameter CSR_PMPADDR2 = 32'h3b2;
parameter CSR_PMPADDR3 = 32'h3b3;
parameter CSR_PMPADDR4 = 32'h3b4;
parameter CSR_PMPADDR5 = 32'h3b5;
parameter CSR_PMPADDR6 = 32'h3b6;
parameter CSR_PMPADDR7 = 32'h3b7;
parameter CSR_PMPADDR8 = 32'h3b8;
parameter CSR_PMPADDR9 = 32'h3b9;
parameter CSR_PMPADDR10 = 32'h3ba;
parameter CSR_PMPADDR11 = 32'h3bb;
parameter CSR_PMPADDR12 = 32'h3bc;
parameter CSR_PMPADDR13 = 32'h3bd;
parameter CSR_PMPADDR14 = 32'h3be;
parameter CSR_PMPADDR15 = 32'h3bf;
parameter CSR_TSELECT = 32'h7a0;
parameter CSR_TDATA1 = 32'h7a1;
parameter CSR_TDATA2 = 32'h7a2;
parameter CSR_TDATA3 = 32'h7a3;
parameter CSR_DCSR = 32'h7b0;
parameter CSR_DPC = 32'h7b1;
parameter CSR_DSCRATCH = 32'h7b2;
parameter CSR_MCYCLE = 32'hb00;
parameter CSR_MINSTRET = 32'hb02;
parameter CSR_MHPMCOUNTER3 = 32'hb03;
parameter CSR_MHPMCOUNTER4 = 32'hb04;
parameter CSR_MHPMCOUNTER5 = 32'hb05;
parameter CSR_MHPMCOUNTER6 = 32'hb06;
parameter CSR_MHPMCOUNTER7 = 32'hb07;
parameter CSR_MHPMCOUNTER8 = 32'hb08;
parameter CSR_MHPMCOUNTER9 = 32'hb09;
parameter CSR_MHPMCOUNTER10 = 32'hb0a;
parameter CSR_MHPMCOUNTER11 = 32'hb0b;
parameter CSR_MHPMCOUNTER12 = 32'hb0c;
parameter CSR_MHPMCOUNTER13 = 32'hb0d;
parameter CSR_MHPMCOUNTER14 = 32'hb0e;
parameter CSR_MHPMCOUNTER15 = 32'hb0f;
parameter CSR_MHPMCOUNTER16 = 32'hb10;
parameter CSR_MHPMCOUNTER17 = 32'hb11;
parameter CSR_MHPMCOUNTER18 = 32'hb12;
parameter CSR_MHPMCOUNTER19 = 32'hb13;
parameter CSR_MHPMCOUNTER20 = 32'hb14;
parameter CSR_MHPMCOUNTER21 = 32'hb15;
parameter CSR_MHPMCOUNTER22 = 32'hb16;
parameter CSR_MHPMCOUNTER23 = 32'hb17;
parameter CSR_MHPMCOUNTER24 = 32'hb18;
parameter CSR_MHPMCOUNTER25 = 32'hb19;
parameter CSR_MHPMCOUNTER26 = 32'hb1a;
parameter CSR_MHPMCOUNTER27 = 32'hb1b;
parameter CSR_MHPMCOUNTER28 = 32'hb1c;
parameter CSR_MHPMCOUNTER29 = 32'hb1d;
parameter CSR_MHPMCOUNTER30 = 32'hb1e;
parameter CSR_MHPMCOUNTER31 = 32'hb1f;
parameter CSR_MHPMEVENT3 = 32'h323;
parameter CSR_MHPMEVENT4 = 32'h324;
parameter CSR_MHPMEVENT5 = 32'h325;
parameter CSR_MHPMEVENT6 = 32'h326;
parameter CSR_MHPMEVENT7 = 32'h327;
parameter CSR_MHPMEVENT8 = 32'h328;
parameter CSR_MHPMEVENT9 = 32'h329;
parameter CSR_MHPMEVENT10 = 32'h32a;
parameter CSR_MHPMEVENT11 = 32'h32b;
parameter CSR_MHPMEVENT12 = 32'h32c;
parameter CSR_MHPMEVENT13 = 32'h32d;
parameter CSR_MHPMEVENT14 = 32'h32e;
parameter CSR_MHPMEVENT15 = 32'h32f;
parameter CSR_MHPMEVENT16 = 32'h330;
parameter CSR_MHPMEVENT17 = 32'h331;
parameter CSR_MHPMEVENT18 = 32'h332;
parameter CSR_MHPMEVENT19 = 32'h333;
parameter CSR_MHPMEVENT20 = 32'h334;
parameter CSR_MHPMEVENT21 = 32'h335;
parameter CSR_MHPMEVENT22 = 32'h336;
parameter CSR_MHPMEVENT23 = 32'h337;
parameter CSR_MHPMEVENT24 = 32'h338;
parameter CSR_MHPMEVENT25 = 32'h339;
parameter CSR_MHPMEVENT26 = 32'h33a;
parameter CSR_MHPMEVENT27 = 32'h33b;
parameter CSR_MHPMEVENT28 = 32'h33c;
parameter CSR_MHPMEVENT29 = 32'h33d;
parameter CSR_MHPMEVENT30 = 32'h33e;
parameter CSR_MHPMEVENT31 = 32'h33f;
parameter CSR_MVENDORID = 32'hf11;
parameter CSR_MARCHID = 32'hf12;
parameter CSR_MIMPID = 32'hf13;
parameter CSR_MHARTID = 32'hf14;
parameter CSR_CYCLEH = 32'hc80;
parameter CSR_TIMEH = 32'hc81;
parameter CSR_INSTRETH = 32'hc82;
parameter CSR_HPMCOUNTER3H = 32'hc83;
parameter CSR_HPMCOUNTER4H = 32'hc84;
parameter CSR_HPMCOUNTER5H = 32'hc85;
parameter CSR_HPMCOUNTER6H = 32'hc86;
parameter CSR_HPMCOUNTER7H = 32'hc87;
parameter CSR_HPMCOUNTER8H = 32'hc88;
parameter CSR_HPMCOUNTER9H = 32'hc89;
parameter CSR_HPMCOUNTER10H = 32'hc8a;
parameter CSR_HPMCOUNTER11H = 32'hc8b;
parameter CSR_HPMCOUNTER12H = 32'hc8c;
parameter CSR_HPMCOUNTER13H = 32'hc8d;
parameter CSR_HPMCOUNTER14H = 32'hc8e;
parameter CSR_HPMCOUNTER15H = 32'hc8f;
parameter CSR_HPMCOUNTER16H = 32'hc90;
parameter CSR_HPMCOUNTER17H = 32'hc91;
parameter CSR_HPMCOUNTER18H = 32'hc92;
parameter CSR_HPMCOUNTER19H = 32'hc93;
parameter CSR_HPMCOUNTER20H = 32'hc94;
parameter CSR_HPMCOUNTER21H = 32'hc95;
parameter CSR_HPMCOUNTER22H = 32'hc96;
parameter CSR_HPMCOUNTER23H = 32'hc97;
parameter CSR_HPMCOUNTER24H = 32'hc98;
parameter CSR_HPMCOUNTER25H = 32'hc99;
parameter CSR_HPMCOUNTER26H = 32'hc9a;
parameter CSR_HPMCOUNTER27H = 32'hc9b;
parameter CSR_HPMCOUNTER28H = 32'hc9c;
parameter CSR_HPMCOUNTER29H = 32'hc9d;
parameter CSR_HPMCOUNTER30H = 32'hc9e;
parameter CSR_HPMCOUNTER31H = 32'hc9f;
parameter CSR_MCYCLEH = 32'hb80;
parameter CSR_MINSTRETH = 32'hb82;
parameter CSR_MHPMCOUNTER3H = 32'hb83;
parameter CSR_MHPMCOUNTER4H = 32'hb84;
parameter CSR_MHPMCOUNTER5H = 32'hb85;
parameter CSR_MHPMCOUNTER6H = 32'hb86;
parameter CSR_MHPMCOUNTER7H = 32'hb87;
parameter CSR_MHPMCOUNTER8H = 32'hb88;
parameter CSR_MHPMCOUNTER9H = 32'hb89;
parameter CSR_MHPMCOUNTER10H = 32'hb8a;
parameter CSR_MHPMCOUNTER11H = 32'hb8b;
parameter CSR_MHPMCOUNTER12H = 32'hb8c;
parameter CSR_MHPMCOUNTER13H = 32'hb8d;
parameter CSR_MHPMCOUNTER14H = 32'hb8e;
parameter CSR_MHPMCOUNTER15H = 32'hb8f;
parameter CSR_MHPMCOUNTER16H = 32'hb90;
parameter CSR_MHPMCOUNTER17H = 32'hb91;
parameter CSR_MHPMCOUNTER18H = 32'hb92;
parameter CSR_MHPMCOUNTER19H = 32'hb93;
parameter CSR_MHPMCOUNTER20H = 32'hb94;
parameter CSR_MHPMCOUNTER21H = 32'hb95;
parameter CSR_MHPMCOUNTER22H = 32'hb96;
parameter CSR_MHPMCOUNTER23H = 32'hb97;
parameter CSR_MHPMCOUNTER24H = 32'hb98;
parameter CSR_MHPMCOUNTER25H = 32'hb99;
parameter CSR_MHPMCOUNTER26H = 32'hb9a;
parameter CSR_MHPMCOUNTER27H = 32'hb9b;
parameter CSR_MHPMCOUNTER28H = 32'hb9c;
parameter CSR_MHPMCOUNTER29H = 32'hb9d;
parameter CSR_MHPMCOUNTER30H = 32'hb9e;
parameter CSR_MHPMCOUNTER31H = 32'hb9f;
parameter CAUSE_MISALIGNED_FETCH = 5'h0;
parameter CAUSE_FETCH_ACCESS = 5'h1;
parameter CAUSE_ILLEGAL_INSTRUCTION = 5'h2;
parameter CAUSE_BREAKPOINT = 5'h3;
parameter CAUSE_MISALIGNED_LOAD = 5'h4;
parameter CAUSE_LOAD_ACCESS = 5'h5;
parameter CAUSE_MISALIGNED_STORE = 5'h6;
parameter CAUSE_STORE_ACCESS = 5'h7;
parameter CAUSE_USER_ECALL = 5'h8;
parameter CAUSE_SUPERVISOR_ECALL = 5'h9;
parameter CAUSE_HYPERVISOR_ECALL = 5'ha;
parameter CAUSE_MACHINE_ECALL = 5'hb;
parameter CAUSE_FETCH_PAGE_FAULT = 5'hc;
parameter CAUSE_LOAD_PAGE_FAULT = 5'hd;
parameter CAUSE_STORE_PAGE_FAULT = 5'hf;
endpackage
