`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2020 09:51:59 AM
// Design Name: 
// Module Name: NbitBarrelShifter
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

module NbitBarrelShifter
    #(parameter N = 8)
    (
        input logic [N - 1:0]data,     
        input logic [$clog2(N) - 1:0] shiftAmt,     //$clog2(N) = log base 2 of (N)
        output logic [N -1 :0]f
    );
    
    //local constant declaration
     localparam N1 = $clog2(N);                     
    
    //signal declarations
     logic [N -1:0] r  [N1-1 : 0];                        
     
      //rotate right
      
      assign r[0] = shiftAmt[0] ? {data[0], data[N - 1 : 1]} : data;     //Stage 0, rotate by 0 or 1
      
      generate
            genvar i;
            for (i = 0; i < N1 - 1; i = i +1)
                    assign r[i + 1] = shiftAmt[i + 1] ? {r[i] [2 ** (i + 1) - 1 : 0], r[i] [N - 1 : 2 ** (i + 1)]} : r[i];          //stage N, rotate by 0 or N
      endgenerate                                                                                                                                                    //2**i = 2^i
      
      assign f = r[N1 - 1];   
      
endmodule
