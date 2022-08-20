package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.ClienteDto;
import com.tech.chegaJa.domain.dto.PacoteDto;
import com.tech.chegaJa.domain.form.ClienteForm;
import com.tech.chegaJa.domain.form.PacoteForm;
import com.tech.chegaJa.domain.model.Cliente;
import com.tech.chegaJa.domain.model.Endereco;
import com.tech.chegaJa.domain.model.Pacote;
import com.tech.chegaJa.repository.ClienteRepository;
import com.tech.chegaJa.repository.EnderecoRepository;
import com.tech.chegaJa.repository.PacoteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ClienteService {
    private final EnderecoRepository endercoRepository;
    private final ClienteRepository repository;
    public ClienteDto cadastrar(ClienteForm  form){
        Cliente cliente = form.toEntity();
        Endereco endereco = endercoRepository.findById(form.getIdEndereco()).get();
        cliente.setEndereco(endereco);
        repository.save(cliente);
        return cliente.toDto();
    }
}
