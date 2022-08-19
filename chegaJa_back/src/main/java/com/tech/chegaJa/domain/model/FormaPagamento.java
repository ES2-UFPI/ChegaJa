package com.tech.chegaJa.domain.model;

import com.tech.chegaJa.domain.dto.FormaPagamentoDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class FormaPagamento {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String numeroCartao;
    private String bandeira;
    private LocalDate datavencimento;
    private String codigo;
    private String nomeTitular;
    private String tipoPagamento;

    public FormaPagamentoDto toDto() {
        return new FormaPagamentoDto(id,numeroCartao,bandeira,datavencimento,codigo,nomeTitular,tipoPagamento);
    }
}
