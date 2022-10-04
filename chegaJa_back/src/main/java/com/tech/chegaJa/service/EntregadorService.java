package com.tech.chegaJa.service;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EntregadorDto;
import com.tech.chegaJa.domain.dto.EntregadorLocDto;
import com.tech.chegaJa.domain.form.EmpresaForm;
import com.tech.chegaJa.domain.form.EntregadorForm;
import com.tech.chegaJa.domain.form.EntregadorLocForm;
import com.tech.chegaJa.domain.model.Empresa;
import com.tech.chegaJa.domain.model.Entregador;
import com.tech.chegaJa.repository.EmpresaRepository;
import com.tech.chegaJa.repository.EntregadorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.math.BigDecimal;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class EntregadorService {
    private final EntregadorRepository repository;
    public EntregadorDto cadastrar(EntregadorForm form){
        Entregador entregador = form.toEntity();
        repository.save(entregador);
        return entregador.toDto();
    }
    public Page<EntregadorDto> listar(Pageable paginacao){
        return repository.findAll(paginacao).map(Entregador::toDto);
    }
    public EntregadorDto visualizar(Long id){
        Entregador entregador = verificarExistencia(id);
        return entregador.toDto();
    }
    public Entregador verificarExistencia(Long id) {
        return repository.findById(id).orElseThrow(() -> new EntityNotFoundException("Entregador inexistente"));
    }

    public EntregadorLocDto atualizarLoc(Long id, EntregadorLocForm form) {
        Entregador entregador = verificarExistencia(id);
        entregador.setLatitude(form.getLatitude());
        entregador.setLongitude(form.getLongitude());
        repository.save(entregador);
        return new EntregadorLocDto(entregador.getLatitude(),entregador.getLongitude());
    }

    public Page<EntregadorDto> listarProximos(Pageable pageable, BigDecimal latitude, BigDecimal longitude) {
        List<Entregador> entregadores=repository.findAll();
        entregadores=entregadores.stream().sorted(Comparator.comparing(e -> e.getDistancia(latitude, longitude))).collect(Collectors.toList());
        final int start = (int)pageable.getOffset();
        final int end = Math.min((start + pageable.getPageSize()), entregadores.size());
        Page<Entregador> pagina=new PageImpl<>(entregadores.subList(start,end), pageable, entregadores.size());
        return pagina.map(Entregador::toDto);
    }
}
