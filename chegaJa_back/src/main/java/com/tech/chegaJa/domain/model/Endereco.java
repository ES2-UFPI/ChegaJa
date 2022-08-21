package com.tech.chegaJa.domain.model;

import com.tech.chegaJa.domain.dto.EnderecoDto;
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
public class Endereco {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String bairro;
    private String logradouro;
    private String complemento;
    private String cep;
    private String longitude;
    private String latitude;
    private String uf;
    private String numeroCasa;

    public EnderecoDto toDto() {
        return new EnderecoDto(id,bairro,logradouro,complemento,cep,longitude,latitude,uf,numeroCasa);
    }
}
