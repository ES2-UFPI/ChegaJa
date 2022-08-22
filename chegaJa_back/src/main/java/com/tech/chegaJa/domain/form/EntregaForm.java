package com.tech.chegaJa.domain.form;

import com.tech.chegaJa.domain.enums.StatusEntregaEnum;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.domain.model.Entrega;
import com.tech.chegaJa.domain.model.Entregador;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EntregaForm {
    private LocalDate data;
    private StatusEntregaEnum status;
    private BigDecimal valorTotal;
    private BigDecimal taxaServico;
    private BigDecimal peso;
    private Long idEmpresa;
    private Long idEntregador;

    public Entrega toEntity() {
        Entrega entrega = new Entrega();
        entrega.setData(data);
        entrega.setPeso(peso);
        entrega.setValorTotal(valorTotal);
        entrega.setTaxaServico(taxaServico);
        entrega.setStatus(StatusEntregaEnum.SOLICITADA);
        return entrega;
    }
}
