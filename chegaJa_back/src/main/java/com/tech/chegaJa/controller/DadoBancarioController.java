package com.tech.chegaJa.controller;

import com.tech.chegaJa.domain.dto.DadosBancariosDto;
import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.form.DadoBancarioForm;
import com.tech.chegaJa.domain.form.EmpresaForm;
import com.tech.chegaJa.service.DadoBancarioService;
import com.tech.chegaJa.service.EmpresaService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/dado-bancario")
@RequiredArgsConstructor
public class DadoBancarioController {
    private final DadoBancarioService service;

    @PostMapping
    public ResponseEntity<DadosBancariosDto> cadastrar(@RequestBody DadoBancarioForm form, UriComponentsBuilder uriBuilder){
        DadosBancariosDto dto = service.cadastrar(form);
        URI uri = uriBuilder.path("/dados-bancarios/{id}").buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }
}
