class driver;

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

        forever begin

            nand_txn tx;

            mbx.get(tx);

            vif.a <= tx.a;
            vif.b <= tx.b;

            @(posedge vif.clk);

        end

    endtask

endclass