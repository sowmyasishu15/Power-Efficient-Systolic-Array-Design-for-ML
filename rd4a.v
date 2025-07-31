module rd4a(a,b,cin,sum,cout);
input   [1:0]a,b;
input    cin;
output  [1:0] sum;
output   cout;

wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13;

and(w1,a[1],b[1]);
nor(w2,a[1],b[1]);
and(w3,a[0],cin);
and(w4,b[0],cin);
and(w5,a[0],b[0]);
nor(w6,a[0],b[0]);

not(w7,w2);
nor(w8,w6,w2);

and(w9,cin,w8);
and(w10,w7,w5);
nor(w11,w1,w2);
or(w12,w3,w4,w5);
nor(w13,w5,w6);

or(cout,w9,w10,w1);
xor(sum[1],w11,w12);
xor(sum[0],w13,cin);


endmodule

















