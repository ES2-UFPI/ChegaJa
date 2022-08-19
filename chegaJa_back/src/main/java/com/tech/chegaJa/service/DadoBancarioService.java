package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.DadosBancariosDto;
import com.tech.chegaJa.domain.dto.EnderecoDto;
import com.tech.chegaJa.domain.form.DadoBancarioForm;
import com.tech.chegaJa.domain.form.EnderecoForm;
import com.tech.chegaJa.domain.model.DadosBancario;
import com.tech.chegaJa.domain.model.Endereco;
import com.tech.chegaJa.repository.DadoBancarioRepository;
import com.tech.chegaJa.repository.EnderecoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class DadoBancarioService {
    private final DadoBancarioRepository repository;

    public DadosBancariosDto cadastrar(DadoBancarioForm form){
        DadosBancario dadosBancario = form.toEntity();
        repository.save(dadosBancario);
        return dadosBancario.toDto();
    }
}
