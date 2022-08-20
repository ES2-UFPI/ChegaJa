package com.tech.chegaJa.controller;

import com.tech.chegaJa.domain.dto.ClienteDto;
import com.tech.chegaJa.domain.dto.PacoteDto;
import com.tech.chegaJa.domain.form.ClienteForm;
import com.tech.chegaJa.domain.form.PacoteForm;
import com.tech.chegaJa.service.ClienteService;
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
@RequestMapping("/clientes")
@RequiredArgsConstructor
public class ClienteController {
    private final ClienteService service;

    @PostMapping
    public ResponseEntity<ClienteDto> cadastrar(@RequestBody ClienteForm form, UriComponentsBuilder uriBuilder){
        ClienteDto dto = service.cadastrar(form);
        URI uri = uriBuilder.path("/clientes/{id}").buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }
}
