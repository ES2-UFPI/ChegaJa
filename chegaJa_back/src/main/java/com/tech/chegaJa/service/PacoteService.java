package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.FormaPagamentoDto;
import com.tech.chegaJa.domain.dto.PacoteDto;
import com.tech.chegaJa.domain.form.FormaPagamentoForm;
import com.tech.chegaJa.domain.form.PacoteForm;
import com.tech.chegaJa.domain.model.Cliente;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.domain.model.FormaPagamento;
import com.tech.chegaJa.domain.model.Pacote;
import com.tech.chegaJa.repository.ClienteRepository;
import com.tech.chegaJa.repository.FormaPagamentoRepository;
import com.tech.chegaJa.repository.PacoteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;

@Service
@RequiredArgsConstructor
public class PacoteService  {
    private final PacoteRepository repository;
    private final ClienteRepository clienteRepository;
    public PacoteDto cadastrar(PacoteForm form){
        Pacote pacote = form.toEntity();
        Cliente cliente = clienteRepository.findById(form.getIdCliente()).get();
        pacote.setCliente(cliente);
        repository.save(pacote);
        return pacote.toDto();
    }
    public Page<PacoteDto> listar(Pageable paginacao){
        return repository.findAll(paginacao).map(Pacote::toDto);
    }
    public PacoteDto visualizar(Long id){
        Pacote empresa = verificarExistencia(id);
        return empresa.toDto();
    }
    public Pacote verificarExistencia(Long id) {
        return repository.findById(id).orElseThrow(() -> new EntityNotFoundException("Pacote inexistente"));
    }
}
