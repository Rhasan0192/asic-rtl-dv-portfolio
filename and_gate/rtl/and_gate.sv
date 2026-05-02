module and_gate (
    input logic a,
    input logic b,
    output logic y
);
always_comb begin : and_block
    y=a & b;
end
    
endmodule