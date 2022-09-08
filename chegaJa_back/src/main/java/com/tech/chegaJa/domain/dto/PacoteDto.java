package com.tech.chegaJa.domain.dto;

import com.tech.chegaJa.domain.enums.StatusEntregaEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PacoteDto {
    private Long id;
    private String descricao;
    private String codigoConfirmacao;
    @Enumerated(EnumType.STRING)
    private StatusEntregaEnum status;
    private ClienteDto clienteDto;
    private BigDecimal peso;
    //comentario
}
