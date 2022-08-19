package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.form.EmpresaForm;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.repository.EmpresaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class EmpresaService {
    private final EmpresaRepository repository;

    public EmpresaDto cadastrar(EmpresaForm form){
        Empresa empresa = form.toEntity();
        repository.save(empresa);
        return empresa.toDto();
    }
}
