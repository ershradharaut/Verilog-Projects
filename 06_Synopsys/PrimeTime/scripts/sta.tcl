# ============================================================
# Smart Railway Interlocking System
# PrimeTime Static Timing Analysis
# ============================================================

set TOP railway_top

# ------------------------------------------------------------
# Paths
# ------------------------------------------------------------

set DC_OUTPUT "../../Design_Compiler/output"
set REPORT_PATH "../reports"

# ------------------------------------------------------------
# Standard-cell timing library
# ------------------------------------------------------------

set LIB_PATH "/home/sveri/Downloads/SAED05nm_EDK_06_2026/SAED05_EDK/SAED05nm_EDK_STD_RVT/liberty/nldm/base"

set TARGET_LIB "$LIB_PATH/saed05rvt_base_tt0p75v25c.db"

# ------------------------------------------------------------
# Library setup
# ------------------------------------------------------------

set_app_var search_path [list . $LIB_PATH]
set_app_var link_path "* $TARGET_LIB"

# ------------------------------------------------------------
# Read synthesized netlist
# ------------------------------------------------------------

read_verilog "$DC_OUTPUT/railway_top_synth.v"

current_design $TOP

# ------------------------------------------------------------
# Link design
# ------------------------------------------------------------

link

# ------------------------------------------------------------
# Read Design Compiler constraints
# ------------------------------------------------------------

read_sdc "$DC_OUTPUT/railway_top.sdc"

# ------------------------------------------------------------
# Update timing
# ------------------------------------------------------------

update_timing

# ------------------------------------------------------------
# Design information
# ------------------------------------------------------------

report_design \
    > "$REPORT_PATH/railway_design.rpt"

report_clock \
    > "$REPORT_PATH/railway_clock.rpt"

# ------------------------------------------------------------
# Setup timing analysis
# ------------------------------------------------------------

report_timing \
    -delay_type max \
    -max_paths 20 \
    -path_type full_clock_expanded \
    > "$REPORT_PATH/railway_setup.rpt"

# ------------------------------------------------------------
# Hold timing analysis
# ------------------------------------------------------------

report_timing \
    -delay_type min \
    -max_paths 20 \
    -path_type full_clock_expanded \
    > "$REPORT_PATH/railway_hold.rpt"

# ------------------------------------------------------------
# Constraint violations
# ------------------------------------------------------------

report_constraint \
    -all_violators \
    > "$REPORT_PATH/railway_constraints.rpt"

# ------------------------------------------------------------
# Global timing summary
# ------------------------------------------------------------

report_global_timing \
    > "$REPORT_PATH/railway_global_timing.rpt"

# ------------------------------------------------------------
# Timing checks
# ------------------------------------------------------------

check_timing \
    > "$REPORT_PATH/railway_check_timing.rpt"

# ------------------------------------------------------------
# QoR
# ------------------------------------------------------------

report_qor \
    > "$REPORT_PATH/railway_qor.rpt"

# ------------------------------------------------------------
# Final message
# ------------------------------------------------------------

echo "============================================================"
echo "PRIMETIME STA COMPLETED"
echo "TOP MODULE : railway_top"
echo "LIBRARY    : SAED05 RVT TT 0.75V 25C"
echo "============================================================"

exit
