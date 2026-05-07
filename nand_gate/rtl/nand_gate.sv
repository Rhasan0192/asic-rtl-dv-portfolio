module nand_gate #(
    parameter WIDTH=4
) (
    input logic [WIDTH-1:0] a,
    input logic [WIDTH-1:0] b,
    output logic [WIDTH-1:0] y
);
    always_comb begin : nand_gate
        y= ~(a & b) ;
    end
endmodule