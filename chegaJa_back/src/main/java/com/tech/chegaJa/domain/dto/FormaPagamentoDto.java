package com.tech.chegaJa.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FormaPagamentoDto{
    private Long id;
    private String numeroCartao;
    private String bandeira;
    private LocalDate datavencimento;
    private String codigo;
    private String nomeTitular;
    private String tipoPagamento;
}
