package com.tech.chegaJa.controller;

import com.tech.chegaJa.service.EmpresaService;
import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.form.EmpresaForm;
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
@RequestMapping("/empresa")
@RequiredArgsConstructor
public class EmpresaController {
    private final EmpresaService service;

    @PostMapping
    public ResponseEntity<EmpresaDto> cadastrar(@RequestBody EmpresaForm form, UriComponentsBuilder uriBuilder){
        EmpresaDto dto = service.cadastrar(form);
        URI uri = uriBuilder.path("/empresa/{id}").buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }
    @GetMapping
    public ResponseEntity<Page<EmpresaDto>> listar(@ParameterObject @PageableDefault(sort = "id")Pageable pageable){
        return ResponseEntity.ok(service.listar(pageable));
    }
    @GetMapping("/{id}")
    public ResponseEntity<EmpresaDto> visualizar(@PathVariable Long id){
        return ResponseEntity.ok(service.visualizar(id));
    }
}
