package com.tech.chegaJa.domain.model;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EntregadorDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.math.MathContext;
import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Entregador {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nome;
    private String cpf;
    private BigDecimal pesoMaximo;
    private BigDecimal latitude;
    private BigDecimal longitude;

    public void setCnpj(String cpf) {

    }

    public EntregadorDto toDto(){
        return new EntregadorDto(this.id,this.cpf,this.nome, pesoMaximo);
    }

    public BigDecimal getDistancia(BigDecimal latitude, BigDecimal longitude) {
        BigDecimal primeiro = this.latitude.subtract(latitude).pow(2);
        BigDecimal segundo = this.latitude.subtract(longitude).pow(2);
        return primeiro.add(segundo).sqrt(new MathContext(10));
    }
}
