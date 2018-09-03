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
// Description: Testbench settings
package trdb_tb_pkg;

    import trdb_pkg::*;
    
    parameter int DEBUG = 1;

    // stimuli file
    const string stimuli_path = "trdb/data/trdb_stimuli";

    // clock and acquisition related settings
    const time CLK_PHASE_HI         = 5ns;
    const time CLK_PHASE_LO         = 5ns;
    const time CLK_PERIOD           = CLK_PHASE_HI + CLK_PHASE_LO;
    const time STIM_APPLICATION_DEL = CLK_PERIOD * 0.1;
    const time RESP_ACQUISITION_DEL = CLK_PERIOD * 0.9;
    const time RESET_DEL            = STIM_APPLICATION_DEL;

    const int  RESET_WAIT_CYCLES    = 4;

    // 
    typedef struct {
        logic      ivalid;
        logic      iexception;
        logic      interrupt;
        logic [CAUSELEN-1:0] cause;
        logic [XLEN-1:0]     tval;
        logic [PRIVLEN-1:0]  priv;
        logic [XLEN-1:0]     iaddr;
        logic [ILEN-1:0] instr;
        logic            compressed;
    } trdb_instr;

`include "../tb/stimuli.svh"
`include "../tb/driver.svh"
`include "../tb/monitor.svh"

endpackage // trdb_tb_pkg
    
