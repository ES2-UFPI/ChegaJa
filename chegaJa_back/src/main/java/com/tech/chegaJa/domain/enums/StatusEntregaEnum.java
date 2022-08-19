package com.tech.chegaJa.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum StatusEntregaEnum {
        EM_ANDAMENTO("Em andamento"),
        FINALIZADA("Finalizada"),
        SOLICITADA("Solicitada");

        private String descricao;
}
