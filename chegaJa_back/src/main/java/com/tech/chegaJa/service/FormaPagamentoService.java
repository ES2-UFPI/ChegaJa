package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.EntregadorDto;
import com.tech.chegaJa.domain.dto.FormaPagamentoDto;
import com.tech.chegaJa.domain.form.EntregadorForm;
import com.tech.chegaJa.domain.form.FormaPagamentoForm;
import com.tech.chegaJa.domain.model.Entregador;
import com.tech.chegaJa.domain.model.FormaPagamento;
import com.tech.chegaJa.repository.EntregadorRepository;
import com.tech.chegaJa.repository.FormaPagamentoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FormaPagamentoService {
    private final FormaPagamentoRepository repository;
    public FormaPagamentoDto cadastrar(FormaPagamentoForm form){
        FormaPagamento formaPagamento = form.toEntity();
        repository.save(formaPagamento);
        return formaPagamento.toDto();
    }
}
