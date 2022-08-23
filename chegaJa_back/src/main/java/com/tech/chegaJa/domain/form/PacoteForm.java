package com.tech.chegaJa.domain.form;

import com.tech.chegaJa.domain.enums.StatusEntregaEnum;
import com.tech.chegaJa.domain.model.Pacote;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PacoteForm {
    private String descricao;
    private String codigoConfirmacao;
    @Enumerated(EnumType.STRING)
    private StatusEntregaEnum status;
    private Long idCliente;
    private BigDecimal peso;

    public Pacote toEntity() {
        Pacote pacote = new Pacote();
        pacote.setDescricao(descricao);
        pacote.setCodigoConfirmacao(codigoConfirmacao);
        pacote.setStatus(status);
        pacote.setPeso(peso);
        return pacote;
    }
    //comentario
}
