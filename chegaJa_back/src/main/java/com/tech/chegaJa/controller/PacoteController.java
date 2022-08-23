package com.tech.chegaJa.controller;

import com.tech.chegaJa.domain.dto.EntregaDto;
import com.tech.chegaJa.domain.dto.FormaPagamentoDto;
import com.tech.chegaJa.domain.dto.PacoteDto;
import com.tech.chegaJa.domain.form.FormaPagamentoForm;
import com.tech.chegaJa.domain.form.PacoteForm;
import com.tech.chegaJa.service.FormaPagamentoService;
import com.tech.chegaJa.service.PacoteService;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/pacotes")
@RequiredArgsConstructor
public class PacoteController {
    private final PacoteService service;

    @PostMapping
    public ResponseEntity<PacoteDto> cadastrar(@RequestBody PacoteForm form, UriComponentsBuilder uriBuilder){
        PacoteDto dto = service.cadastrar(form);
        URI uri = uriBuilder.path("/pacotes/{id}").buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }
    @GetMapping
    public ResponseEntity<Page<PacoteDto>> listar(@ParameterObject @PageableDefault(sort = "id") Pageable pageable){
        return ResponseEntity.ok(service.listar(pageable));
    }
    @GetMapping("/{id}")
    public ResponseEntity<PacoteDto> visualizar(@PathVariable Long id){
        return ResponseEntity.ok(service.visualizar(id));
    }
}
