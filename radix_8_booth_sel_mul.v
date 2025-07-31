module radix_8_booth_sel_mul(x,y,op);
input [7:0]x,y;
output [15:0]op;

reg [15:0]p1,p2,p3;

wire [4:0]c1,c2,c3; 
wire [15:0]y_v,y2_v,y3_v;
wire [12:0]sum,carry;

function [4:0] cont_line;
input [3:0] x;
reg s,d,t,q,n;
begin
    
    s=~(x[3]^x[2]) & (x[1]^x[0]);
    d=(x[1]^x[2]) & ~(x[1]^x[0]);
    t=(x[3]^x[2]) & (x[1]^x[0]);
    q=(x[3]^x[2]) & ~(x[1]^x[2]) & ~(x[1]^x[0]);
    n=x[3];
    
    cont_line={s,d,t,q,n};
    
end    
endfunction 

  
           
assign c1 = cont_line({x[2:0],1'b0});
assign c2 = cont_line(x[5:2]);
assign c3 = cont_line({x[7],x[7:5]});

assign   y_v  = {y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y};
assign   y2_v = {y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7:0],1'b0};

hcp_adder uh(y_v,y2_v,y3_v);
      
always@(y,c1,c2,c3,y3_v)
begin      
                
case(c1[4:1])
    4'b0000:p1=16'b0;
    4'b1000:begin
            if(c1[0]==1'b0) 
                p1={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y};
            else
                p1=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y} + 1;
            end    
    4'b0100:begin
            if(c1[0]==1'b0) 
                p1={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0};
            else
                p1=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0} + 1;
            end            
    4'b0010:begin
            if(c1[0]==1'b0) 
                p1=y3_v;
            else
                p1=~y3_v + 1;                
            end            
    4'b0001:begin
            if(c1[0]==1'b0) 
                p1={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0};
            else
                p1=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0} + 1;
            end            
endcase


case(c2[4:1])
    4'b0000:p2=16'b0;
    4'b1000:begin
            if(c2[0]==1'b0) 
                p2={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y};
            else
                p2=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y} + 1;
            end    
    4'b0100:begin
            if(c2[0]==1'b0) 
                p2={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0};
            else
                p2=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0} + 1;
            end            
    4'b0010:begin
            if(c2[0]==1'b0) 
                p2=y3_v;
            else 
                p2=~y3_v + 1;
            end            
    4'b0001:begin
            if(c2[0]==1'b0) 
                p2={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0};
            else
                p2=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0} + 1;
            end            
endcase



case(c3[4:1])
    4'b0000:p3=16'b0;
    4'b1000:begin
            if(c3[0]==1'b0) 
                p3={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y};
            else
                p3=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y} + 1;
            end    
    4'b0100:begin
            if(c3[0]==1'b0) 
                p3={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0};
            else
                p3=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0} + 1;
            end            
    4'b0010:begin
            if(c3[0]==1'b0) 
                p3=y3_v;
            else
                p3=~y3_v + 1;
            end            
    4'b0001:begin
            if(c3[0]==1'b0) 
                p3={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0};
            else
                p3=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0} + 1;
            end            
endcase


end
 
//fulladder u0(p1[0],1'b0,1'b0,sum[0],carry[0]);
//fulladder u1(p1[1],1'b0,1'b0,sum[1],carry[1]);
//fulladder u2(p1[2],1'b0,1'b0,sum[2],carry[2]);
halfadder u3(p1[3],p2[0],sum[0],carry[0]);
halfadder u4(p1[4],p2[1],sum[1],carry[1]);
halfadder u5(p1[5],p2[2],sum[2],carry[2]);
fulladder u6(p1[6],p2[3],p3[0],sum[3],carry[3]);
fulladder u7(p1[7],p2[4],p3[1],sum[4],carry[4]);
fulladder u8(p1[8],p2[5],p3[2],sum[5],carry[5]);
fulladder u9(p1[9],p2[6],p3[3],sum[6],carry[6]);
fulladder u10(p1[10],p2[7],p3[4],sum[7],carry[7]);
fulladder u11(p1[11],p2[8],p3[5],sum[8],carry[8]);
fulladder u12(p1[12],p2[9],p3[6],sum[9],carry[9]);
fulladder u13(p1[13],p2[10],p3[7],sum[10],carry[10]);
fulladder u14(p1[14],p2[11],p3[8],sum[11],carry[11]);
fulladder u15(p1[15],p2[12],p3[9],sum[12],carry[12]);

assign op[0]=p1[0];
assign op[1]=p1[1];
assign op[2]=p1[2];
assign op[3]=sum[0];

rd4a u16(sum[2:1],carry[1:0],1'b0,op[5:4],m1);
rd4a u17(sum[4:3],carry[3:2],m1,op[7:6],m2);

rd4a u18(sum[6:5],carry[5:4],m2,op[9:8],m3);
rd4a u19(sum[8:7],carry[7:6],m3,op[11:10],m4);
rd4a u20(sum[10:9],carry[9:8],m4,op[13:12],m5);
rd4a u21(sum[12:11],carry[11:10],m5,op[15:14],m6);

endmodule





