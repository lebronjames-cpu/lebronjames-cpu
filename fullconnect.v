`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 14:19:17
// Design Name: 
// Module Name: fullconnect
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


module fullconnect#(
parameter DATA_WIDTH = 16,
parameter DATA_CHANNEL = 32, 
                  
parameter WEIGHT_WIDTH = 16,
parameter WEIGHT_CHANNEL = 32,
parameter WEIGHT_HIGHT = 3,    

parameter BIAS_WIDTH = 16        
)(
input clk,rst_n,
input ena,

input [DATA_WIDTH * DATA_CHANNEL - 1:0]data_in,
input [WEIGHT_WIDTH * WEIGHT_CHANNEL - 1:0]weight_in_1,weight_in_2,weight_in_3,
input [BIAS_WIDTH - 1:0]bias_in_1,bias_in_2,bias_in_3,

output [DATA_WIDTH - 1:0]data_out_1,
output [DATA_WIDTH - 1:0]data_out_2,
output [DATA_WIDTH - 1:0]data_out_3,

output ack
    );

reg [DATA_WIDTH - 1:0]data_channel_1_temp = 0;
reg [DATA_WIDTH - 1:0]data_channel_2_temp = 0;
reg [DATA_WIDTH - 1:0]data_channel_3_temp = 0;

reg [DATA_WIDTH - 1:0]data_out_1_reg = 0;
reg [DATA_WIDTH - 1:0]data_out_2_reg = 0;
reg [DATA_WIDTH - 1:0]data_out_3_reg = 0;

reg [5:0]current_state = 0; //////////32个累加状态，1归零状态
reg [5:0]next_state = 0;
reg ack_reg = 0;
   
assign data_out_1 = data_out_1_reg;
assign data_out_2 = data_out_2_reg;
assign data_out_3 = data_out_3_reg;
assign ack = ack_reg;

always @(posedge clk or negedge rst_n)
    begin
        if (!rst_n)
            current_state <= 6'd0;
        else if (ena)
            current_state <= next_state;
        else       
            current_state <= current_state;
    end

always @(*)
    begin
        next_state = 0;
        case(current_state)
        6'd0:
            next_state = 6'd1;
        6'd1:
            next_state = 6'd2;
        6'd2:
            next_state = 6'd3;
        6'd3:
            next_state = 6'd4;
        6'd4:
            next_state = 6'd5;
        6'd5:
            next_state = 6'd6;
        6'd6:
            next_state = 6'd7;
        6'd7:
            next_state = 6'd8;
        6'd8:
            next_state = 6'd9;
        6'd9:
            next_state = 6'd10;
        6'd10:
            next_state = 6'd11;
        6'd11:
            next_state = 6'd12;
        6'd12:
            next_state = 6'd13;
        6'd13:
            next_state = 6'd14;
        6'd14:
            next_state = 6'd15;
        6'd15:
            next_state = 6'd16;
        6'd16:
            next_state = 6'd17;
        6'd17:
            next_state = 6'd18;
        6'd18:
            next_state = 6'd19;
        6'd19:
            next_state = 6'd20;
        6'd20:
            next_state = 6'd21;
        6'd21:
            next_state = 6'd22;
        6'd22:
            next_state = 6'd23;
        6'd23:
            next_state = 6'd24;
        6'd24:
            next_state = 6'd25;
        6'd25:
            next_state = 6'd26;
        6'd26:
            next_state = 6'd27;
        6'd27:
            next_state = 6'd28;
        6'd28:
            next_state = 6'd29;
        6'd29:
            next_state = 6'd30;
        6'd30:
            next_state = 6'd31;
        6'd31:
            next_state = 6'd32;
        6'd32:
            next_state = 6'd33;
        6'd33:
            next_state = 6'd0;            
        default:
            next_state = next_state;
        endcase
    end

always @(posedge clk or negedge rst_n)
    begin                
        if (!rst_n)
            begin
                data_out_1_reg <= 0;
                data_out_2_reg <= 0;		 
                data_out_3_reg <= 0;
                ack_reg <= 0;
            end
        else 
            begin
                case(current_state)
                6'd0://计算结果清零，输出高电平,乘法器缓存第一步数据
                    begin
                        data_out_1_reg <= 0;
                        data_out_2_reg <= 0;
                        data_out_3_reg <= 0;
                        ack_reg <= 1;
                    end
                6'd1:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end 
                6'd2:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd3:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd4:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd5:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd6:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd7:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd8:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd9:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd10:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd11:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd12:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd13:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd14:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd15:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd16:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd17:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd18:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd19:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd20:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd21:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd22:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd23:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd24:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd25:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd26:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd27:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd28:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd29:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd30:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd31:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end
                6'd32:
                    begin
                        data_out_1_reg <= data_out_1_reg + data_channel_1_temp;
                        data_out_2_reg <= data_out_2_reg + data_channel_2_temp;
                        data_out_3_reg <= data_out_3_reg + data_channel_3_temp;
                        ack_reg <= 0;
                    end    
                6'd33:
                    begin
                        data_out_1_reg <= data_out_1_reg + bias_in_1;
                        data_out_2_reg <= data_out_2_reg + bias_in_2;
                        data_out_3_reg <= data_out_3_reg + bias_in_3;
                        ack_reg <= 0;
                    end                                   
                default:
                    begin
                        data_out_1_reg <= data_out_1_reg;
                        data_out_2_reg <= data_out_2_reg;
                        data_out_3_reg <= data_out_3_reg;
                        ack_reg <= 0;
                    end            
                endcase
            end
    end    

always @(posedge clk)
    begin
        case(current_state)
        6'd0:
            begin
                data_channel_1_temp <= data_in[1 * DATA_WIDTH - 1 : 0 * DATA_WIDTH] * weight_in_1[1 * WEIGHT_WIDTH - 1 : 0 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[1 * DATA_WIDTH - 1 : 0 * DATA_WIDTH] * weight_in_2[1 * WEIGHT_WIDTH - 1 : 0 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[1 * DATA_WIDTH - 1 : 0 * DATA_WIDTH] * weight_in_3[1 * WEIGHT_WIDTH - 1 : 0 * WEIGHT_WIDTH];
            end
        6'd1:
            begin
                data_channel_1_temp <= data_in[2 * DATA_WIDTH - 1 : 1 * DATA_WIDTH] * weight_in_1[2 * WEIGHT_WIDTH - 1 : 1 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[2 * DATA_WIDTH - 1 : 1 * DATA_WIDTH] * weight_in_2[2 * WEIGHT_WIDTH - 1 : 1 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[2 * DATA_WIDTH - 1 : 1 * DATA_WIDTH] * weight_in_3[2 * WEIGHT_WIDTH - 1 : 1 * WEIGHT_WIDTH];
            end
        6'd2:
            begin
                data_channel_1_temp <= data_in[3 * DATA_WIDTH - 1 : 2 * DATA_WIDTH] * weight_in_1[3 * WEIGHT_WIDTH - 1 : 2 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[3 * DATA_WIDTH - 1 : 2 * DATA_WIDTH] * weight_in_2[3 * WEIGHT_WIDTH - 1 : 2 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[3 * DATA_WIDTH - 1 : 2 * DATA_WIDTH] * weight_in_3[3 * WEIGHT_WIDTH - 1 : 2 * WEIGHT_WIDTH];
            end
        6'd3:
            begin
                data_channel_1_temp <= data_in[4 * DATA_WIDTH - 1 : 3 * DATA_WIDTH] * weight_in_1[4 * WEIGHT_WIDTH - 1 : 3 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[4 * DATA_WIDTH - 1 : 3 * DATA_WIDTH] * weight_in_2[4 * WEIGHT_WIDTH - 1 : 3 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[4 * DATA_WIDTH - 1 : 3 * DATA_WIDTH] * weight_in_3[4 * WEIGHT_WIDTH - 1 : 3 * WEIGHT_WIDTH];
            end
        6'd4:
            begin
                data_channel_1_temp <= data_in[5 * DATA_WIDTH - 1 : 4 * DATA_WIDTH] * weight_in_1[5 * WEIGHT_WIDTH - 1 : 4 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[5 * DATA_WIDTH - 1 : 4 * DATA_WIDTH] * weight_in_2[5 * WEIGHT_WIDTH - 1 : 4 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[5 * DATA_WIDTH - 1 : 4 * DATA_WIDTH] * weight_in_3[5 * WEIGHT_WIDTH - 1 : 4 * WEIGHT_WIDTH];
            end
        6'd5:
            begin
                data_channel_1_temp <= data_in[6 * DATA_WIDTH - 1 : 5 * DATA_WIDTH] * weight_in_1[6 * WEIGHT_WIDTH - 1 : 5 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[6 * DATA_WIDTH - 1 : 5 * DATA_WIDTH] * weight_in_2[6 * WEIGHT_WIDTH - 1 : 5 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[6 * DATA_WIDTH - 1 : 5 * DATA_WIDTH] * weight_in_3[6 * WEIGHT_WIDTH - 1 : 5 * WEIGHT_WIDTH];
            end
        6'd6:
            begin
                data_channel_1_temp <= data_in[7 * DATA_WIDTH - 1 : 6 * DATA_WIDTH] * weight_in_1[7 * WEIGHT_WIDTH - 1 : 6 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[7 * DATA_WIDTH - 1 : 6 * DATA_WIDTH] * weight_in_2[7 * WEIGHT_WIDTH - 1 : 6 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[7 * DATA_WIDTH - 1 : 6 * DATA_WIDTH] * weight_in_3[7 * WEIGHT_WIDTH - 1 : 6 * WEIGHT_WIDTH];
            end
        6'd7:
            begin
                data_channel_1_temp <= data_in[8 * DATA_WIDTH - 1 : 7 * DATA_WIDTH] * weight_in_1[8 * WEIGHT_WIDTH - 1 : 7 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[8 * DATA_WIDTH - 1 : 7 * DATA_WIDTH] * weight_in_2[8 * WEIGHT_WIDTH - 1 : 7 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[8 * DATA_WIDTH - 1 : 7 * DATA_WIDTH] * weight_in_3[8 * WEIGHT_WIDTH - 1 : 7 * WEIGHT_WIDTH];
            end
        6'd8:
            begin
                data_channel_1_temp <= data_in[9 * DATA_WIDTH - 1 : 8 * DATA_WIDTH] * weight_in_1[9 * WEIGHT_WIDTH - 1 : 8 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[9 * DATA_WIDTH - 1 : 8 * DATA_WIDTH] * weight_in_2[9 * WEIGHT_WIDTH - 1 : 8 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[9 * DATA_WIDTH - 1 : 8 * DATA_WIDTH] * weight_in_3[9 * WEIGHT_WIDTH - 1 : 8 * WEIGHT_WIDTH];
            end
        6'd9:
            begin
                data_channel_1_temp <= data_in[10 * DATA_WIDTH - 1 : 9 * DATA_WIDTH] * weight_in_1[10 * WEIGHT_WIDTH - 1 : 9 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[10 * DATA_WIDTH - 1 : 9 * DATA_WIDTH] * weight_in_2[10 * WEIGHT_WIDTH - 1 : 9 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[10 * DATA_WIDTH - 1 : 9 * DATA_WIDTH] * weight_in_3[10 * WEIGHT_WIDTH - 1 : 9 * WEIGHT_WIDTH];
            end
        6'd10:
            begin
                data_channel_1_temp <= data_in[11 * DATA_WIDTH - 1 : 10 * DATA_WIDTH] * weight_in_1[11 * WEIGHT_WIDTH - 1 : 10 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[11 * DATA_WIDTH - 1 : 10 * DATA_WIDTH] * weight_in_2[11 * WEIGHT_WIDTH - 1 : 10 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[11 * DATA_WIDTH - 1 : 10 * DATA_WIDTH] * weight_in_3[11 * WEIGHT_WIDTH - 1 : 10 * WEIGHT_WIDTH];
            end
        6'd11:
            begin
                data_channel_1_temp <= data_in[12 * DATA_WIDTH - 1 : 11 * DATA_WIDTH] * weight_in_1[12 * WEIGHT_WIDTH - 1 : 11 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[12 * DATA_WIDTH - 1 : 11 * DATA_WIDTH] * weight_in_2[12 * WEIGHT_WIDTH - 1 : 11 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[12 * DATA_WIDTH - 1 : 11 * DATA_WIDTH] * weight_in_3[12 * WEIGHT_WIDTH - 1 : 11 * WEIGHT_WIDTH];
            end
        6'd12:
            begin
                data_channel_1_temp <= data_in[13 * DATA_WIDTH - 1 : 12 * DATA_WIDTH] * weight_in_1[13 * WEIGHT_WIDTH - 1 : 12 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[13 * DATA_WIDTH - 1 : 12 * DATA_WIDTH] * weight_in_2[13 * WEIGHT_WIDTH - 1 : 12 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[13 * DATA_WIDTH - 1 : 12 * DATA_WIDTH] * weight_in_3[13 * WEIGHT_WIDTH - 1 : 12 * WEIGHT_WIDTH];
            end
        6'd13:
            begin
                data_channel_1_temp <= data_in[14 * DATA_WIDTH - 1 : 13 * DATA_WIDTH] * weight_in_1[14 * WEIGHT_WIDTH - 1 : 13 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[14 * DATA_WIDTH - 1 : 13 * DATA_WIDTH] * weight_in_2[14 * WEIGHT_WIDTH - 1 : 13 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[14 * DATA_WIDTH - 1 : 13 * DATA_WIDTH] * weight_in_3[14 * WEIGHT_WIDTH - 1 : 13 * WEIGHT_WIDTH];
            end
        6'd14:
            begin
                data_channel_1_temp <= data_in[15 * DATA_WIDTH - 1 : 14 * DATA_WIDTH] * weight_in_1[15 * WEIGHT_WIDTH - 1 : 14 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[15 * DATA_WIDTH - 1 : 14 * DATA_WIDTH] * weight_in_2[15 * WEIGHT_WIDTH - 1 : 14 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[15 * DATA_WIDTH - 1 : 14 * DATA_WIDTH] * weight_in_3[15 * WEIGHT_WIDTH - 1 : 14 * WEIGHT_WIDTH];
            end
        6'd15:
            begin
                data_channel_1_temp <= data_in[16 * DATA_WIDTH - 1 : 15 * DATA_WIDTH] * weight_in_1[16 * WEIGHT_WIDTH - 1 : 15 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[16 * DATA_WIDTH - 1 : 15 * DATA_WIDTH] * weight_in_2[16 * WEIGHT_WIDTH - 1 : 15 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[16 * DATA_WIDTH - 1 : 15 * DATA_WIDTH] * weight_in_3[16 * WEIGHT_WIDTH - 1 : 15 * WEIGHT_WIDTH];
            end
        6'd16:
            begin
                data_channel_1_temp <= data_in[17 * DATA_WIDTH - 1 : 16 * DATA_WIDTH] * weight_in_1[17 * WEIGHT_WIDTH - 1 : 16 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[17 * DATA_WIDTH - 1 : 16 * DATA_WIDTH] * weight_in_2[17 * WEIGHT_WIDTH - 1 : 16 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[17 * DATA_WIDTH - 1 : 16 * DATA_WIDTH] * weight_in_3[17 * WEIGHT_WIDTH - 1 : 16 * WEIGHT_WIDTH];
            end
        6'd17:
            begin
                data_channel_1_temp <= data_in[18 * DATA_WIDTH - 1 : 17 * DATA_WIDTH] * weight_in_1[18 * WEIGHT_WIDTH - 1 : 17 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[18 * DATA_WIDTH - 1 : 17 * DATA_WIDTH] * weight_in_2[18 * WEIGHT_WIDTH - 1 : 17 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[18 * DATA_WIDTH - 1 : 17 * DATA_WIDTH] * weight_in_3[18 * WEIGHT_WIDTH - 1 : 17 * WEIGHT_WIDTH];
            end
        6'd18:
            begin
                data_channel_1_temp <= data_in[19 * DATA_WIDTH - 1 : 18 * DATA_WIDTH] * weight_in_1[19 * WEIGHT_WIDTH - 1 : 18 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[19 * DATA_WIDTH - 1 : 18 * DATA_WIDTH] * weight_in_2[19 * WEIGHT_WIDTH - 1 : 18 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[19 * DATA_WIDTH - 1 : 18 * DATA_WIDTH] * weight_in_3[19 * WEIGHT_WIDTH - 1 : 18 * WEIGHT_WIDTH];
            end
        6'd19:
            begin
                data_channel_1_temp <= data_in[20 * DATA_WIDTH - 1 : 19 * DATA_WIDTH] * weight_in_1[20 * WEIGHT_WIDTH - 1 : 19 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[20 * DATA_WIDTH - 1 : 19 * DATA_WIDTH] * weight_in_2[20 * WEIGHT_WIDTH - 1 : 19 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[20 * DATA_WIDTH - 1 : 19 * DATA_WIDTH] * weight_in_3[20 * WEIGHT_WIDTH - 1 : 19 * WEIGHT_WIDTH];
            end
        6'd20:
            begin
                data_channel_1_temp <= data_in[21 * DATA_WIDTH - 1 : 20 * DATA_WIDTH] * weight_in_1[21 * WEIGHT_WIDTH - 1 : 20 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[21 * DATA_WIDTH - 1 : 20 * DATA_WIDTH] * weight_in_2[21 * WEIGHT_WIDTH - 1 : 20 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[21 * DATA_WIDTH - 1 : 20 * DATA_WIDTH] * weight_in_3[21 * WEIGHT_WIDTH - 1 : 20 * WEIGHT_WIDTH];
            end
        6'd21:
            begin
                data_channel_1_temp <= data_in[22 * DATA_WIDTH - 1 : 21 * DATA_WIDTH] * weight_in_1[22 * WEIGHT_WIDTH - 1 : 21 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[22 * DATA_WIDTH - 1 : 21 * DATA_WIDTH] * weight_in_2[22 * WEIGHT_WIDTH - 1 : 21 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[22 * DATA_WIDTH - 1 : 21 * DATA_WIDTH] * weight_in_3[22 * WEIGHT_WIDTH - 1 : 21 * WEIGHT_WIDTH];
            end
        6'd22:
            begin
                data_channel_1_temp <= data_in[23 * DATA_WIDTH - 1 : 22 * DATA_WIDTH] * weight_in_1[23 * WEIGHT_WIDTH - 1 : 22 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[23 * DATA_WIDTH - 1 : 22 * DATA_WIDTH] * weight_in_2[23 * WEIGHT_WIDTH - 1 : 22 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[23 * DATA_WIDTH - 1 : 22 * DATA_WIDTH] * weight_in_3[23 * WEIGHT_WIDTH - 1 : 22 * WEIGHT_WIDTH];
            end
        6'd23:
            begin
                data_channel_1_temp <= data_in[24 * DATA_WIDTH - 1 : 23 * DATA_WIDTH] * weight_in_1[24 * WEIGHT_WIDTH - 1 : 23 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[24 * DATA_WIDTH - 1 : 23 * DATA_WIDTH] * weight_in_2[24 * WEIGHT_WIDTH - 1 : 23 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[24 * DATA_WIDTH - 1 : 23 * DATA_WIDTH] * weight_in_3[24 * WEIGHT_WIDTH - 1 : 23 * WEIGHT_WIDTH];
            end
        6'd24:
            begin
                data_channel_1_temp <= data_in[25 * DATA_WIDTH - 1 : 24 * DATA_WIDTH] * weight_in_1[25 * WEIGHT_WIDTH - 1 : 24 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[25 * DATA_WIDTH - 1 : 24 * DATA_WIDTH] * weight_in_2[25 * WEIGHT_WIDTH - 1 : 24 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[25 * DATA_WIDTH - 1 : 24 * DATA_WIDTH] * weight_in_3[25 * WEIGHT_WIDTH - 1 : 24 * WEIGHT_WIDTH];
            end
        6'd25:
            begin
                data_channel_1_temp <= data_in[26 * DATA_WIDTH - 1 : 25 * DATA_WIDTH] * weight_in_1[26 * WEIGHT_WIDTH - 1 : 25 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[26 * DATA_WIDTH - 1 : 25 * DATA_WIDTH] * weight_in_2[26 * WEIGHT_WIDTH - 1 : 25 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[26 * DATA_WIDTH - 1 : 25 * DATA_WIDTH] * weight_in_3[26 * WEIGHT_WIDTH - 1 : 25 * WEIGHT_WIDTH];
            end
        6'd26:
            begin
                data_channel_1_temp <= data_in[27 * DATA_WIDTH - 1 : 26 * DATA_WIDTH] * weight_in_1[27 * WEIGHT_WIDTH - 1 : 26 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[27 * DATA_WIDTH - 1 : 26 * DATA_WIDTH] * weight_in_2[27 * WEIGHT_WIDTH - 1 : 26 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[27 * DATA_WIDTH - 1 : 26 * DATA_WIDTH] * weight_in_3[27 * WEIGHT_WIDTH - 1 : 26 * WEIGHT_WIDTH];
            end
        6'd27:
            begin
                data_channel_1_temp <= data_in[28 * DATA_WIDTH - 1 : 27 * DATA_WIDTH] * weight_in_1[28 * WEIGHT_WIDTH - 1 : 27 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[28 * DATA_WIDTH - 1 : 27 * DATA_WIDTH] * weight_in_2[28 * WEIGHT_WIDTH - 1 : 27 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[28 * DATA_WIDTH - 1 : 27 * DATA_WIDTH] * weight_in_3[28 * WEIGHT_WIDTH - 1 : 27 * WEIGHT_WIDTH];
            end
        6'd28:
            begin
                data_channel_1_temp <= data_in[29 * DATA_WIDTH - 1 : 28 * DATA_WIDTH] * weight_in_1[29 * WEIGHT_WIDTH - 1 : 28 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[29 * DATA_WIDTH - 1 : 28 * DATA_WIDTH] * weight_in_2[29 * WEIGHT_WIDTH - 1 : 28 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[29 * DATA_WIDTH - 1 : 28 * DATA_WIDTH] * weight_in_3[29 * WEIGHT_WIDTH - 1 : 28 * WEIGHT_WIDTH];
            end
        6'd29:
            begin
                data_channel_1_temp <= data_in[30 * DATA_WIDTH - 1 : 29 * DATA_WIDTH] * weight_in_1[30 * WEIGHT_WIDTH - 1 : 29 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[30 * DATA_WIDTH - 1 : 29 * DATA_WIDTH] * weight_in_2[30 * WEIGHT_WIDTH - 1 : 29 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[30 * DATA_WIDTH - 1 : 29 * DATA_WIDTH] * weight_in_3[30 * WEIGHT_WIDTH - 1 : 29 * WEIGHT_WIDTH];
            end
        6'd30:
            begin
                data_channel_1_temp <= data_in[31 * DATA_WIDTH - 1 : 30 * DATA_WIDTH] * weight_in_1[31 * WEIGHT_WIDTH - 1 : 30 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[31 * DATA_WIDTH - 1 : 30 * DATA_WIDTH] * weight_in_2[31 * WEIGHT_WIDTH - 1 : 30 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[31 * DATA_WIDTH - 1 : 30 * DATA_WIDTH] * weight_in_3[31 * WEIGHT_WIDTH - 1 : 30 * WEIGHT_WIDTH];
            end
        6'd31:
            begin
                data_channel_1_temp <= data_in[32 * DATA_WIDTH - 1 : 31 * DATA_WIDTH] * weight_in_1[32 * WEIGHT_WIDTH - 1 : 31 * WEIGHT_WIDTH];
                data_channel_2_temp <= data_in[32 * DATA_WIDTH - 1 : 31 * DATA_WIDTH] * weight_in_2[32 * WEIGHT_WIDTH - 1 : 31 * WEIGHT_WIDTH];
                data_channel_3_temp <= data_in[32 * DATA_WIDTH - 1 : 31 * DATA_WIDTH] * weight_in_3[32 * WEIGHT_WIDTH - 1 : 31 * WEIGHT_WIDTH];
            end    
        default:
            begin
                data_channel_1_temp <= data_channel_1_temp;
                data_channel_2_temp <= data_channel_2_temp;
                data_channel_3_temp <= data_channel_3_temp;
            end          
        endcase            
    end
      
endmodule