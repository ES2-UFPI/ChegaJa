package com.tech.chegaJa.domain.model;

import com.tech.chegaJa.domain.dto.EmpresaDto;
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
public class Empresa extends Usuario{

    private String cnpj;
    private String nome;

    public EmpresaDto toDto(){
        return new EmpresaDto(this.id,this.cnpj,this.nome);
    }
}
