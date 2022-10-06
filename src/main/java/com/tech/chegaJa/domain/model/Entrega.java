package com.tech.chegaJa.domain.model;

import com.tech.chegaJa.domain.dto.EntregaDto;
import com.tech.chegaJa.domain.enums.StatusEntregaEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Entrega {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private LocalDate data;
    @Enumerated(EnumType.STRING)
    private StatusEntregaEnum status;
    private BigDecimal valorTotal;
    private BigDecimal taxaServico;
    private BigDecimal peso;
    @ManyToOne(fetch = FetchType.EAGER)
    private Empresa empresa;
    @ManyToOne(fetch = FetchType.EAGER)
    private Entregador entregador;
    @OneToMany(fetch =FetchType.EAGER)
    private List<Pacote> pacotes;
    public EntregaDto toDto() {
        if(entregador!=null) {
            return new EntregaDto(id, data, status, valorTotal, taxaServico, peso, empresa.getId(), entregador.getId());
        }
        else {
            return new EntregaDto(id, data, status, valorTotal, taxaServico, peso, empresa.getId(), null);
        }
    }
}
