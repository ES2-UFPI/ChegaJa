package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EnderecoDto;
import com.tech.chegaJa.domain.form.EmpresaForm;
import com.tech.chegaJa.domain.form.EnderecoForm;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.domain.model.Endereco;
import com.tech.chegaJa.repository.EmpresaRepository;
import com.tech.chegaJa.repository.EnderecoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EnderecoService {
    private final EnderecoRepository repository;

    public EnderecoDto cadastrar(EnderecoForm form){
        Endereco endereco = form.toEntity();
        repository.save(endereco);
        return endereco.toDto();
    }
}
