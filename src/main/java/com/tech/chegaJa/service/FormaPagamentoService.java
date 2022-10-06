package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EntregadorDto;
import com.tech.chegaJa.domain.dto.FormaPagamentoDto;
import com.tech.chegaJa.domain.form.EntregadorForm;
import com.tech.chegaJa.domain.form.FormaPagamentoForm;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.domain.model.Entregador;
import com.tech.chegaJa.domain.model.FormaPagamento;
import com.tech.chegaJa.repository.EntregadorRepository;
import com.tech.chegaJa.repository.FormaPagamentoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@Service
@RequiredArgsConstructor
public class FormaPagamentoService {
    private final FormaPagamentoRepository repository;
    public FormaPagamentoDto cadastrar(FormaPagamentoForm form){
        FormaPagamento formaPagamento = form.toEntity();
        repository.save(formaPagamento);
        return formaPagamento.toDto();
    }
    public Page<FormaPagamentoDto> listar(Pageable paginacao){
        return repository.findAll(paginacao).map(FormaPagamento::toDto);
    }
    public FormaPagamentoDto visualizar(Long id){
        FormaPagamento formaPagamento = verificarExistencia(id);
        return formaPagamento.toDto();
    }
    public FormaPagamento verificarExistencia(Long id) {
        return repository.findById(id).orElseThrow(() -> new EntityNotFoundException("FormaPagamento inexistente"));
    }
}
