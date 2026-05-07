class env;

    generator gen;
    driver drv;
    monitor mon;
    scoreboard sb;

    mailbox #(nand_txn) gen2drv = new();
    mailbox #(nand_txn) mon2sb  = new();

    function new(virtual nand_if vif);

        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2sb);
        sb  = new(mon2sb);

    endfunction

    task run();

        fork
            gen.run();
            drv.run();
            mon.run();
            sb.run();
        join_none

    endtask

endclass