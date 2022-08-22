package com.tech.chegaJa.controller;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EntregaDto;
import com.tech.chegaJa.domain.form.EmpresaForm;
import com.tech.chegaJa.domain.form.EntregaForm;
import com.tech.chegaJa.service.EmpresaService;
import com.tech.chegaJa.service.EntregaService;
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
@RequestMapping("/entregas")
@RequiredArgsConstructor
public class EntregaController {
    private final EntregaService service;

    @PostMapping
    public ResponseEntity<EntregaDto> cadastrar(@RequestBody EntregaForm form, UriComponentsBuilder uriBuilder){
        EntregaDto dto = service.cadastrar(form);
        URI uri = uriBuilder.path("/entregas/{id}").buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }
    @GetMapping
    public ResponseEntity<Page<EntregaDto>> listar(@ParameterObject @PageableDefault(sort = "id") Pageable pageable){
        return ResponseEntity.ok(service.listar(pageable));
    }
    @GetMapping("/{id}")
    public ResponseEntity<EntregaDto> visualizar(@PathVariable Long id){
        return ResponseEntity.ok(service.visualizar(id));
    }
}
