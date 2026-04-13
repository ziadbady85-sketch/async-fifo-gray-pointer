# Asynchronous FIFO using Gray Code Pointers

Asynchronous FIFO design using Gray-code read/write pointers and 2FF synchronizers for safe clock domain crossing.

## Project Structure

* rtl/FIFO_Write.v
* rtl/FIFO_Read.v
* rtl/FIFO_Memory.v
* rtl/sync_2ff.v
* rtl/FIFO_Buffer.v
* tb/async_FIFO_tb.v

## Features

* Dual clock FIFO
* Gray-code pointers
* 2FF synchronizers
* Full/Empty detection
* Safe CDC design
* Memory buffering

## Simulation

![FIFO Waveform](<img width="975" height="205" alt="image" src="https://github.com/user-attachments/assets/d3864902-97e8-45b0-bd3a-09146bface49" />
)

## Tools

* Verilog HDL
* ModelSim / QuestaSim
* Vivado

## Status

RTL Completed
CDC verified
Full/Empty logic working
