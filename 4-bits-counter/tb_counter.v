`timescale 1ns / 1ps // Define a unidade de tempo (1 nanossegundo)

module tb_counter;

    // Sinais para conectar no nosso módulo
    reg clk;
    reg rst_n;
    wire [3:0] out;

    // Instancia o nosso Design (DUT - Device Under Test)
    counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .out(out)
    );

    // 1. Gerador de Clock (Isso simula o cristal oscilador da placa)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Inverte o clock a cada 5ns (Período = 10ns)
    end

    // 2. O Roteiro do Teste
    initial begin
        // Configuração para gerar o arquivo de ondas para o GTKWave
        $dumpfile("waves.vcd"); // Nome do arquivo de saída
        $dumpvars(0, tb_counter); // Salvar todas as variáveis desse módulo

        // Cenário de Teste
        $display("Iniciando Simulação...");

        rst_n = 0; // Segura o reset apertado
        #20;       // Espera 20ns
        rst_n = 1; // Solta o reset (começa a contar)

        #200;      // Deixa rodar por 200ns (o contador vai subir)

        rst_n = 0; // Aperta o reset de novo pra ver se zera
        #20;
        rst_n = 1;

        #50;
        $display("Fim da Simulação.");
        $finish; // Encerra a simulação
    end

endmodule