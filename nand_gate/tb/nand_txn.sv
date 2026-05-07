class nand_txn;

    rand bit [3:0] a;
    rand bit [3:0] b;

    bit [3:0] y;

    function void display(string tag);

        $display("[%s] a=%0h b=%0h y=%0h",
                  tag, a, b, y);

    endfunction

endclass