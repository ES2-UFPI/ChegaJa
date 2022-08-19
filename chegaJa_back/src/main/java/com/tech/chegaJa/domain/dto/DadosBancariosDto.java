package com.tech.chegaJa.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DadosBancariosDto {
    private Long id;
    private String conta;
    private String agência;
    private String banco;
    private String tipoConta;
}
