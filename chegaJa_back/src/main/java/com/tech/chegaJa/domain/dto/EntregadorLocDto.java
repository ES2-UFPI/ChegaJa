package com.tech.chegaJa.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;
@Data
@AllArgsConstructor
public class EntregadorLocDto {
    private BigDecimal latitude;
    private BigDecimal longitude;
}
