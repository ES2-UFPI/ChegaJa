package com.tech.chegaJa.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EntregadorDto {
    private Long id;
    private String nome;
    private String cpf;
    private BigDecimal pesoMaximo;
}
