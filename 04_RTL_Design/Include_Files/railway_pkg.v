`ifndef RAILWAY_PKG_VH
`define RAILWAY_PKG_VH

//==================================================
// RAILWAY PROJECT CONFIGURATION
//==================================================
// This header file contains common parameters and
// state encodings used by the railway interlocking
// design.
//
// NOTE:
// This file uses only plain Verilog syntax.
// No SystemVerilog typedef, enum, logic, package,
// struct, always_ff or always_comb is used.
//==================================================


//--------------------------------------------------
// 1. STATION CONFIGURATION
//--------------------------------------------------
// These parameters define the basic resources
// available in the railway station.
//
// NUM_PLATFORMS : Total number of station platforms
// NUM_TRACKS    : Total number of railway tracks
// NUM_SIGNALS   : Total number of railway signals
// NUM_SWITCHES  : Total number of point switches
//--------------------------------------------------

parameter NUM_PLATFORMS = 5;
parameter NUM_TRACKS    = 8;
parameter NUM_SIGNALS   = 16;
parameter NUM_SWITCHES  = 10;


//--------------------------------------------------
// 2. TRAIN STATE ENCODING
//--------------------------------------------------
// These 2-bit values represent the different
// operating states of a train.
//
// TRAIN_IDLE     : No active train request
// TRAIN_REQUEST  : Train request is being processed
// TRAIN_MOVING   : Train is moving through the route
// TRAIN_COMPLETE : Train movement is completed
//
// 2 bits are sufficient to represent 4 states.
//--------------------------------------------------

parameter TRAIN_IDLE     = 2'b00;
parameter TRAIN_REQUEST  = 2'b01;
parameter TRAIN_MOVING   = 2'b10;
parameter TRAIN_COMPLETE = 2'b11;


//--------------------------------------------------
// 3. SIGNAL STATE ENCODING
//--------------------------------------------------
// These 2-bit values represent railway signal
// aspects.
//
// SIGNAL_RED     : Train must stop
// SIGNAL_YELLOW  : Caution / prepare to stop
// SIGNAL_GREEN   : Route is clear / train may proceed
// SIGNAL_BLUE    : Additional project-defined signal
//                  state
//
// 2 bits are sufficient to represent 4 states.
//--------------------------------------------------

parameter SIGNAL_RED     = 2'b00;
parameter SIGNAL_YELLOW  = 2'b01;
parameter SIGNAL_GREEN   = 2'b10;
parameter SIGNAL_BLUE    = 2'b11;


//==================================================
// END OF RAILWAY PACKAGE DEFINITIONS
//==================================================

`endif
