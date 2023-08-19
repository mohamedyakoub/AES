`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2023 07:13:13 PM
// Design Name: 
// Module Name: Key_exp
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


module Key_exp(
    input clk,
    input [127:0] key,
    input [3:0] count,
    output  [127:0] out_key
    );
     reg [7:0] rc;
     reg [7:0]  k [0:15];
     wire [31:0] w [0:3];
     wire [7:0] b [0:3];
     wire [7:0] c [0:3];
     wire [31:0] out ;
     reg [127:0] expanded_key;
            
//     assign k1[0] =       expanded_key[127:120];      
//     assign k1[1] =       expanded_key[119:112];     
//     assign k1[2] =       expanded_key[111:104];     
//     assign k1[3] =       expanded_key[103:96];       
//     assign k1[4] =       expanded_key[95:88];       
//     assign k1[5] =       expanded_key[87:80];       
//     assign k1[6] =       expanded_key[79:72];       
//     assign k1[7] =       expanded_key[71:64];       
//     assign k1[8] =       expanded_key[63:56];       
//     assign k1[9] =       expanded_key[55:48];       
//     assign k1[10]=       expanded_key[47:40];       
//     assign k1[11]=       expanded_key[39:32];       
//     assign k1[12]=       expanded_key[31:24];       
//     assign k1[13]=       expanded_key[23:16];       
//     assign k1[14]=       expanded_key[15:8];         
//     assign k1[15]=       expanded_key[7:0];  
      always@(*)begin
      if (count==0) begin
              k[0] =                 key[127:120];       
              k[1] =                 key[119:112];        
              k[2] =                 key[111:104];        
              k[3] =                 key[103:96] ;        
              k[4] =                 key[95:88]  ;        
              k[5] =                 key[87:80]  ;        
              k[6] =                 key[79:72]  ;        
              k[7] =                 key[71:64]  ;        
              k[8] =                 key[63:56]  ;        
              k[9] =                 key[55:48]  ;        
              k[10]=                 key[47:40]  ;        
              k[11]=                 key[39:32]  ;        
              k[12]=                 key[31:24]  ;        
              k[13]=                 key[23:16]  ;        
              k[14]=                 key[15:8]   ;        
              k[15]=                 key[7:0]    ;        
      end
      else begin
              k[0] =  expanded_key[127:120];
              k[1] =  expanded_key[119:112];
              k[2] =  expanded_key[111:104];
              k[3] =  expanded_key[103:96]; 
              k[4] =  expanded_key[95:88];  
              k[5] =  expanded_key[87:80];  
              k[6] =  expanded_key[79:72];  
              k[7] =  expanded_key[71:64];  
              k[8] =  expanded_key[63:56];  
              k[9] =  expanded_key[55:48];  
              k[10]=  expanded_key[47:40];  
              k[11]=  expanded_key[39:32];  
              k[12]=  expanded_key[31:24];  
              k[13]=  expanded_key[23:16];  
              k[14]=  expanded_key[15:8];   
              k[15]=  expanded_key[7:0];   
      end
         
      end
  
     assign w[0]=     {k[0],k[1],k[2],k[3]};
     assign w[1]=     {k[4],k[5],k[6],k[7]};
     assign w[2]=   {k[8],k[9],k[10],k[11]};
     assign w[3]= {k[12],k[13],k[14],k[15]} ;
    
     assign b[0]=k[13];
     assign b[1]=k[14];
     assign b[2]=k[15];
     assign b[3]=k[12];
     generate
    genvar i;
    for(i=0; i<4; i=i+1)
    begin:sbox
    
    SBox box(.addr(b[i]),.dout(c[i]));
    
    end
    endgenerate
    always@(*)begin
        case(count)
            0:rc='h01;
            1:rc='h02;
            2:rc='h04;
            3:rc='h08;
            4:rc='h10;
            5:rc='h20;
            6:rc='h40;
            7:rc='h80;
            8:rc='h1B;
            9:rc='h36;
            default rc=36;
         endcase
    end
    assign  out={rc^c[0],c[1],c[2],c[3]};
    
    
    always@(posedge clk) begin
     if(count<=8) 
      expanded_key<= {w[0]^out,(w[0]^out)^w[1],((w[0]^out)^w[1])^w[2],(((w[0]^out)^w[1])^w[2])^w[3]};
    end
    
    assign out_key={w[0]^out,(w[0]^out)^w[1],((w[0]^out)^w[1])^w[2],(((w[0]^out)^w[1])^w[2])^w[3]};
//    function [7:0] rc(input [7:0] a,
//                      input [3:0]c);
    
//    begin
//         case(c)
//            1:rc=a^'h01;
//            2:rc=a^'h02;
//            3:rc=a^'h04;
//            4:rc=a^'h08;
//            5:rc=a^'h10;
//            6:rc=a^'h20;
//            7:rc=a^'h40;
//            8:rc=a^'h80;
//            9:rc=a^'h1B;
//            10:rc=a^'h36;
//            default a=a;
//         endcase
//    end
    
//    endfunction
    
endmodule
