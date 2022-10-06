package com.tech.chegaJa.domain.dto;

import com.tech.chegaJa.domain.enums.StatusEntregaEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EntregaDto {
    private Long id;
    private LocalDate data;
    private StatusEntregaEnum status;
    private BigDecimal valorTotal;
    private BigDecimal taxaServico;
    private BigDecimal peso;
    private Long idEmpresa;
    private Long idEntregador;
}
