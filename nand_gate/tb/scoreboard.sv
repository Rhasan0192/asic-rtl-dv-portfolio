class scoreboard;

    mailbox #(nand_txn) mbx;

    int pass = 0;
    int fail = 0;

    function new(mailbox #(nand_txn) mbx);

        this.mbx = mbx;

    endfunction

    function bit [3:0] ref_model(
        bit [3:0] a,
        bit [3:0] b
    );

        return ~(a & b);

    endfunction

    task run();

        forever begin

            nand_txn tx;

            mbx.get(tx);

            if (tx.y === ref_model(tx.a, tx.b)) begin

                pass++;
                tx.display("PASS");

            end
            else begin

                fail++;
                tx.display("FAIL");

            end

        end

    endtask

endclass