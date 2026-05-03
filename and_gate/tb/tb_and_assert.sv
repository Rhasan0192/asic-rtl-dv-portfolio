module tb_and_assert;

    parameter WIDTH = 4;

    logic [WIDTH-1:0] a, b;
    logic [WIDTH-1:0] y;

    and_gate #(.WIDTH(WIDTH)) dut (.a(a), .b(b), .y(y));

    // Assertion
    property and_check;
        y == (a & b);
    endproperty

    assert property (and_check)
        else $error("Assertion failed!");

    initial begin
        $display("Assertion Test");

        repeat (20) begin
            a = $urandom;
            b = $urandom;
            #1;
        end

        $display("Assertion test completed");
        $finish;
    end

endmodule