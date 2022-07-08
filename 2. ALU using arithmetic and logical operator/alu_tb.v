module alu_tb();

reg [7:0] a,b;
reg [3:0] command;
reg enable;
wire [15:0] out;
integer m,n,o;

parameter 
ADD	=4'b0000,
INC	=4'b0001,
SUB	=4'b0010,
DEC	=4'b0011,
MUL	=4'b0100,
DIV	=4'b0101,
SHL	=4'b0110,
SHR	=4'b0111,
INV	=4'b1000,
AND	=4'b1001,
OR	=4'b1010,
NAND	=4'b1011,
NOR	=4'b1100,
XOR	=4'b1101,
XNOR	=4'b1110,
BUF	=4'b1111;

reg [4*8:0]string_cmd;

alu DUT(a,b,command,enable,out);

task initialize;
begin
{a,b,command,enable}=0;
end
endtask

task en_oe(input i);
begin 
enable=i;
end
endtask

task inputs(input [7:0] j,k);
begin
a=j;
b=k;
end
endtask

task cmd (input [3:0] l);
begin
command=l;
end
endtask

task delay();
begin
#10;
end
endtask

always@(command)
begin
case (command)
ADD	: string_cmd = "ADD";
INC	: string_cmd = "INC";
SUB	: string_cmd = "SUB";
DEC	: string_cmd = "DEC";
MUL	: string_cmd = "MUL";
DIV	: string_cmd = "DIV";
SHL	: string_cmd = "SHL";
SHR	: string_cmd = "SHR";
INV	: string_cmd = "INV";
AND	: string_cmd = "ADD";
OR	: string_cmd = "OR";
NAND	: string_cmd = "NAND";
NOR	: string_cmd = "NOR";
XOR	: string_cmd = "XOR";
XNOR	: string_cmd = "XNOR";
BUF	: string_cmd = "BUF";
endcase
end

initial
begin
initialize;
en_oe(1'b1);
inputs(8'b11000100,8'b01011100);

for (o=0;o<16;o=o+1)
begin
command=o;
delay;
end

en_oe(1'b0);
inputs(8'd20,8'd10);
cmd(ADD);
delay;
en_oe(1);
inputs(8'd25,8'd17);
cmd(ADD);
delay;
$finish;
end

initial
$monitor ("input oe=%b, a=%b, b=%b, command=%s, output out=%b",enable,a,b,string_cmd,out);

endmodule
