//order 20 least-square FIR LPF, Fs=100kHz, Fpass=9.6kHz, Fstop=10kHz, Wpass=1, Wstop=1, density factor=20
/*
Coefficient created by MATLAB filter design tool:

-0.0041728706   =>  FF77
-0.0238992144   =>  FCF1
-0.0387441704   =>  F97A
-0.0416083421   =>  FAAD
-0.0276033812   =>  FC77
 0.0042047444   =>  008A
 0.0500580349   =>  0668
 0.1020644925   =>  0D10
 0.1499650951   =>  1332
 0.1836575361   =>  1782
 0.1957845978   =>  1780
 0.1836575361   =>  1782
 0.1499650951   =>  1332
 0.1020644925   =>  0D10
 0.0500580349   =>  0668
 0.0042047444   =>  008A
-0.0276033812   =>  FC77
-0.0416083421   =>  FAAD
-0.0387441704   =>  F97A
-0.0238992144   =>  FCF1
-0.0041728706   =>  FF77

    b[i] = (coeff[i] * 2^15) then rounding off the decimal value and take 2's complement if it is negative

*/
module simple_filter(
    input clk,
    input reset,    //active high reset
    input signed[15:0] data_in,
    output reg signed[15:0] data_out
);
    wire signed[15:0] b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19, b20;
    
    reg signed[15:0] pipe0, pipe1, pipe2, pipe3, pipe4, pipe5, pipe6, pipe7, pipe8, pipe9, pipe10, pipe11, pipe12, pipe13, pipe14, pipe15, pipe16, pipe17, pipe18, pipe19, pipe20;
    reg signed[31:0] acc0, acc1, acc2, acc3, acc4, acc5, acc6, acc7, acc8, acc9, acc10, acc11, acc12, acc13, acc14, acc15, acc16, acc17, acc18, acc19, acc20;
    
    //filter tap
    assign b0 = 16'hFF77;
    assign b1 = 16'hFCF1;
    assign b2 = 16'hF97A;
    assign b3 = 16'hFAAD;
    assign b4 = 16'hFC77;
    assign b5 = 16'h008A;
    assign b6 = 16'h0668;
    assign b7 = 16'h0D10;
    assign b8 = 16'h1332;
    assign b9 = 16'h1782;
    assign b10 = 16'h1780;
    assign b11 = 16'h1782;
    assign b12 = 16'h1332;
    assign b13 = 16'h0D10;
    assign b14 = 16'h0668;
    assign b15 = 16'h008A;
    assign b16 = 16'hFC77;
    assign b17 = 16'hFAAD;
    assign b18 = 16'hF97A;
    assign b19 = 16'hFCF1;
    assign b20 = 16'hFF77;
    
    //pipeline stage
    always @(posedge clk)
        if(reset) begin 
            pipe0 <= 0;
            pipe1 <= 0;
            pipe2 <= 0;
            pipe3 <= 0;
            pipe4 <= 0;
            pipe5 <= 0;
            pipe6 <= 0;
            pipe7 <= 0;
            pipe8 <= 0;
            pipe9 <= 0;
            pipe10 <= 0;
            pipe11 <= 0;
            pipe12 <= 0;
            pipe13 <= 0;
            pipe14 <= 0;
            pipe15 <= 0;
            pipe16 <= 0;
            pipe17 <= 0;
            pipe18 <= 0;
            pipe19 <= 0;
            pipe20 <= 0;
        end
        else begin
            pipe0 <= data_in;
            pipe1 <= pipe0;
            pipe2 <= pipe1;
            pipe3 <= pipe2;
            pipe4 <= pipe3;
            pipe5 <= pipe4;
            pipe6 <= pipe5;
            pipe7 <= pipe6;
            pipe8 <= pipe7;
            pipe9 <= pipe8;
            pipe10 <= pipe9;
            pipe11 <= pipe10;
            pipe12 <= pipe11;
            pipe13 <= pipe12;
            pipe14 <= pipe13;
            pipe15 <= pipe14;
            pipe16 <= pipe15;
            pipe17 <= pipe16;
            pipe18 <= pipe17;
            pipe19 <= pipe18;
            pipe20 <= pipe19;
        end
        //accumulation stage
        always @(posedge clk) begin
			acc0 = b0 * pipe0;
			acc1 = b1 * pipe1;
			acc2 = b2 * pipe2;
			acc3 = b3 * pipe3;
			acc4 = b4 * pipe4;
			acc5 = b5 * pipe5;
			acc6 = b6 * pipe6;
			acc7 = b7 * pipe7;
			acc8 = b8 * pipe8;
			acc9 = b9 * pipe9;
			acc10 = b10 * pipe10;
			acc11 = b11 * pipe11;
			acc12 = b12 * pipe12;
			acc13 = b13 * pipe13;
			acc14 = b14 * pipe14;
			acc15 = b15 * pipe15;
			acc16 = b16 * pipe16;
			acc17 = b17 * pipe17;
			acc18 = b18 * pipe18;
			acc19 = b19 * pipe19;
			acc20 = b20 * pipe20;
        end
        //output stage
        always @(posedge clk)
            data_out = acc0 + acc1 + acc2 + acc3 + acc4 + acc5 + acc6 + acc7 + acc8 + acc9 + acc10 + acc11 + acc12 + acc13 + acc14 + acc15 + acc16 + acc17 + acc18 + acc19 + acc20;
        //assign data_out = acc0 + acc1 + acc2 + acc3 + acc4 + acc5 + acc6 + acc7 + acc8 + acc9 + acc10 + acc11 + acc12 + acc13 + acc14 + acc15 + acc16 + acc17 + acc18 + acc19 + acc20;     
endmodule
