package com.tech.chegaJa.controller;

import com.tech.chegaJa.domain.dto.FormaPagamentoDto;
import com.tech.chegaJa.domain.dto.PacoteDto;
import com.tech.chegaJa.domain.form.FormaPagamentoForm;
import com.tech.chegaJa.domain.form.PacoteForm;
import com.tech.chegaJa.service.FormaPagamentoService;
import com.tech.chegaJa.service.PacoteService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
}
