package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.DadosBancariosDto;
import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EnderecoDto;
import com.tech.chegaJa.domain.form.DadoBancarioForm;
import com.tech.chegaJa.domain.form.EnderecoForm;
import com.tech.chegaJa.domain.model.DadosBancario;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.domain.model.Endereco;
import com.tech.chegaJa.repository.DadoBancarioRepository;
import com.tech.chegaJa.repository.EnderecoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@RequiredArgsConstructor
@Service
public class DadoBancarioService {
    private final DadoBancarioRepository repository;

    public DadosBancariosDto cadastrar(DadoBancarioForm form){
        DadosBancario dadosBancario = form.toEntity();
        repository.save(dadosBancario);
        return dadosBancario.toDto();
    }
    public Page<DadosBancariosDto> listar(Pageable paginacao){
        return repository.findAll(paginacao).map(DadosBancario::toDto);
    }
    public DadosBancariosDto visualizar(Long id){
        DadosBancario empresa = verificarExistencia(id);
        return empresa.toDto();
    }
    public DadosBancario verificarExistencia(Long id) {
        return repository.findById(id).orElseThrow(() -> new EntityNotFoundException("Dados Bancario inexistente"));
    }
}
