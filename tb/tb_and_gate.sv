module tb_and_gate;
    logic a,b;
    logic y;
    and_gate dut (.a(a), .b(b), .y(y));
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_and_gate);
        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;
        $finish;
    end
    
endmodule