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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@Service
@RequiredArgsConstructor
public class EnderecoService {
    private final EnderecoRepository repository;

    public EnderecoDto cadastrar(EnderecoForm form){
        Endereco endereco = form.toEntity();
        repository.save(endereco);
        return endereco.toDto();
    }
    public Page<EnderecoDto> listar(Pageable paginacao){
        return repository.findAll(paginacao).map(Endereco::toDto);
    }
    public EnderecoDto visualizar(Long id){
        Endereco endereco = verificarExistencia(id);
        return endereco.toDto();
    }
    public Endereco verificarExistencia(Long id) {
        return repository.findById(id).orElseThrow(() -> new EntityNotFoundException("Endereco inexistente"));
    }
}
