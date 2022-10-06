package com.tech.chegaJa.domain.form;

import com.tech.chegaJa.domain.model.DadosBancario;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DadoBancarioForm {
    private String conta;
    private String agencia;
    private String banco;
    private String tipoConta;

    public DadosBancario toEntity() {
        DadosBancario dado= new DadosBancario();
        dado.setAgencia(agencia);
        dado.setConta(conta);
        dado.setBanco(banco);
        dado.setTipoConta(tipoConta);
        return dado;
    }
}
