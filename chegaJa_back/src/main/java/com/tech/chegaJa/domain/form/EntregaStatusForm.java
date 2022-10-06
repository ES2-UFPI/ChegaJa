package com.tech.chegaJa.domain.form;

import com.tech.chegaJa.domain.enums.StatusEntregaEnum;
import lombok.Data;

@Data
public class EntregaStatusForm {
    private StatusEntregaEnum status;
}
