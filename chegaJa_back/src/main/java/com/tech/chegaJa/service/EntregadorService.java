package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EntregadorDto;
import com.tech.chegaJa.domain.form.EmpresaForm;
import com.tech.chegaJa.domain.form.EntregadorForm;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.domain.model.Entregador;
import com.tech.chegaJa.repository.EmpresaRepository;
import com.tech.chegaJa.repository.EntregadorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@RequiredArgsConstructor
@Service
public class EntregadorService {
    private final EntregadorRepository repository;
    public EntregadorDto cadastrar(EntregadorForm form){
        Entregador entregador = form.toEntity();
        repository.save(entregador);
        return entregador.toDto();
    }
    public Page<EntregadorDto> listar(Pageable paginacao){
        return repository.findAll(paginacao).map(Entregador::toDto);
    }
    public EntregadorDto visualizar(Long id){
        Entregador entregador = verificarExistencia(id);
        return entregador.toDto();
    }
    public Entregador verificarExistencia(Long id) {
        return repository.findById(id).orElseThrow(() -> new EntityNotFoundException("Entregador inexistente"));
    }
}
