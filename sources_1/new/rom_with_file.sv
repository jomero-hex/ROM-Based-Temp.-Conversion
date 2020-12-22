`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2020 03:19:13 PM
// Design Name: 
// Module Name: rom_with_file
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


module rom_with_file(
    input logic clk,                                            //convertData = address
    input logic [7:0] convertData,                      //addres for F --> C = 181 , 181 + 100 = 281
    input logic formatSignal,                             //need 9 bits, 2^9 = 512
    output logic [7:0] tempConversion              //address C -- > F = 101
    );
    
    //signal declaration
    (*rom_style = "block" *) logic [7:0] rom [0 : 281];      //282 addresses for all data of word size 8-bits
    
    initial
        $readmemh("conv_table.mem", rom);     //address 0 --> C to F, 0 to 100
                                                                            //address 0 --> F to C, 101 to 281
                                                                            
    always_ff @ (posedge clk)
    begin
         tempConversion <= (formatSignal  == 0) ?  rom[convertData] : rom[convertData + 69];         
    end

endmodule

