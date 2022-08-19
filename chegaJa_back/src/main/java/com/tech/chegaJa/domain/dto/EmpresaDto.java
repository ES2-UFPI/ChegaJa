package com.tech.chegaJa.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpresaDto {
    private Long id;
    private String cnpj;
    private String nome;
}
