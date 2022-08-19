package com.tech.chegaJa.domain.form;

import com.tech.chegaJa.domain.dto.EntregadorDto;
import com.tech.chegaJa.domain.model.Entregador;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EntregadorForm {
    private String nome;
    private String cpf;
    private BigDecimal pesoMaximo;

    public Entregador toEntity(){
        Entregador entregador = new Entregador();
        entregador.setCnpj(this.cpf);
        entregador.setNome(this.nome);
        entregador.setPesoMaximo(this.pesoMaximo);
        return entregador;
    }
}
