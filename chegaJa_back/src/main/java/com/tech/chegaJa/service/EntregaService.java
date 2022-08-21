package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EntregaDto;
import com.tech.chegaJa.domain.dto.EntregadorDto;
import com.tech.chegaJa.domain.form.EntregaForm;
import com.tech.chegaJa.domain.form.EntregadorForm;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.domain.model.Entrega;
import com.tech.chegaJa.domain.model.Entregador;
import com.tech.chegaJa.repository.EmpresaRepository;
import com.tech.chegaJa.repository.EntregaRepository;
import com.tech.chegaJa.repository.EntregadorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@RequiredArgsConstructor
@Service
public class EntregaService {
    private final EntregaRepository repository;
    private final EntregadorRepository entregadorRepository;
    private final EmpresaRepository empresaRepository;
    public EntregaDto cadastrar(EntregaForm form){
        Entrega entrega = form.toEntity();
        Entregador entregador = entregadorRepository.findById(form.getIdEntregador()).get();
        entrega.setEntregador(entregador);
        Empresa empresa = empresaRepository.findById(form.getIdEmpresa()).get();
        entrega.setEmpresa(empresa);
        repository.save(entrega);
        return entrega.toDto();
    }
    public Page<EntregaDto> listar(Pageable paginacao){
        return repository.findAll(paginacao).map(Entrega::toDto);
    }
    public EntregaDto visualizar(Long id){
        Entrega empresa = verificarExistencia(id);
        return empresa.toDto();
    }
    public Entrega verificarExistencia(Long id) {
        return repository.findById(id).orElseThrow(() -> new EntityNotFoundException("Entrega inexistente"));
    }
}
