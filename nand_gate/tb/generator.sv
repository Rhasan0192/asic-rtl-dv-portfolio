class generator;

    mailbox #(nand_txn) mbx;

    function new(mailbox #(nand_txn) mbx);
        this.mbx = mbx;
    endfunction

    task run();

        repeat (20) begin

            nand_txn tx;

            tx = new();

            assert(tx.randomize());

            mbx.put(tx);

        end

    endtask

endclass