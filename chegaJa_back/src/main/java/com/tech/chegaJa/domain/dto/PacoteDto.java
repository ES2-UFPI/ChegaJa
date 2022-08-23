package com.tech.chegaJa.domain.dto;

import com.tech.chegaJa.domain.enums.StatusEntregaEnum;
import com.tech.chegaJa.domain.model.Cliente;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
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
    private Long idCliente;
    private BigDecimal peso;
    //comentario
}
