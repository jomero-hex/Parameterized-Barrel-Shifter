`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2020 02:59:18 PM
// Design Name: 
// Module Name: Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top
    #(parameter N = 8)
    (
    input logic [N-1:0]data,
    input logic lr,
    input logic [$clog2(N) - 1:0] shiftAmt,
    output logic [N-1:0]f
    );
    
    logic [N-1:0] rev0, rev1;
    
    reverseBits m0(.inData(data), .en(lr), .outData(rev0));
    
    NbitBarrelShifter m1(.data(rev0), .shiftAmt(shiftAmt), .f(rev1));
    
    reverseBits m2(.inData(rev1), .en(lr), .outData(f));
    
endmodule
