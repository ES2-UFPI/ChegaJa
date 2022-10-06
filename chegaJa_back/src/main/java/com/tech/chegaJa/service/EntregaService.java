package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EntregaDto;
import com.tech.chegaJa.domain.dto.EntregadorDto;
import com.tech.chegaJa.domain.dto.PacoteDto;
import com.tech.chegaJa.domain.form.EntregaForm;
import com.tech.chegaJa.domain.form.EntregaStatusForm;
import com.tech.chegaJa.domain.form.EntregadorForm;
import com.tech.chegaJa.domain.form.PacoteForm;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.domain.model.Entrega;
import com.tech.chegaJa.domain.model.Entregador;
import com.tech.chegaJa.repository.EmpresaRepository;
import com.tech.chegaJa.repository.EntregaRepository;
import com.tech.chegaJa.repository.EntregadorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class EntregaService {
    private final EntregaRepository repository;
    private final EntregadorRepository entregadorRepository;
    private final EmpresaRepository empresaRepository;
    public EntregaDto cadastrar(EntregaForm form){
        Entrega entrega = form.toEntity();
        if(form.getIdEntregador()!=null) {
            Entregador entregador = entregadorRepository.findById(form.getIdEntregador()).get();
            entrega.setEntregador(entregador);
        }
        Empresa empresa = empresaRepository.findById(form.getIdEmpresa()).get();
        entrega.setEmpresa(empresa);
        repository.save(entrega);
        entrega.setPacotes(new ArrayList<>());

        return entrega.toDto();
    }
    public Page<EntregaDto> listar(Pageable paginacao){
        return repository.findAll(paginacao).map(Entrega::toDto);
    }
    public EntregaDto visualizar(Long id){
        Entrega empresa = verificarExistencia(id);
        return empresa.toDto();
    }
    public Entrega verificarExistencia(Long id) {
        return repository.findById(id).orElseThrow(() -> new EntityNotFoundException("Entrega inexistente"));
    }

    public EntregaDto atualizarStatus(Long id, EntregaStatusForm form) {
        Entrega entrega= verificarExistencia(id);
        entrega.setStatus(form.getStatus());
        repository.save(entrega);
        return(entrega.toDto());
    }
    public EntregaDto atualizar(Long id, EntregaForm form) {
        Entrega entrega= verificarExistencia(id);
        if(form.getIdEntregador()!=null){
            Entregador entregador=entregadorRepository.findById(form.getIdEntregador()).get();
            entrega.setEntregador(entregador);
        }
        if(form.getIdEmpresa()!=null){
            Empresa empresa=empresaRepository.findById(form.getIdEmpresa()).get();
            entrega.setEmpresa(empresa);
        }
        if(form.getTaxaServico()!=null)
            entrega.setTaxaServico(form.getTaxaServico());
        if(form.getValorTotal()!=null)
            entrega.setValorTotal(form.getValorTotal());
        repository.save(entrega);
        return(entrega.toDto());
    }

    public Page<EntregaDto> listarPorEmpresa(Pageable pageable, Long idEmpresa) {
        List<Entrega> entregas=repository.findAllByEmpresa_Id(idEmpresa);
        final int start = (int)pageable.getOffset();
        final int end = Math.min((start + pageable.getPageSize()), entregas.size());
        Page<Entrega> pagina=new PageImpl<>(entregas.subList(start,end), pageable, entregas.size());
        return pagina.map(Entrega::toDto);
    }
    public Page<EntregaDto> listarPorEntregador(Pageable pageable, Long idEntregador) {
        List<Entrega> entregas=repository.findAllByEntregador_Id(idEntregador);
        final int start = (int)pageable.getOffset();
        final int end = Math.min((start + pageable.getPageSize()), entregas.size());
        Page<Entrega> pagina=new PageImpl<>(entregas.subList(start,end), pageable, entregas.size());
        return pagina.map(Entrega::toDto);
    }
}
