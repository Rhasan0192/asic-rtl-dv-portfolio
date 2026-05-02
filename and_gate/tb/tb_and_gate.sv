module tb_and_gate;

    logic a, b;
    logic y;
    logic exp=0;

    and_gate dut (
        .a(a),
        .b(b),
        .y(y)
    );

    task check;
        exp = a & b;

        if (y !== exp) begin
            $display("❌ ERROR: a=%0b b=%0b y=%0b exp=%0b", a, b, y, exp);
        end else begin
            $display("✔ PASS: a=%0b b=%0b y=%0b", a, b, y);
        end
    endtask

    initial begin
        $display("Starting AND gate verification");

        a=0; b=0;#100; check();
        a=0; b=1;#100; check();
        a=1; b=0;#100; check();
        a=1; b=1; #100; check();

        $display("Test completed");
        $finish;
    end

endmodule