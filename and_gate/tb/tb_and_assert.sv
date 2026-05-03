module tb_and_assert;

    parameter WIDTH = 4;

    logic clk;
    logic [WIDTH-1:0] a, b;
    logic [WIDTH-1:0] y;

    int pass;
    int fail;

    and_gate #(.WIDTH(WIDTH)) dut (.a(a), .b(b), .y(y));

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Assertion (clocked)
    property and_check;
        @(posedge clk)
        y == (a & b);
    endproperty

    assert property (and_check)
    else begin
        fail++;
        $display("❌ FAIL (SVA): a=%0h b=%0h y=%0h exp=%0h", a, b, y, (a & b));
    end

    // Stimulus + PASS tracking
    initial begin
        pass = 0;
        fail = 0;

        $display("======= Assertion Test =======");

        repeat (20) begin
            a = $urandom % (1 << WIDTH);
            b = $urandom % (1 << WIDTH);

            @(posedge clk);  // align with assertion check

            // If no failure occurred at this cycle → PASS
            if (y === (a & b)) begin
                pass++;
                $display("✔ PASS: a=%0h b=%0h y=%0h", a, b, y);
            end
        end

        $display("----------------------------------");
        $display("PASS=%0d FAIL=%0d", pass, fail);
        $display("Assertion test completed");

        $finish;
    end

endmodule