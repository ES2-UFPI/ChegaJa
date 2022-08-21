package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.form.EmpresaForm;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.repository.EmpresaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@RequiredArgsConstructor
@Service
public class EmpresaService {
    private final EmpresaRepository repository;
    public EmpresaDto cadastrar(EmpresaForm form){
        Empresa empresa = form.toEntity();
        repository.save(empresa);
        return empresa.toDto();
    }
    public Page<EmpresaDto> listar(Pageable paginacao){
        return repository.findAll(paginacao).map(Empresa::toDto);
    }
    public EmpresaDto visualizar(Long id){
        Empresa empresa = verificarExistencia(id);
        return empresa.toDto();
    }
    public Empresa verificarExistencia(Long id) {
        return repository.findById(id).orElseThrow(() -> new EntityNotFoundException("Empresa inexistente"));
    }
}
