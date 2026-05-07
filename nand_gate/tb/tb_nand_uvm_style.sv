import nand_pkg::*;

module tb_nand_uvm_style;

    parameter WIDTH = 4;

    nand_if #(WIDTH) vif();

    nand_gate #(.WIDTH(WIDTH)) dut (
        .a(vif.a),
        .b(vif.b),
        .y(vif.y)
    );

    env e;

    initial begin

        vif.clk = 0;

    end

    always #5 vif.clk = ~vif.clk;

    initial begin

        e = new(vif);

        e.run();

        #500;

        $display("Simulation completed");

        $finish;

    end

endmodule