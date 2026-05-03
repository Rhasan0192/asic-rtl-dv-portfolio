module tb_and_direct;

    parameter WIDTH = 4;

    logic [WIDTH-1:0] a, b;
    logic [WIDTH-1:0] y;

    int pass_count = 0;
    int fail_count = 0;

    and_gate #(.WIDTH(WIDTH)) dut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Check task
    task check;
        logic [WIDTH-1:0] exp;
        exp = a & b;

        if (y !== exp) begin
            $display(" FAIL: a=%0h b=%0h y=%0h exp=%0h", a, b, y, exp);
            fail_count++;
        end else begin
            $display(" PASS: a=%0h b=%0h y=%0h", a, b, y);
            pass_count++;
        end
    endtask

    initial begin
        $display("=== Directed Test (WIDTH=%0d) ===", WIDTH);

        // Directed cases (basic sanity)
        a = '0; b = '0; #1; check();
        a = '0; b = '1; #1; check();
        a = '1; b = '0; #1; check();
        a = '1; b = '1; #1; check();

        $display("----------------------------------");
        $display("PASSED: %0d  FAILED: %0d", pass_count, fail_count);

        if (fail_count == 0)
            $display("TEST PASSED");
        else
            $display(" TEST FAILED");

        $finish;
    end

endmodule