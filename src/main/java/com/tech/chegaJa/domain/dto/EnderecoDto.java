package com.tech.chegaJa.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EnderecoDto {
    private Long id;
    private String bairro;
    private String logradouro;
    private String complemento;
    private String cep;
    private String longitude;
    private String latitude;
    private String uf;
    private String numeroCasa;

}
