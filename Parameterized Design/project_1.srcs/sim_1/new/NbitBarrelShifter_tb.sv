`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2020 09:53:17 AM
// Design Name: 
// Module Name: NbitBarrelShifter_tb
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


module NbitBarrelShifter_tb;
    localparam N = 8;
    localparam x = $clog2(N) - 1;
    
    logic [N-1:0]data;
    logic lr;
    logic [x:0] shiftAmt;
    logic [N-1:0]f;
    
    Top  #(.N(N)) uut0 (.*);
                    
    initial begin
    shiftAmt = 0; 
    lr = 0; 
    data = 8'b00100011;
    #10 shiftAmt = 1;  
    #10 shiftAmt = 2;   
    #10 shiftAmt = 3;   
    #10 shiftAmt = 4;   
    #10 shiftAmt = 5;  
    #10 shiftAmt = 6;  
    #10 shiftAmt = 7;  
    #10 shiftAmt = 8;  
    #10 shiftAmt = 0;  lr = 1; 
    #10 shiftAmt = 1;   
    #10 shiftAmt = 2;   
    #10 shiftAmt = 3;   
    #10 shiftAmt = 4;   
    #10 shiftAmt = 5;  
    #10 shiftAmt = 6;  
    #10 shiftAmt = 7;  
    #10 shiftAmt = 8;  
    #10 
    $stop; //stop the simulation and return the control to the software application
    end
endmodule
