`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2020 03:00:33 PM
// Design Name: 
// Module Name: reverseBits
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


module reverseBits
    #(parameter N = 8)
    (
    input logic [N-1:0]inData,
    input logic en,
    output logic [N-1:0]outData
    );
    
    logic [N-1:0]reverse;
    
    generate
            genvar i;
            for (i = 0; i < N; i = i +1)
                    assign reverse[N-1-i]=inData[i];
    endgenerate
    
    always_comb
        begin
            case(en)
                1'b0: outData = inData;
                1'b1: outData = reverse;
                default: outData = inData;
            endcase
        end
        
endmodule
