package com.tech.chegaJa.domain.form;

import com.tech.chegaJa.domain.model.Entregador;
import com.tech.chegaJa.domain.model.FormaPagamento;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FormaPagamentoForm {
    private String numeroCartao;
    private String bandeira;
    private LocalDate datavencimento;
    private String codigo;
    private String nomeTitular;
    private String tipoPagamento;

    public FormaPagamento toEntity() {
        FormaPagamento forma = new FormaPagamento();
        forma.setBandeira(bandeira);
        forma.setCodigo(codigo);
        forma.setDatavencimento(datavencimento);
        forma.setNomeTitular(nomeTitular);
        forma.setTipoPagamento(tipoPagamento);
        return forma;
    }
}
