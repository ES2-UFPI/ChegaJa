package com.tech.chegaJa.domain.model;

import com.tech.chegaJa.domain.dto.PacoteDto;
import com.tech.chegaJa.domain.enums.StatusEntregaEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Pacote {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String descricao;
    private String codigoConfirmacao;
    @Enumerated(EnumType.STRING)
    private StatusEntregaEnum status;
    @ManyToOne(fetch = FetchType.EAGER)
    private Cliente cliente;
    private BigDecimal peso;

    public PacoteDto toDto() {
        return new PacoteDto(id,descricao,codigoConfirmacao,status,cliente.toDto(),peso);
    }
}
