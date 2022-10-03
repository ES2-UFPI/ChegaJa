package com.tech.chegaJa.domain.model;

import com.tech.chegaJa.domain.dto.ClienteDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Cliente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nome;
    private String contato;
    @ManyToOne(fetch = FetchType.EAGER)
    private Endereco endereco;

    public ClienteDto toDto(){
        return new ClienteDto(id,nome,contato,endereco.toDto());
    }
}