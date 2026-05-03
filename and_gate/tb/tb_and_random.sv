module tb_and_random;

    parameter WIDTH = 4;

    logic [WIDTH-1:0] a, b;
    logic [WIDTH-1:0] y;

    and_gate #(.WIDTH(WIDTH)) dut (.a(a), .b(b), .y(y));

    initial begin
        $display("Random Test");

        repeat (20) begin
            a = $urandom;
            b = $urandom;
            #1;

            if (y !== (a & b)) begin
                $error("Mismatch: a=%0h b=%0h y=%0h", a, b, y);
            end
        end

        $display("Random test completed");
        $finish;
    end

endmodule