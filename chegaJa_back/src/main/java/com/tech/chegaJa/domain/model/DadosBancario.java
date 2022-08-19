package com.tech.chegaJa.domain.model;

import com.tech.chegaJa.domain.dto.DadosBancariosDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class DadosBancario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String conta;
    private String agencia;
    private String banco;
    private String tipoConta;

    public DadosBancariosDto toDto() {
        return new DadosBancariosDto(id,conta,agencia,banco,tipoConta);
    }
}
