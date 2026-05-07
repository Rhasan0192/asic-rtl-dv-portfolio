class monitor;

    virtual nand_if vif;

    mailbox #(nand_txn) mbx;

    function new(
        virtual nand_if vif,
        mailbox #(nand_txn) mbx
    );

        this.vif = vif;
        this.mbx = mbx;

    endfunction

    task run();

        nand_txn tx;

        forever begin

            @(posedge vif.clk);

            tx = new();

            tx.a = vif.a;
            tx.b = vif.b;
            tx.y = vif.y;

            mbx.put(tx);

        end

    endtask

endclass