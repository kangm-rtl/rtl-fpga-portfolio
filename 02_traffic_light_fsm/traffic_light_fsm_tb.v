
`timescale 1ns/1ps

module traffic_light_fsm_tb;

    reg clk;
    reg reset_n;

    wire red;
    wire yellow;
    wire green;

    // 테스트 대상 회로 연결
    traffic_light_fsm dut (
        .clk(clk),
        .reset_n(reset_n),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // 10ns 주기의 클록 생성
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // 테스트 시나리오
    initial begin
    reset_n = 1'b0;

    #12;
    reset_n = 1'b1;

    // 첫 상승 에지 이후 YELLOW 확인
    @(posedge clk);
    #1;
        if (yellow !== 1'b1 || green !== 1'b0 || red !== 1'b0)
            $fatal(1, "FAIL: Expected YELLOW");
        else
            $display("PASS: YELLOW");

        // 두 번째 상승 에지 이후 RED 확인
        @(posedge clk);
        #1;
        if (red !== 1'b1 || yellow !== 1'b0 || green !== 1'b0)
            $fatal(1, "FAIL: Expected RED");
        else
            $display("PASS: RED");

        // 세 번째 상승 에지 이후 GREEN 확인
        @(posedge clk);
        #1;
        if (green !== 1'b1 || yellow !== 1'b0 || red !== 1'b0)
            $fatal(1, "FAIL: Expected GREEN");
        else
            $display("PASS: GREEN");

        $display("ALL FSM TESTS PASSED");
        $finish;

    end

    // 출력 자동 검사
    always @(negedge clk) begin
        if (reset_n) begin
            if ((green + yellow + red) != 1) begin
                $display("FAIL: LED 출력 오류");
                $finish;
            end
            else begin
                $display("PASS CHECK: R=%b Y=%b G=%b",
                         red, yellow, green);
            end
        end
    end

endmodule
