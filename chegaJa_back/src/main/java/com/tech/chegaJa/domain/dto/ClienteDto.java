package com.tech.chegaJa.domain.dto;

import com.tech.chegaJa.domain.model.Endereco;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClienteDto {
    private Long id;
    private String nome;
    private String contato;
    private Long idEndereco;
    //comentario
}
