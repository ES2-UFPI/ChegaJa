package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.ClienteDto;
import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EnderecoDto;
import com.tech.chegaJa.domain.dto.PacoteDto;
import com.tech.chegaJa.domain.form.ClienteForm;
import com.tech.chegaJa.domain.form.PacoteForm;
import com.tech.chegaJa.domain.model.Cliente;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.domain.model.Endereco;
import com.tech.chegaJa.domain.model.Pacote;
import com.tech.chegaJa.repository.ClienteRepository;
import com.tech.chegaJa.repository.EnderecoRepository;
import com.tech.chegaJa.repository.PacoteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@Service
@RequiredArgsConstructor
public class ClienteService {
    private final EnderecoService enderecoService;
    private final ClienteRepository repository;
    public ClienteDto cadastrar(ClienteForm  form){
        Cliente cliente = form.toEntity();
        EnderecoDto endereco = enderecoService.cadastrar(form.getEnderecoForm());
        cliente.setEndereco(enderecoService.verificarExistencia(endereco.getId()));
        repository.save(cliente);
        return cliente.toDto();
    }
    public Page<ClienteDto> listar(Pageable paginacao){
        return repository.findAll(paginacao).map(Cliente::toDto);
    }
    public ClienteDto visualizar(Long id){
        Cliente cliente = verificarExistencia(id);
        return cliente.toDto();
    }
    public Cliente verificarExistencia(Long id) {
        return repository.findById(id).orElseThrow(() -> new EntityNotFoundException("Cliente inexistente"));
    }
}
