module tb_or_unified;
parameter WIDTH =4;

logic clk;
logic [WIDTH-1:0] a,b;
logic [WIDTH-1 : 0] y;

int pass =0;
int fail =0;

//DUT 

or_gate #(.WIDTH(WIDTH))  dut (.a(a), .b(b), .y(y));

//clock
initial clk=0;
always #5 clk = ~clk;

//scorebaord reference  

function logic [WIDTH-1:0] ref_model(
    input logic [WIDTH-1:0] a,
    input logic [WIDTH-1:0] b
);
return a | b;
    
endfunction

//assertion 

property or_check;
@(posedge clk)
y==ref_model(a,b);
endproperty

assert property (or_check)
else   begin 
    fail++;
    $display("Assert FAIL: a=%0h b=%0h y=%0h exp=%0h", a,b,y,ref_model(a,b));
end

//functional coverage 

covergroup cg @(posedge clk);
coverpoint a;
coverpoint b;
coverpoint y; 
cross a,b;
endgroup

cg cov = new();

//Task- Apply stimulus

task apply (input logic [WIDTH-1:0] aa, 
            input logic [WIDTH-1:0] bb);
    a=aa;
    b=bb;
    @(posedge clk);

    if (y===ref_model(a,b)) begin
        pass++;
        $display ("PASS: a=%0h  b=%0h  y=%0h", a,b,y);
    end
    else begin
        fail++;
        $display ("FAIL: a=%0h  b=%0h  y=%0h", a,b,y);
    end
endtask


// Test sequence
initial begin
        $display("==== OR Gate Unified Verification ====");

        // Directed tests
        apply('0, '0);
        apply('0, '1);
        apply('1, '0);
        apply('1, '1);

        // Random tests
        repeat (20) begin
            apply($urandom % (1<<WIDTH),
                  $urandom % (1<<WIDTH));
        end

        // Summary
        $display("----------------------------------");
        $display("PASS=%0d FAIL=%0d", pass, fail);

        if (fail == 0)
            $display(" TEST PASSED");
        else
            $display(" TEST FAILED");

        $finish;
    end

endmodule