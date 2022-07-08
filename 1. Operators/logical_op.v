module logical_op();
reg [2:0] a,b,c,d,e;
reg x,y,z;
initial
   begin 
      a = 3; 
	  b = 3'b001; 
	  c = 'bx;
	  d = 'bz;
	  e = 3'b111;
	  
	  x= a && b;
	  y = c || d;
	  z = ! e;
	  
	  $display ("x = %b, y = %b, z = %b", x,y,z);
    end
	
endmodule	


module bitwise_op();
reg [2:0] a,b,c,d,e;
reg v,w,x,y,z;
initial
   begin
      a = 5;
	  b = 3'b101;
	  c = 'bz;
	  d = 'bx;
	  e = 3'b101;
	  v = a & b;
	  w = c | d;
	  x = a ^ e ;
	  y = c ~^ d ;
	  z = ~e;
	  
	  $display ("v = %b w = %b x = %b y = %b z = %b", v,w,x,y,z);
	end
	
endmodule


module reduction_op();
reg [5:0] x;
reg p, q, r, s, t;
initial
   begin
      x = 4'b1110;
	  
	  p = & x;
	  q = | x;
	  r = ^ x;
	  s = ~& x;
	  t = ~^ x;
	  
	  $display ("p = %b q = %b r = %b s = %b t = %b", p,q,r,s,t);
	  end
	  
endmodule


module shift_op();
reg [3:0] a;
reg [3:0] x,y,z,w;
integer b;

initial
   begin
      a = 4'b0110;
	  b = 1;
	  
	 x = a << b;
	 y = a >> b;
	 z = a >>> b;
	 w = a <<< b;
	 
	 $display ("x = %b y = %b z = %b w = %b", x,y,z,w);
	 end
	 
endmodule


module concat_op();
reg a;
reg [2:0] b,c;
reg [7:0] x,y,z;
initial
   begin
      a = 1'b1;
	  b = 3'b010;
	  c = 3'b110;
	  x = {a, b, c};
	  y = {{2{a}}, b, c};
	  z = {b, x[2:1], y[2:0]};
	  
	  $display ("x = %b y = %b z = %b", x,y,z);
	  end
	  
endmodule


module relational_op();
reg [2:0] a,b;
reg [3:0] x,y,z;
reg m,n,o,p,q;
initial
   begin
      a = 5;
	  b = 3;
	  x = 4'b1000;
	  y = 4'b0110;
	  z = 4'b0011;
	  m = a > b;
	  n = a < b;
	  o = x >= y;
	  p = x <= y;
	  q = y >= z;
	  $display ("m evaluates to logical %b", m);
	  $display ("n evaluates to logical %b", n);
	  $display ("o evaluates to logical %b", o);
	  $display ("p evaluates to logical %b", p);
	  $display ("q evaluates to logical %b", q);

	  end
	  
endmodule


module equality_op();
reg [3:0] a,b,c,d;
reg x,y,z,w;
initial
   begin
      a = 4'b1x0z;
	  b = 4'b1x0z;

	  x = a == b;
	  y = a != b;
	  z = a === b;
	  w = a !== b;
	  
	  $display ("x evaluates to logical %b", x);
	  $display ("y evaluates to logical %b", y);
	  $display ("z evaluates to logical %b", z);
	  $display ("w evaluates to logical %b", w);
	  end
	  
endmodule


module conditional_op();
reg [3:0] a,b,c,y,z;
initial
   begin
      a = 4'b1011;
	  b = 4'b1010;
	  c = 4'b1110;
	  y = (&c) ? a : b;
	  z = (c) ? a : b;
	  $display ("y : %b", y);
	  $display ("z : %b", z);
    end
	  
endmodule


module arith_op();
reg [3:0] a,b,c;
integer d,e;
reg [3:0] x,y,z;
integer m,n,o;
initial
   begin
      a = 4'b0010;
	  b = 4'b0011;
	  c = 4'b101x;
	  d = 3;
	  e = 8;
	  
	  x = a * b;
	  y = a + b;
	  z = b - a;
	  m = e / d;
	  n = e % d;
	  o = c * a;
	  $display (" x evaluates to %b", x);
	  $display (" y evaluates to %b", y);
	  $display (" z evaluates to %b", z);
	  $display (" m evaluates to %b", m);
	  $display (" n evaluates to %b", n);
	  $display (" o evaluates to %b", o);
	  end
	  
endmodule
