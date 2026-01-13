module counter (
    input clk,          // Clock do sistema
    input rst_n,        // Reset ativo em nível baixo (padrão de mercado)
    output reg [3:0] out // Saída de 4 bits (0 a 15)
);

    // Lógica Sequencial: Acontece na borda de subida do clock
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // Se o reset for 0 (pressionado), zera tudo
            out <= 4'b0000;
        end else begin
            // Senão, incrementa +1
            out <= out + 1;
        end
    end

endmodule