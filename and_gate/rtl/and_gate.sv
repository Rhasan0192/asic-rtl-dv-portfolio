module and_gate #(
    parameter WIDTH =1
)    
(
    input logic [WIDTH-1:0] a,
    input logic [WIDTH-1:0] b,
    output logic [WIDTH-1:0] y
);
always_comb begin : and_block
    y=a & b;
end
    
endmodule