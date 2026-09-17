#!/bin/csh

# ============================================================
# Railway Interlocking System - VCS Compilation Script
# ============================================================
# Purpose:
#   Compile all RTL modules and the railway_top testbench
#   using Synopsys VCS.
#
# Working directory:
#   05_Verification/Simulation_Scripts
# ============================================================


# ------------------------------------------------------------
# RTL and Testbench paths
# ------------------------------------------------------------

set RTL_PATH = ../../04_RTL_Design
set TB_PATH  = ../tb


# ------------------------------------------------------------
# Verdi PLI path
# Used for FSDB waveform generation and Verdi debugging
# ------------------------------------------------------------

set VERDI_PLI = /home/sveri/Synopsys/ufe_optional_spyglass-vcs/U-2023.03-SP2/SPYGLASS_HOME/lib/multi-vcst/verdi/share/PLI/VCS/linux64


# ------------------------------------------------------------
# Clean old simulation executable and database
# ------------------------------------------------------------

rm -rf simv
rm -rf simv.daidir
rm -rf simv.vdb
rm -rf csrc


# ------------------------------------------------------------
# Compile and elaborate the complete design
# ------------------------------------------------------------

vcs -full64 \
-kdb \
-timescale=1ns/1ps \
-debug_access+all \
-cm line+cond+fsm+tgl+branch \
-cm_dir simv.vdb \
+v2k \
-sverilog \
-P $VERDI_PLI/novas.tab \
$VERDI_PLI/pli.a \
-f $RTL_PATH/filelist.f \
$TB_PATH/railway_top_tb.v \
-o simv


# ------------------------------------------------------------
# Check whether compilation created simv
# ------------------------------------------------------------

if (-f simv) then

    echo ""
    echo "============================================================"
    echo " VCS COMPILATION SUCCESSFUL"
    echo "============================================================"
    echo "Simulation executable created:"
    ls -lh simv
    echo "============================================================"
    echo ""

else

    echo ""
    echo "============================================================"
    echo " ERROR: simv executable was NOT created"
    echo "============================================================"
    echo ""

endif
