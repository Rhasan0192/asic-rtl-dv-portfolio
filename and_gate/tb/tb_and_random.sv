module tb_and_random;

    parameter WIDTH = 4;

    logic [WIDTH-1:0] a, b;
    logic [WIDTH-1:0] y;
    int pass = 0;
    int fail = 0;


    and_gate #(.WIDTH(WIDTH)) dut (.a(a), .b(b), .y(y));

    initial begin
        pass=0;
        fail=0;
        $display("=======Random Test=======");
        
        repeat (20) begin
            a = $urandom % (1 <<WIDTH);
            b = $urandom % (1 <<WIDTH);
            #1;

            if (y !== (a & b)) begin
                fail++;
                $display("❌ FAIL: a=%0h b=%0h y=%0h exp=%0h", a, b, y, (a & b));
            end
            else begin
                pass++;
                $display("✔ PASS: a=%0h b=%0h y=%0h", a, b, y);
            end
        end

    $display("PASS=%0d FAIL=%0d", pass, fail);

        $display("Random test completed");
        $finish;
    end

endmodule