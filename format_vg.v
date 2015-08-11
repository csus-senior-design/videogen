module format_vg
    (
        input [7:0] FORMAT,
        output reg INTERLACED,
        output reg [11:0] V_TOTAL_0,
        output reg [11:0] V_FP_0,
        output reg [11:0] V_BP_0,
        output reg [11:0] V_SYNC_0,
        output reg [11:0] V_TOTAL_1,
        output reg [11:0] V_FP_1,
        output reg [11:0] V_BP_1,
        output reg [11:0] V_SYNC_1,
        output reg [11:0] H_TOTAL,
        output reg [11:0] H_FP,
        output reg [11:0] H_BP,
        output reg [11:0] H_SYNC,
        output reg [11:0] HV_OFFSET_0,
        output reg [11:0] HV_OFFSET_1,
        output reg [19:0] PATTERN_RAMP_STEP
    );

    localparam F_CEA_1_640x480p    = 8'd1,
               F_CEA_4_1280x720p   = 8'd4,
               F_CEA_5_1920x1080i  = 8'd5,
               F_CEA_16_1920x1080p = 8'd16,
               F_VESA_1280x800p    = 8'd128;
    
    always @ (FORMAT) begin
        case (FORMAT)
            F_CEA_1_640x480p: begin
                INTERLACED  <= 1'b0;
                V_TOTAL_0   <= 12'd525;
                V_FP_0      <= 12'd10;
                V_BP_0      <= 12'd33;
                V_SYNC_0    <= 12'd2;
                V_TOTAL_1   <= 12'd0;
                V_FP_1      <= 12'd0;
                V_BP_1      <= 12'd0;
                V_SYNC_1    <= 12'd0;
                H_TOTAL     <= 12'd800;
                H_FP        <= 12'd16;
                H_BP        <= 12'd48;
                H_SYNC      <= 12'd96;
                HV_OFFSET_0 <= 12'd0;
                HV_OFFSET_1 <= 12'd0;
                PATTERN_RAMP_STEP <= 20'h0666; // 20'hFFFFF / 640 pixels per line = 20'h0666
            end
            
            F_CEA_4_1280x720p: begin
                INTERLACED  <= 1'b0;
                V_TOTAL_0   <= 12'd750;
                V_FP_0      <= 12'd5;
                V_BP_0      <= 12'd20;
                V_SYNC_0    <= 12'd5;
                V_TOTAL_1   <= 12'd0;
                V_FP_1      <= 12'd0;
                V_BP_1      <= 12'd0;
                V_SYNC_1    <= 12'd0;
                H_TOTAL     <= 12'd1650;
                H_FP        <= 12'd110;
                H_BP        <= 12'd220;
                H_SYNC      <= 12'd40;
                HV_OFFSET_0 <= 12'd0;
                HV_OFFSET_1 <= 12'd0;
                PATTERN_RAMP_STEP <= 20'h0333; // 20'hFFFFF / 1280 pixels per line = 20'h0333
            end
            
            F_CEA_5_1920x1080i: begin
                INTERLACED  <= 1'b1;
                V_TOTAL_0   <= 12'd562;
                V_FP_0      <= 12'd2;
                V_BP_0      <= 12'd15;
                V_SYNC_0    <= 12'd5;
                V_TOTAL_1   <= 12'd563;
                V_FP_1      <= 12'd2;
                V_BP_1      <= 12'd16;
                V_SYNC_1    <= 12'd5;
                H_TOTAL     <= 12'd2200;
                H_FP        <= 12'd88;
                H_BP        <= 12'd148;
                H_SYNC      <= 12'd44;
                HV_OFFSET_0 <= 12'd0;
                HV_OFFSET_1 <= 12'd1100;
                PATTERN_RAMP_STEP <= 20'h0222; // 20'hFFFFF / 1920 pixels per line = 20'h0222
            end
            
            F_CEA_16_1920x1080p: begin
                INTERLACED  <= 1'b0;
                V_TOTAL_0   <= 12'd1125;
                V_FP_0      <= 12'd4;
                V_BP_0      <= 12'd36;
                V_SYNC_0    <= 12'd5;
                V_TOTAL_1   <= 12'd0;
                V_FP_1      <= 12'd0;
                V_BP_1      <= 12'd0;
                V_SYNC_1    <= 12'd0;
                H_TOTAL     <= 12'd2200;
                H_FP        <= 12'd88;
                H_BP        <= 12'd148;
                H_SYNC      <= 12'd44;
                HV_OFFSET_0 <= 12'd0;
                HV_OFFSET_1 <= 12'd0;
                PATTERN_RAMP_STEP <= 20'h0222; // 20'hFFFFF / 1920 pixels per line = 20'h0222
            end
            
            F_VESA_1280x800p: begin
                INTERLACED  <= 1'b0;
                V_TOTAL_0   <= 12'd828;
                V_FP_0      <= 12'd1;
                V_BP_0      <= 12'd24;
                V_SYNC_0    <= 12'd3;
                V_TOTAL_1   <= 12'd0;
                V_FP_1      <= 12'd0;
                V_BP_1      <= 12'd0;
                V_SYNC_1    <= 12'd0;
                H_TOTAL     <= 12'd1680;
                H_FP        <= 12'd64;
                H_BP        <= 12'd200;
                H_SYNC      <= 12'd136;
                HV_OFFSET_0 <= 12'd0;
                HV_OFFSET_1 <= 12'd0;
                PATTERN_RAMP_STEP <= 20'h0333; // 20'hFFFFF / 1280 pixels per line = 20'h0333
            end
            
            default: begin
                INTERLACED  <= 1'b0;
                V_TOTAL_0   <= 12'd0;
                V_FP_0      <= 12'd0;
                V_BP_0      <= 12'd0;
                V_SYNC_0    <= 12'd0;
                V_TOTAL_1   <= 12'd0;
                V_FP_1      <= 12'd0;
                V_BP_1      <= 12'd0;
                V_SYNC_1    <= 12'd0;
                H_TOTAL     <= 12'd0;
                H_FP        <= 12'd0;
                H_BP        <= 12'd0;
                H_SYNC      <= 12'd0;
                HV_OFFSET_0 <= 12'd0;
                HV_OFFSET_1 <= 12'd0;
                PATTERN_RAMP_STEP <= 20'h0;
            end
        endcase
    end
endmodule
    