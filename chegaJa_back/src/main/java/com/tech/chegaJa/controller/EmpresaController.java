package com.tech.chegaJa.controller;

import com.tech.chegaJa.service.EmpresaService;
import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.form.EmpresaForm;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
}
